import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:online_shop/common/widgets/text/brandTitleWithVerifyIcon.dart';
import 'package:online_shop/common/widgets/text/productText.dart';
import 'package:online_shop/common/widgets/text/product_price.dart';
import '../../../../../utile/const/colors.dart';
import '../../../../../utile/const/image.dart';
import '../../../../../utile/const/sizes.dart';
import '../../../../../utile/helpers/helper_functions.dart';
import '../../../Images/roundedImage.dart';
import '../../../custom_shapes/rounded_container.dart';
import '../../../icons/circular_icon.dart';

class NewCartProductHorizontal extends StatelessWidget {
  const NewCartProductHorizontal({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final dark = MyHelperFunction.isDarkMode(context);
    return Container(
      width: 310,
      padding: EdgeInsets.all(1),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          Mysize.productImageRadius,
        ),
        color: dark ? Mycolors.darkerGrey : Mycolors.white,
      ),
      child: Row(
        children: [
          MyRoundedContainer(
            height: 120,
            padding: EdgeInsets.all(Mysize.sm),
            backgroundColor: dark ? Mycolors.dark : Mycolors.light,
            child: Stack(
              children: [
                SizedBox(
                  width : 120,
                  height: 120,
                  child: MyRoundedImge(
                    imageUrl: MyImage.productImage4a,
                  ),
                ),
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
                )
              ],
            ),
          ),
          SizedBox(
            width: 170.0,
            child: Padding(
              padding: const EdgeInsets.only(left: Mysize.sm,top: Mysize.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MyProducttitleText(title: "iPhone 11 with 64 GB",),
                      SizedBox(height: Mysize.spaceBtwItems/2),
                      MyBrandTittleWithVerifyIcon(title: "Apple")
                    ],
                  ),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(child: MyProductPriceText(price: "399 - \$599")),
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
                  )
                ],
              )
            ),
          )
        ],
      ),

    );
  }
}
