import 'package:flutter/material.dart';
import 'package:online_shop/common/widgets/Button/elevatedButton.dart';
import 'package:online_shop/common/widgets/style/padding.dart';
import 'package:online_shop/common/widgets/text/sectionHeading.dart';
import 'package:online_shop/features/shop/screens/product_details/widgets/MyProductMetaDeta.dart';
import 'package:online_shop/features/shop/screens/product_details/widgets/MyProductThumbnailSlider.dart';
import 'package:online_shop/features/shop/screens/product_details/widgets/ProductAttributes.dart';
import 'package:online_shop/features/shop/screens/product_details/widgets/bottom_add_to_cart.dart';
import 'package:online_shop/utile/const/sizes.dart';
import 'package:online_shop/utile/helpers/helper_functions.dart';
import 'package:readmore/readmore.dart';

class prodcut_details extends StatelessWidget {
  const prodcut_details({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = MyHeplerFunction.isDarkMode(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            MyProductThumbnailSlider(),
            Padding(
              padding: MyPadding.screenPadding,
              child: Column(
                children: [
                  MyProductMetaDeta(),
                  SizedBox(height: Mysize.spaceBtwItems,),
                  productAttributes(),
                  SizedBox(height: Mysize.spaceBtwSections,),
                  MyElevatedButton(onPressed: (){}, child: Text("Checkout")),
                  SizedBox(height: Mysize.spaceBtwSections,),
                  MySectionHeading(title: "Description :",showActionBtn: false,),
                  SizedBox(height: Mysize.sm,),
                  ReadMoreText(
                    "The iPhone is a line of smartphones designed and sold by Apple Inc."
                        " It was first introduced in 2007 by Steve Jobs"
                        " and has since become one of the most popular"
                        " smartphones in the world.Known for its premium build quality,"
                        " sleek design, and minimalistic look",
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: " Show more",
                    trimExpandedText: " Less",
                    moreStyle: TextStyle(fontSize: 14,fontWeight: FontWeight.w800),
                    lessStyle: TextStyle(fontSize: 14,fontWeight: FontWeight.w800),
                  ),
                  SizedBox(height: Mysize.spaceBtwSections,),
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: addToCartSection(),

    );
  }
}




