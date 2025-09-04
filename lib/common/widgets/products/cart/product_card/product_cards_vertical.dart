import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';
import 'package:online_shop/common/widgets/Images/roundedImage.dart';
import 'package:online_shop/common/widgets/custom_shapes/rounded_container.dart';
import 'package:online_shop/common/widgets/icons/circular_icon.dart';
import 'package:online_shop/features/shop/screens/product_details/product_details.dart';
import 'package:online_shop/utile/const/colors.dart';
import 'package:online_shop/utile/const/image.dart';
import 'package:online_shop/utile/helpers/helper_functions.dart';
import '../../../../../utile/const/sizes.dart';
import '../../../style/Shadow.dart';
import '../../../text/brandTitleWithVerifyIcon.dart';
import '../../../text/productText.dart';
import '../../../text/product_price.dart';

class MyProductCardVertical extends StatelessWidget {
  const MyProductCardVertical({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = MyHeplerFunction.isDarkMode(context);
    return GestureDetector(
      onTap: () {
        Get.to(()=>prodcut_details());
      },
      child: Container(
        width: 180,
        padding: EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: MyShadow.verticalProductShadow,
          borderRadius: BorderRadius.circular(Mysize.productImageRadius),
          color: dark ? Mycolors.darkerGrey : Mycolors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyRoundedContainer(
              height: 180,
              padding: EdgeInsets.all(Mysize.sm),
              backgroundColor: dark ? Mycolors.dark : Mycolors.light,
              child: Stack(
                children: [
                  Center(child: MyRoundedImge(imageUrl: MyImage.productImage15)),
                  Positioned(
                    top: 0,
                    child: MyRoundedContainer(
                      radius: Mysize.sm,
                      backgroundColor: Mycolors.yellow.withValues(alpha: .8),
                      padding: EdgeInsets.symmetric(
                        horizontal: Mysize.sm,
                        vertical: Mysize.xs,
                      ),
                      child: Text(
                        "20%",
                        style: Theme.of(
                          context,
                        ).textTheme.labelLarge!.apply(color: Mycolors.black),
                      ),
                    ),
                  ),
                  Positioned(
                    right: -5,
                    top: -10,
                    child: MyCircularIcon(icon: Iconsax.heart),
                  ),
                ],
              ),
            ),
            SizedBox(height: Mysize.spaceBtwItems / 2),

            Padding(
              padding: const EdgeInsets.only(left: Mysize.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyProducttitleText(title: "Blue Bata Shoe", smallSize: true),
                  SizedBox(height: Mysize.spaceBtwItems / 2),
                  MyBrandTittleWithVerifyIcon(title: 'Bata',),
                ],
              ),
            ),
            Spacer(),
            Padding(
              padding: EdgeInsets.only(left: Mysize.sm),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MyProductPriceText(price: "76"),
                  Container(
                    width: Mysize.iconLg * 1.2,
                    height: Mysize.iconLg * 1.2,
                    decoration: BoxDecoration(
                      color: Mycolors.primary,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(Mysize.cardRadiusMd),
                        bottomRight: Radius.circular(Mysize.productImageRadius),
                      ),
                    ),
                    child: Icon(Iconsax.add, color: Mycolors.white),
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}




