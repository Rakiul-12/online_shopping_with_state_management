import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:online_shop/features/shop/controller/category/categoryController.dart';
import 'package:online_shop/features/shop/models/catagoryModel.dart';
import 'package:online_shop/features/shop/models/productModel.dart';
import 'package:online_shop/features/shop/screens/all_Products/AllProducts.dart';
import 'package:online_shop/features/shop/screens/shop/widgets/categoryBrands.dart';
import '../../../../../common/widgets/layouts/grid_layout.dart';
import '../../../../../common/widgets/products/cart/product_card/product_cards_vertical.dart';
import '../../../../../common/widgets/text/sectionHeading.dart';
import '../../../../../utile/const/sizes.dart';

class MyCatagoryTab extends StatelessWidget {
  const MyCatagoryTab({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = categoryController.instance;
    return ListView(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: Mysize.defaultSpace),
          child: Column(
            children: [
              categoryBrands(category: category),
              SizedBox(height: Mysize.spaceBtwItems),
              MySectionHeading(
                title: "You might like",
                onPressed: () =>
                    Get.to(() => AllProdcuts(
                        title: category.name,
                    )),

              ),
              MyGridLayout(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return MyProductCardVertical(product: ProductModel.empty());
                },
              ),
              SizedBox(height: Mysize.spaceBtwItems),
            ],
          ),
        ),
      ],
    );
  }
}
