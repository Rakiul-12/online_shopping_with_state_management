import 'package:flutter/material.dart';
import 'package:online_shop/common/brands/brandCards.dart';
import 'package:online_shop/common/widgets/AppBar/CustomAppbar.dart';
import 'package:online_shop/common/widgets/shimmer/MyVerticalProductShimmer.dart';
import 'package:online_shop/common/widgets/style/padding.dart';
import 'package:online_shop/features/shop/brand/brandController.dart';
import 'package:online_shop/features/shop/models/brandModel.dart';
import 'package:online_shop/utile/const/sizes.dart';
import '../../../../common/widgets/MySortableProducts/MySortableProducts.dart';
import '../../../../utile/helpers/cloudHelperFunction.dart';

class brandProdcuts extends StatelessWidget {
  const brandProdcuts({super.key, required this.title, required this.brand});

  final String title;
  final BrandModel brand;
  @override
  Widget build(BuildContext context) {
    final controller = brandController.instance;
    return Scaffold(
      appBar: MyAppbar(
        showBackArrow: true,
        title: Text(title,style: Theme.of(context).textTheme.headlineMedium),
      ),
      body: SingleChildScrollView(
        child: Padding(padding: MyPadding.screenPadding,child: Column(children: [
          MyBrandCard(brand: brand),
          SizedBox(height: Mysize.spaceBtwItems),
          FutureBuilder(
            future: controller.getBrandsProducts(brand.id),
            builder: (context, snapshot) {

              // handle loading , Error and empty status
              final loader = MyVerticalProductShimmer();
              Widget ? widget = myCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot,loader: loader);
              if(widget != null) return widget;

              final products = snapshot.data!;
              return MySortableProducts(product: products);
            }
          )
        ],),),
      ),
    );
  }
}
