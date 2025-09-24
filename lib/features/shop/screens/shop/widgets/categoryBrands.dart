import 'package:flutter/material.dart';
import 'package:online_shop/features/shop/brand/brandController.dart';
import 'package:online_shop/features/shop/models/catagoryModel.dart';
import 'package:online_shop/utile/helpers/cloudHelperFunction.dart';
import '../../../../../common/brands/MyBrandShowCase.dart';


class categoryBrands extends StatelessWidget {
  const categoryBrands({super.key, required this.category});

  
  final CategoryModel category;
  @override
  Widget build(BuildContext context) {
    final controller = brandController.instance;
    return FutureBuilder(
      future: controller.getBrandsForCategory(category.id),
      builder: (context, asyncSnapshot) {

        // final loader = Column(
        //   children: [
        //     MyListTileShimmer(),
        //     SizedBox(height: Mysize.spaceBtwItems),
        //     MyBoxesShimmer(),
        //     SizedBox(height: Mysize.spaceBtwItems),
        //   ],
        // );
        final widget = myCloudHelperFunctions.checkMultiRecordState(snapshot: asyncSnapshot);
        if(widget != null) return widget;
        final brands = asyncSnapshot.data!;
        return ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          itemCount: brands.length,
          shrinkWrap: true,
            itemBuilder: (context, index) {
              final brand = brands[index];
              return FutureBuilder(
                  future: controller.getBrandsProducts(brand.id, limit:3),
                  builder: (context, snapshot) {
                    final widget = myCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot);
                    if(widget != null) return widget;
                    final products = snapshot.data!;
                    return MyBrandShowcase(
                      image: products.map((product) => product.thumbnail).toList(), brand: brand,
                    );
                  },
              );
            },
        );
      }
    );
  }
}
