import 'package:flutter/material.dart';
import 'package:online_shop/common/brands/brandCards.dart';
import 'package:online_shop/common/widgets/AppBar/CustomAppbar.dart';
import 'package:online_shop/common/widgets/style/padding.dart';
import 'package:online_shop/features/shop/models/brandModel.dart';
import 'package:online_shop/utile/const/sizes.dart';

import '../../../../common/widgets/MySortableProducts/MySortableProducts.dart';

class brandProdcuts extends StatelessWidget {
  const brandProdcuts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppbar(
        showBackArrow: true,
        title: Text("Bata",style: Theme.of(context).textTheme.headlineMedium),
      ),
      body: SingleChildScrollView(
        child: Padding(padding: MyPadding.screenPadding,child: Column(children: [
          MyBrandCard(brand: BrandModel.empty(),),
          SizedBox(height: Mysize.spaceBtwItems),
          MySortableProducts(product: [],)
        ],),),
      ),
    );
  }
}
