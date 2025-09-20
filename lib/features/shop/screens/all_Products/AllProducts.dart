import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:online_shop/common/widgets/AppBar/CustomAppbar.dart';
import 'package:online_shop/common/widgets/shimmer/MyVerticalProductShimmer.dart';
import 'package:online_shop/common/widgets/style/padding.dart';
import 'package:online_shop/features/shop/controller/productController/allProductController.dart';
import 'package:online_shop/utile/helpers/cloudHelperFunction.dart';
import '../../../../common/widgets/MySortableProducts/MySortableProducts.dart';
import '../../models/productModel.dart';

class AllProdcuts extends StatelessWidget {
  const AllProdcuts({
  super.key,
  this.query,
  this.futureMethod,
  required this.title
  });


  final Future<List<ProductModel>>? futureMethod;
  final Query? query;
  final String title;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AllProductController());
    return Scaffold(
      appBar: MyAppbar(
        showBackArrow: true,
        title: Text(
          title,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: MyPadding.screenPadding,
          child: FutureBuilder(
              future: futureMethod ?? controller.fetchProductsByQuery(query),
              builder: (context, snapshot) {
                const loader = MyVerticalProductShimmer();
                final widget = myCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot,loader: loader);
                if(widget != null) return widget;
                List<ProductModel> products = snapshot.data!;
                return MySortableProducts(product: products,);
              },
          ),
        ),
      ),
    );
  }
}

