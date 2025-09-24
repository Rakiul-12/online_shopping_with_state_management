import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as Controller;
import 'package:online_shop/features/shop/models/catagoryModel.dart';
import 'package:online_shop/features/shop/screens/all_Products/AllProducts.dart';
import '../../../../../common/widgets/Images/roundedImage.dart';
import '../../../../../common/widgets/text/sectionHeading.dart';
import '../../../../../utile/const/image.dart';
import '../../../../../utile/const/sizes.dart';
import '../../../controller/category/categoryController.dart';

class SearchStoreCategory extends StatelessWidget {
  const SearchStoreCategory({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = categoryController.instance;
    return Obx(
        (){
          if(controller.isCategoryLoading.value) return Center(child: CircularProgressIndicator());

          if(controller.allCategories.isEmpty) return Text("Category not found!");
          List<CategoryModel> category = controller.allCategories.toList();
          return Column(
            children: [
              MySectionHeading(title: "Categories",showActionBtn: false,),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                // separatorBuilder: (context, index) => SizedBox(height: Mysize.spaceBtwItems),
                itemCount: category.length,
                itemBuilder: (context, index) {
                  final categories = category[index];
                  return ListTile(
                    leading: MyRoundedImge(
                      onPressed: ()=> Get.to(()=> AllProdcuts(title: categories.name,
                        futureMethod: controller.getCategoryProducts(categoryId: categories.id),
                      )),
                      imageUrl: categories.image,
                      isNetworkImage: true,
                      borderRadius: 0,
                      width: Mysize.iconLg,
                      height: Mysize.iconLg,
                    ),
                    contentPadding: EdgeInsets.zero,
                    title: Text(categories.name),
                  );
                },
              )
            ],
          );
        }
    );
  }
}