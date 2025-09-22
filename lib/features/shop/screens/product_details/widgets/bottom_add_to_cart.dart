import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:online_shop/common/widgets/icons/circular_icon.dart';
import 'package:online_shop/features/shop/controller/cart/cartController.dart';
import 'package:online_shop/features/shop/models/productModel.dart';
import 'package:online_shop/utile/const/colors.dart';
import 'package:online_shop/utile/const/sizes.dart';
import 'package:online_shop/utile/helpers/helper_functions.dart';

class addToCartSection extends StatelessWidget {
  const addToCartSection({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    bool dark = MyHelperFunction.isDarkMode(context);
    final controller = CartController.instance;
    controller.updateAlreadyAddedProductCount(product);
    return Container(
      decoration: BoxDecoration(
        color: dark ? Mycolors.darkerGrey : Mycolors.light,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(Mysize.cardRadiusLg),
          topRight: Radius.circular(Mysize.cardRadiusLg),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: Mysize.defaultSpace,
          vertical: Mysize.defaultSpace / 2,
        ),
        child: Obx(
          ()=> Row(
            children: [
              MyCircularIcon(
                icon: Iconsax.minus,
                backgroundColor: Mycolors.darkGrey,
                width: 40,
                height: 40,
                color: Mycolors.white,
                onPressed:
                controller.productQuantityInCart.value < 1 ? null : ()=> controller.productQuantityInCart.value -=1,
              ),
              SizedBox(width: Mysize.spaceBtwItems),
              Text(controller.productQuantityInCart.value.toString(), style: Theme.of(context).textTheme.titleSmall),
              SizedBox(width: Mysize.spaceBtwItems),
              MyCircularIcon(
                icon: Iconsax.add,
                backgroundColor: Mycolors.black,
                width: 40,
                height: 40,
                color: Mycolors.white,
                onPressed: ()=>controller.productQuantityInCart.value +=1,
              ),
              Spacer(),
              ElevatedButton(
                onPressed: controller.productQuantityInCart.value < 1 ? null : ()=>controller.addToCart(product),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(Mysize.md),
                  backgroundColor: Mycolors.black,
                  side: BorderSide(color: Mycolors.black),
                ),
                child: Row(
                  children: [
                    Icon(Iconsax.shopping_bag),
                    SizedBox(width: Mysize.spaceBtwItems / 2),
                    Text("Add to cart"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
