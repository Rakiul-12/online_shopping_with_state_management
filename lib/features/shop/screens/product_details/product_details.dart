import 'package:flutter/material.dart';
import 'package:online_shop/common/widgets/Button/elevatedButton.dart';
import 'package:online_shop/common/widgets/style/padding.dart';
import 'package:online_shop/common/widgets/text/sectionHeading.dart';
import 'package:online_shop/features/shop/models/productModel.dart';
import 'package:online_shop/features/shop/screens/product_details/widgets/MyProductMetaDeta.dart';
import 'package:online_shop/features/shop/screens/product_details/widgets/MyProductThumbnailSlider.dart';
import 'package:online_shop/features/shop/screens/product_details/widgets/ProductAttributes.dart';
import 'package:online_shop/features/shop/screens/product_details/widgets/bottom_add_to_cart.dart';
import 'package:online_shop/utile/const/enums.dart';
import 'package:online_shop/utile/const/sizes.dart';
import 'package:readmore/readmore.dart';

class prodcut_details extends StatelessWidget {
  const prodcut_details({super.key, required this.product});


  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    // final dark = MyHelperFunction.isDarkMode(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            MyProductThumbnailSlider(product: product,),
            Padding(
              padding: MyPadding.screenPadding,
              child: Column(
                children: [
                  MyProductMetaDeta(product: product),
                  SizedBox(height: Mysize.spaceBtwItems),
                  if(product.productType == ProductType.variable.toString())...[
                    productAttributes(product: product),
                    SizedBox(height: Mysize.spaceBtwSections,),
                  ],

                  MyElevatedButton(onPressed: (){}, child: Text("Checkout")),
                  SizedBox(height: Mysize.spaceBtwSections,),
                  MySectionHeading(title: "Description :",showActionBtn: false,),
                  SizedBox(height: Mysize.sm,),
                  ReadMoreText(
                    product.description ?? "",
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




