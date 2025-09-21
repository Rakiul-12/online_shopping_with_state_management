import 'package:flutter/material.dart';
import 'package:online_shop/common/widgets/AppBar/CustomAppbar.dart';
import 'package:online_shop/common/widgets/style/padding.dart';
import 'package:online_shop/common/widgets/text/sectionHeading.dart';
import 'package:online_shop/features/shop/controller/category/categoryController.dart';
import 'package:online_shop/features/shop/models/catagoryModel.dart';
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
          style: Theme
              .of(context)
              .textTheme
              .headlineMedium,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: MyPadding.screenPadding,
          child: Column(
            children: [
              FutureBuilder(
                  future: controller.getSubCategory(category.id),
                builder: (context, snapshot) {

                    final widget = myCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot);
                    if(widget != null) return widget;

                    List<CategoryModel> subCategories = snapshot.data!;
                   return ListView.builder(
                     shrinkWrap: true,
                       physics: NeverScrollableScrollPhysics(),
                       itemCount: subCategories.length,
                       itemBuilder: (context, index) {
                         CategoryModel subCategory = subCategories[index];
                         return Column(
                           children: [
                             MySectionHeading(title: subCategory.name, onPressed: () {}),
                             SizedBox(height: Mysize.spaceBtwItems / 2),
                             SizedBox(
                               height: 120,
                               child: ListView.separated(
                                 scrollDirection: Axis.horizontal,
                                 itemBuilder: (context, index) {
                                   return NewCartProductHorizontal();
                                 },
                                 itemCount: 10,
                                 separatorBuilder: (context, index) =>
                                     SizedBox(width: Mysize.spaceBtwItems / 2,),
                               ),
                             ),
                           ],
                         );
                       },
                   );
                  },
              )
            ],
          ),
        ),
      ),
    );
  }
}
