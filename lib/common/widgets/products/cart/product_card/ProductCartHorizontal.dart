import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:online_shop/common/widgets/products/favourite/favouriteIcon.dart';
import 'package:online_shop/common/widgets/text/brandTitleWithVerifyIcon.dart';
import 'package:online_shop/common/widgets/text/productText.dart';
import 'package:online_shop/common/widgets/text/product_price.dart';
import 'package:online_shop/features/shop/models/productModel.dart';
import '../../../../../features/shop/controller/productController/productController.dart';
import '../../../../../features/shop/screens/product_details/product_details.dart';
import '../../../../../utile/const/colors.dart';
import '../../../../../utile/const/image.dart';
import '../../../../../utile/const/sizes.dart';
import '../../../../../utile/helpers/helper_functions.dart';
import '../../../Images/roundedImage.dart';
import '../../../custom_shapes/rounded_container.dart';
import '../../../icons/circular_icon.dart';

class NewCartProductHorizontal extends StatelessWidget {
  const NewCartProductHorizontal({
    super.key, required this.product,
  });


  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    final dark = MyHelperFunction.isDarkMode(context);
    final controller = productController.instance;
    String? salePercentage = controller.calculateSalePercentage(product.price, product.salePrice);
    return GestureDetector(
      onTap: () {
        Get.to(()=>prodcut_details(product: product));
      },
      child: Container(
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
                      imageUrl: product.thumbnail,
                      isNetworkImage: true,
                    ),
                  ),
                  if(salePercentage != null)
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
                        "$salePercentage%",
                        style: Theme.of(
                          context,
                        ).textTheme.labelLarge!.apply(color: Mycolors.black),
                      ),
                    ),
                  ),
                  Positioned(
                    right: -5,
                    top: -10,
                    child: FavouriteIcon(productId: product.id),
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
                        MyProducttitleText(title: product.title),
                        SizedBox(height: Mysize.spaceBtwItems/2),
                        MyBrandTittleWithVerifyIcon(title: product.brand!.name)
                      ],
                    ),
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(child: MyProductPriceText(price:  controller.getProductPrice(product))),
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

      ),
    );
  }
}
