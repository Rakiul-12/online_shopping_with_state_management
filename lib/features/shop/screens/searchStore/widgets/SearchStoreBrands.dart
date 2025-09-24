import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:online_shop/features/shop/brand/brandController.dart';
import 'package:online_shop/features/shop/models/brandModel.dart';
import 'package:online_shop/features/shop/screens/Brands/AllBrands.dart';
import 'package:online_shop/features/shop/screens/Brands/BrandProducts.dart';
import 'package:online_shop/utile/helpers/helper_functions.dart';
import '../../../../../common/widgets/Image_text/imge_text.dart';
import '../../../../../common/widgets/text/sectionHeading.dart';
import '../../../../../utile/const/colors.dart';
import '../../../../../utile/const/sizes.dart';

class SearchStoreBrands extends StatelessWidget {
  const SearchStoreBrands({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(brandController());
    final dark = MyHelperFunction.isDarkMode(context);
    return Obx(() {
      if (controller.isLoadingBrand.value) return Center(child: CircularProgressIndicator());

      if (controller.allBrands.isEmpty) return Text("No Brands Found!");

      List<BrandModel> brands = controller.allBrands.take(10).toList();
      return Column(
        children: [
          MySectionHeading(title: "Brands",onPressed: ()=> Get.to (()=> Allbrands()),),
          SizedBox(height: Mysize.spaceBtwItems),
          Wrap(
            spacing: Mysize.spaceBtwItems,
            runSpacing: Mysize.spaceBtwItems,
            children: brands
                .map(
                  (brand) => MyVerticaLImageText(
                    title: brand.name,
                    image: brand.image,
                    textColor: dark ? Mycolors.white : Mycolors.black,
                    onPressed: ()=> Get.to(()=> brandProdcuts(title: brand.name, brand: brand)),
                  ),
                )
                .toList(),
          ),
        ],
      );
    });
  }
}
