import 'package:get/get.dart';
import 'package:online_shop/features/shop/controller/cart/cartController.dart';
import 'package:online_shop/features/shop/controller/productController/imageController.dart';
import 'package:online_shop/features/shop/models/productModel.dart';
import 'package:online_shop/features/shop/models/productVariationModel.dart';

class variationController extends GetxController {
  static variationController get instance => Get.find();

  RxMap selectedAttributes = {}.obs;
  Rx<ProductVariationModel> selectedVariation = ProductVariationModel.empty().obs;
  RxString variationStockStatus = ''.obs;


  // selected attribute and variation
  void onAttributeSelected(ProductModel product, attributeName,
      attributeValue) {
    Map<String, dynamic> selectedAttributes = Map<String, dynamic>.from(
        this.selectedAttributes);
    selectedAttributes[attributeName] = attributeValue;
    this.selectedAttributes[attributeName] = attributeValue;
    // get selected variation
    ProductVariationModel selectedVariation = product.productVariations!
        .firstWhere((variation) =>
        isSameAttributeValues(variation.attributeValues, selectedAttributes),orElse: ()=>ProductVariationModel.empty());

    // show the selected variation image as main image
    if (selectedVariation.image.isNotEmpty) {
      imageController.instance.selectedProductImage.value =
          selectedVariation.image;
    }

    if(selectedVariation.id.isNotEmpty){
      final cartController = CartController.instance;
      cartController.productQuantityInCart.value = cartController.getVariationQuantityInCart(product.id, selectedVariation.id);
    }

    // assign selected variation to Rx variable
    this.selectedVariation(selectedVariation);
    getProductVariationStockStatus();
  }


  // check if selected attributes matches any variation attributes
  bool isSameAttributeValues(Map<String, dynamic> variationAttributes,
      Map<String, dynamic> selectedAttributes) {
    // if selectedAttributes contains 3 attributes and current variation contains 2 then return
    if (variationAttributes.length != selectedAttributes.length) return false;

    for (final key in variationAttributes.keys) {
      if (variationAttributes[key] != selectedAttributes[key]) return false;
    }
    return true;
  }

  Set<String?>getAttributesAvailabilityInVariation(List<ProductVariationModel> variations,
      String attributeName) {
    // pass the variation to check which attributed are available and stock is not 0
    final availableAttributesValues = variations.where((variation) =>
    variation.attributeValues[attributeName]!.isNotEmpty &&
        variation.attributeValues[attributeName] != null && variation.stock > 0).map((variation) =>
    variation.attributeValues[attributeName]).toSet();
    return availableAttributesValues;
  }

  // calculate product variation price
  String getVariationPrice(){
    return (selectedVariation.value.salePrice > 0 ?
    selectedVariation.value.salePrice :
    selectedVariation.value.price).toStringAsFixed(0);
  }

  // check product variation stock status
  void getProductVariationStockStatus() {
    variationStockStatus.value =
    selectedVariation.value.stock > 0 ? "In Stock" : "Out of Stock";
  }

  // reset selected attributes when switching products
  void resetSelectedAttributes(){
    selectedAttributes.clear();
    variationStockStatus.value = '';
    selectedVariation.value = ProductVariationModel.empty();
  }

}