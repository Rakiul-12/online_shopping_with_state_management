import 'package:flutter/cupertino.dart';
import 'package:online_shop/features/shop/models/productModel.dart';
import '../../../../../common/brands/MyBrandShowCase.dart';
import '../../../../../common/widgets/layouts/grid_layout.dart';
import '../../../../../common/widgets/products/cart/product_card/product_cards_vertical.dart';
import '../../../../../common/widgets/text/sectionHeading.dart';
import '../../../../../utile/const/image.dart';
import '../../../../../utile/const/sizes.dart';

class MyCatagoryTab extends StatelessWidget {
  const MyCatagoryTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Mysize.defaultSpace,
          ),
          child: Column(
            children: [
              MyBrandShowcase(
                image: [
                  MyImage.productImage47,
                  MyImage.productImage43,
                  MyImage.productImage7,
                ],
              ),
              MyBrandShowcase(
                image: [
                  MyImage.productImage47,
                  MyImage.productImage43,
                  MyImage.productImage7,
                ],
              ),
              SizedBox(height: Mysize.spaceBtwItems,),
              MySectionHeading(title: "You might like", onPressed: (){}),
              MyGridLayout(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return MyProductCardVertical(product: ProductModel.empty());
                },
              ),
              SizedBox(height: Mysize.spaceBtwItems,)
            ],
          ),
        ),
      ],
    );
  }
}