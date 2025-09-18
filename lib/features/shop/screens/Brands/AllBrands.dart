import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_shop/common/brands/brandCards.dart';
import 'package:online_shop/common/widgets/AppBar/CustomAppbar.dart';
import 'package:online_shop/common/widgets/layouts/grid_layout.dart';
import 'package:online_shop/common/widgets/shimmer/brandShimmerEffect.dart';
import 'package:online_shop/common/widgets/style/padding.dart';
import 'package:online_shop/common/widgets/text/sectionHeading.dart';
import 'package:online_shop/features/shop/brand/brandController.dart';
import 'package:online_shop/features/shop/models/brandModel.dart';
import 'package:online_shop/features/shop/screens/Brands/BrandProducts.dart';
import 'package:online_shop/utile/const/sizes.dart';

class Allbrands extends StatelessWidget {
  const Allbrands({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = brandController.instance;
    return Scaffold(
      appBar: MyAppbar(
        showBackArrow: true,
        title: Text(
          "Brands",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: MyPadding.screenPadding,
          child: Column(
            children: [
              MySectionHeading(title: "Brands", showActionBtn: false),
              SizedBox(height: Mysize.spaceBtwItems),
              Obx(
                (){
                  if(controller.isLoadingBrand.value){
                    return Center(child: CircularProgressIndicator());
                  }
                  if(controller.allBrands.isEmpty){
                    return Center(child: Text("Brand not found"));
                  }
                  return MyGridLayout(
                    itemCount: controller.allBrands.length,
                    itemBuilder: (context, index) {
                      final brand = controller.allBrands[index];
                      return MyBrandCard(
                        onTap: () => Get.to(() => brandProdcuts()),
                        brand: brand,
                      );
                    } ,
                    mainAxisExtent: 80,
                  );
                }
              ),
            ],
          ),
        ),
      ),
    );
  }
}
