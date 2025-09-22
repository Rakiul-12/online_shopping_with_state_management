import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';
import 'package:online_shop/features/shop/controller/cart/cartController.dart';
import 'package:online_shop/features/shop/models/cartItemModel.dart';
import 'package:online_shop/features/shop/models/productModel.dart';
import 'package:online_shop/features/shop/screens/product_details/product_details.dart';
import 'package:online_shop/utile/const/enums.dart';
import 'package:online_shop/utile/popup/snackbarHelpers.dart';
import '../../../utile/const/colors.dart';
import '../../../utile/const/sizes.dart';

class AddToCartButton extends StatelessWidget {
  const AddToCartButton({super.key, required this.product});

  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    final controller = CartController.instance;
    return InkWell(
      onTap: (){
        if(product.productType == ProductType.single.toString()){
          CartItemModel cartItem = controller.convertToCartItem(product,1);
          controller.addOneItemToCart(cartItem);
        }else{
          Get.to(()=> prodcut_details(product: product));
          MySnackBarHelpers.customToast(message: "Check the variation of this product");
        }
      },
      child: Obx(
        (){
          int productQuantityInCart = controller.getProductQuantityInCart(product.id);
          return Container(
            width: Mysize.iconLg * 1.2,
            height: Mysize.iconLg * 1.2,
            decoration: BoxDecoration(
              color: productQuantityInCart > 0 ? Mycolors.dark : Mycolors.primary,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(Mysize.cardRadiusMd),
                bottomRight: Radius.circular(Mysize.productImageRadius),
              ),
            ),
            child: Center(
              child: productQuantityInCart > 0 ? Text(productQuantityInCart.toString(),style: Theme.of(context).textTheme.titleLarge!.apply(color: Mycolors.white)) : Icon(Iconsax.add, color: Mycolors.white),
            )
          );
        }
      ),
    );
  }
}
