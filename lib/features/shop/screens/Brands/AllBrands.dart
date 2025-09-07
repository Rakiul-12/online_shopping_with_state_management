import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_shop/common/brands/brandCards.dart';
import 'package:online_shop/common/widgets/AppBar/CustomAppbar.dart';
import 'package:online_shop/common/widgets/layouts/grid_layout.dart';
import 'package:online_shop/common/widgets/style/padding.dart';
import 'package:online_shop/common/widgets/text/sectionHeading.dart';
import 'package:online_shop/features/shop/screens/Brands/BrandProducts.dart';
import 'package:online_shop/utile/const/sizes.dart';

class Allbrands extends StatelessWidget {
  const Allbrands({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppbar(
        showBackArrow: true,
        title: Text("Brands",style: Theme.of(context).textTheme.headlineMedium),
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: MyPadding.screenPadding,
          child: Column(
            children: [
              MySectionHeading(title: "Brands",showActionBtn: false),
              SizedBox(height: Mysize.spaceBtwItems),
              MyGridLayout(itemCount: 20, itemBuilder: (context, index) => MyBrandCard(onTap: ()=>Get.to(()=>brandProdcuts()),),mainAxisExtent: 80)
            ],
          ),
        ),
      ),
    );
  }
}