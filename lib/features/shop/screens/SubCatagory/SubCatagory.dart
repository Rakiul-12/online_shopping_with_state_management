import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_shop/common/widgets/AppBar/CustomAppbar.dart';
import 'package:online_shop/common/widgets/shimmer/horizontalProductShimmer.dart';
import 'package:online_shop/common/widgets/style/padding.dart';
import 'package:online_shop/common/widgets/text/sectionHeading.dart';
import 'package:online_shop/features/shop/controller/category/categoryController.dart';
import 'package:online_shop/features/shop/models/catagoryModel.dart';
import 'package:online_shop/features/shop/models/productModel.dart';
import 'package:online_shop/features/shop/screens/all_Products/AllProducts.dart';
import 'package:online_shop/utile/const/sizes.dart';
import 'package:online_shop/utile/helpers/cloudHelperFunction.dart';
import '../../../../common/widgets/products/cart/product_card/ProductCartHorizontal.dart';

class subCatagory extends StatelessWidget {
  const subCatagory({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = categoryController.instance;
    return Scaffold(
      appBar: MyAppbar(
        showBackArrow: true,
        title: Text(
          category.name,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: MyPadding.screenPadding,
          child: FutureBuilder(
              future: controller.getSubCategory(category.id),
              builder: (context, snapshot) {

                final loader = MyHorizontalProductShimmer();
                final widget = myCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot,loader: loader);
                if(widget != null) return widget;
                List<CategoryModel> subCategories = snapshot.data!;
                return ListView.builder(
                  shrinkWrap: true,
                    itemCount: subCategories.length,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                    CategoryModel subCategory = subCategories[index];
                     return FutureBuilder(
                         future: controller.getCategoryProducts(categoryId: subCategory.id),
                         builder: (context, snapshot) {

                           final loader = MyHorizontalProductShimmer();
                           final widget = myCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot,loader: loader);
                           if(widget != null) return widget;

                           List<ProductModel> products = snapshot.data!;
                           return Column(
                             children: [
                               MySectionHeading(title:subCategory.name, onPressed: () =>
                                   Get.to(()=>AllProdcuts(
                                       title:subCategory.name,
                                     futureMethod: controller.getCategoryProducts(categoryId: subCategory.id,limit: -1),
                                   ))),
                               SizedBox(height: Mysize.spaceBtwItems / 2),
                               SizedBox(
                                 height: 120,
                                 child: ListView.separated(
                                   scrollDirection: Axis.horizontal,
                                   itemBuilder: (context, index) {
                                     ProductModel product = products[index];
                                     return NewCartProductHorizontal(product: product,);
                                   },
                                   itemCount: products.length,
                                   separatorBuilder: (context, index) =>
                                       SizedBox(width: Mysize.spaceBtwItems / 2,),
                                 ),
                               ),
                             ],
                           );
                         },
                     );
                    },
                );
              },
          ),
        ),
      ),
    );
  }
}
