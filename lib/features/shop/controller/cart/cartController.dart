import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:online_shop/data/repository/authentication_repo.dart';
import 'package:online_shop/features/shop/controller/productController/variationController.dart';
import 'package:online_shop/features/shop/models/cartItemModel.dart';
import 'package:online_shop/features/shop/models/productModel.dart';
import 'package:online_shop/features/shop/models/productVariationModel.dart';
import 'package:online_shop/utile/const/enums.dart';
import 'package:online_shop/utile/const/keys.dart';
import 'package:online_shop/utile/popup/snackbarHelpers.dart';

class CartController extends GetxController{
  static CartController get instance => Get.find();


  final _storage = GetStorage(AuthenticationRepository.instance.currentUser!.uid);
  RxInt noOfCartItem = 0.obs;
  RxDouble totalCartPrice = 0.0.obs;
  RxInt productQuantityInCart = 0.obs;
  RxList<CartItemModel> cartItems = <CartItemModel>[].obs;
  final VariationController = variationController.instance;


  // for see the already buy items
  CartController(){
    loadCartItems();
  }

  // load all cart items from local storage
  void loadCartItems() {
    List<dynamic>? storedCartItems = _storage.read(MyKeys.cartItemsKey);
    if (storedCartItems != null) {
      List<CartItemModel> loadedItems = storedCartItems.map((item) {
        if (item is Map<String, dynamic>) {
          return CartItemModel.fromJson(item);
        } else {
          return CartItemModel.fromJson(Map<String, dynamic>.from(item as Map));
        }
      }).toList();

      // Assign to cartItems
      cartItems.assignAll(loadedItems);

      // Debug print
      print("Loaded cart items: $loadedItems");

      // Update totals
      updateCartTotals();
    } else {
      print("No items found in storage");
    }
  }


  // add items in the cart
  void addToCart(ProductModel product){

    // check quantity of the product
    if(productQuantityInCart < 1){
      MySnackBarHelpers.customToast(message: "Select Quantity");
      return;
    }

    // check variation of product if it is variable product
    if(product.productType == ProductType.variable.toString() && VariationController.selectedVariation.value.id.isEmpty){
      MySnackBarHelpers.customToast(message: "Selected Variation");
      return;
    }

    // out of stock status
    if(product.productType == ProductType.variable.toString()){
      if(VariationController.selectedVariation.value.stock < 1 ){
        MySnackBarHelpers.warningSnackBar(title: "Out Of Stock",message: "This variation is out of stock");
        return;
      }
    }else{
      if(product.stock < 1){
        MySnackBarHelpers.warningSnackBar(title: "Out Of Stock",message: "This product is out of stock");
      }
    }

    // covert product model to cart item model
    CartItemModel selectedCartItem = convertToCartItem(product, productQuantityInCart.value);
    
    // check if already in the cart
    int index = cartItems.indexWhere((cartItem) => cartItem.productId == selectedCartItem.productId && selectedCartItem.variationId == cartItem.variationId);
    if(index >= 0){
      // this quantity is already added or update/remove from the cart
      cartItems[index].quantity = selectedCartItem.quantity;
    }else{
      cartItems.add(selectedCartItem);
    }

    updateCart();
    MySnackBarHelpers.customToast(message: "Your product has been added to the cart");
  }

  // add one item to cart
  void addOneItemToCart(CartItemModel item){
    int index = cartItems.indexWhere((cartItem) => item.productId == cartItem.productId && item.variationId == cartItem.variationId);
    if(index >= 0){
      cartItems[index].quantity += 1;
    }else{
      cartItems.add(item);
    }
    updateCart();
  }

  // remove one item to cart
  void removeOneItemToCart(CartItemModel item){
    int index = cartItems.indexWhere((cartItem) => item.productId == cartItem.productId && item.variationId == cartItem.variationId);
    if(index >= 0){
      if(cartItems[index].quantity > 1){
        cartItems[index].quantity -= 1;
      }else{
        cartItems[index].quantity == 1 ? removeFromCartDialog(index) : cartItems.removeAt(index);
      }
    }
    updateCart();
  }

  // show dialog to remove item from the cart
  void removeFromCartDialog(int index){
    Get.defaultDialog(
        title: "Remove Product",
        middleText: "Are you sure you want to remove this product",
        onConfirm: (){
          cartItems.removeAt(index);
          updateCart();
          MySnackBarHelpers.customToast(message: "Product removed from the cart");
          Get.back();
        },
        onCancel: (){}
    );
  }

  // get total quantity of same specific product
  int getProductQuantityInCart(String productId){
    final itemQuantity = cartItems.where((cartItem) => cartItem.productId == productId).fold(
        0, (previousValue, cartItem) => previousValue + cartItem.quantity
    );
    return itemQuantity;
  }

  // get variation quantity of product
  int getVariationQuantityInCart(String productId, String variationId){
    CartItemModel cartItemModel = cartItems.firstWhere((item) => item.productId == productId && item.variationId == variationId,
        orElse: ()=>CartItemModel.empty()
    );
    return cartItemModel.quantity;
  }

  // updateCart
  void updateCart(){
    updateCartTotals();
    saveCartItem();
    cartItems.refresh();
  }

  // save cart item to local storage
  void saveCartItem(){
    List<Map<String, dynamic>> cartItemsList = cartItems.map((item) => item.toJson()).toList();
    // print("Saved item : $cartItemsList");
    _storage.write(MyKeys.cartItemsKey, cartItemsList);
  }

  // update total price and number of cart items in the cart
  void updateCartTotals(){
    double calculateTotalPrice = 0.0;
    int calculateNumberOfCartItem = 0;

    for(final item in cartItems){
      calculateTotalPrice += (item.price) * item.quantity.toDouble();
      calculateNumberOfCartItem += item.quantity;
    }
    totalCartPrice.value = calculateTotalPrice;
    noOfCartItem.value = calculateNumberOfCartItem;
  }

  // convert product model to cart item model
  CartItemModel convertToCartItem (ProductModel product, int quantity){
    if(product.productType == ProductType.single.toString()){
      // reset variation in case of single product type
      VariationController.resetSelectedAttributes();
    }
    ProductVariationModel variation = VariationController.selectedVariation.value;
    bool isVariation = variation.id.isNotEmpty;
    String image = isVariation ? variation.image : product.thumbnail;
    double price = isVariation ? variation.salePrice >  0.0 ? variation.salePrice : variation.price
        : product.salePrice > 0.0 ? product.salePrice : product.price;

    return CartItemModel(
        productId: product.id,
        quantity: quantity,
        title: product.title,
        brandName:  product.brand != null ? product.brand!.name : '',
        image: image,
        price: price,
        selectedVariation: isVariation ? variation.attributeValues : null,
        variationId: variation.id

    );
  }

  // clear the cart
  void clearCart(){
    productQuantityInCart.value = 0;
    cartItems.clear();
    updateCart();
  }

  // initialize already added items count in the cart
  void updateAlreadyAddedProductCount(ProductModel product){
    if(product.productType == ProductType.single.toString()){
      productQuantityInCart.value = getProductQuantityInCart(product.id);
    }else{
      String variationId = VariationController.selectedVariation.value.id;
      if(variationId.isNotEmpty){
        productQuantityInCart.value = getVariationQuantityInCart(product.id, variationId);
      }else{
        productQuantityInCart.value = 0;
      }
    }
  }




}