import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_shop/common/widgets/shimmer/categorySimmer.dart';
import 'package:online_shop/features/shop/models/catagoryModel.dart';
import 'package:online_shop/features/shop/screens/SubCatagory/SubCatagory.dart';
import '../../../../../common/widgets/Image_text/imge_text.dart';
import '../../../../../utile/const/colors.dart';
import '../../../../../utile/const/sizes.dart';
import '../../../../../utile/const/text.dart';
import '../../../controller/category/categoryController.dart';

class MyHomeCategory extends StatelessWidget {
  const MyHomeCategory({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(categoryController());
    return Padding(
      padding: const EdgeInsets.only(left: Mysize.spaceBtwSections),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            MyText.HomeScreenPopularCategory,
            style: Theme.of(
              context,
            ).textTheme.headlineSmall!.apply(color: Mycolors.white),
          ),
          SizedBox(height: Mysize.spaceBtwSections),

          Obx(() {

            final categories = controller.featureCategories;
            if (controller.isCategoryLoading.value) {
              return MyCategoryShimmer(itemCount: 6,);
            }
            if(categories.isEmpty){
              return Text("Category was empty");
            }
            // data found
            return SizedBox(
              height: 82,
              child: ListView.separated(
                separatorBuilder: (context, index) =>
                    SizedBox(width: Mysize.spaceBtwItems),
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  CategoryModel category = categories[index];
                  return MyVerticaLImageText(
                    title: category.name,
                    image: category.image,
                    textColor: Mycolors.white,
                    onPressed: () => Get.to(() => subCatagory()),
                  );
                },
              ),
            );
          }),
        ],
      ),
    );
  }
}
