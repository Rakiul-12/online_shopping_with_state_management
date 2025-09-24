import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:online_shop/common/widgets/shimmer/MyVerticalProductShimmer.dart';
import 'package:online_shop/features/shop/controller/category/categoryController.dart';
import 'package:online_shop/features/shop/models/catagoryModel.dart';
import 'package:online_shop/features/shop/screens/all_Products/AllProducts.dart';
import 'package:online_shop/features/shop/screens/shop/widgets/categoryBrands.dart';
import 'package:online_shop/utile/helpers/cloudHelperFunction.dart';
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
                      futureMethod: controller.getCategoryProducts(categoryId: category.id,limit: -1),
                    )),

              ),
              FutureBuilder(
                  future: controller.getCategoryProducts(categoryId: category.id,),
                  builder: (context, snapshot) {

                    final loader = MyVerticalProductShimmer();
                    final widget = myCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot,loader: loader);
                    if(widget != null) return widget;
                    final products =snapshot.data!;

                    return MyGridLayout(
                      itemCount: products.length,
                      itemBuilder: (context, index) {
                        final product = products[index];
                        return MyProductCardVertical(product: product);
                      },
                    );
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
