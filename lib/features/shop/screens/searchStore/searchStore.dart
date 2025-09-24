import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:online_shop/common/widgets/AppBar/CustomAppbar.dart';
import 'package:online_shop/common/widgets/layouts/grid_layout.dart';
import 'package:online_shop/common/widgets/products/cart/product_card/product_cards_vertical.dart';
import 'package:online_shop/common/widgets/style/padding.dart';
import 'package:online_shop/features/shop/controller/productController/productController.dart';
import 'package:online_shop/features/shop/screens/searchStore/widgets/SearchStoreBrands.dart';
import 'package:online_shop/features/shop/screens/searchStore/widgets/SearchStoreCategory.dart';
import 'package:online_shop/utile/const/sizes.dart';
import 'package:online_shop/utile/helpers/cloudHelperFunction.dart';

class SearchStoreScreen extends StatelessWidget {
  const SearchStoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    RxString searchText = ''.obs;
    return Scaffold(
      appBar: MyAppbar(
        showBackArrow: true,
        title: Text(
          "Search",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: MyPadding.screenPadding,
          child: Column(
            children: [
              // search field
              Hero(
                tag: "search_products",
                child: Material(
                  color: Colors.transparent,
                  child: TextFormField(
                    onChanged: (value) => searchText.value = value,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Iconsax.search_normal),
                      hintText: "Search in store",
                    ),
                  ),
                ),
              ),

              SizedBox(height: Mysize.spaceBtwItems),

              Obx(() {
                if (searchText.value.isEmpty) {
                  return Column(
                    children: [
                      // Brands
                      SearchStoreBrands(),

                      // Categories
                      SizedBox(height: Mysize.spaceBtwSections),
                      SearchStoreCategory(),
                    ],
                  );
                }
                return FutureBuilder(
                  future: productController.instance.getAllProducts(),
                  builder: (context, snapshot) {
                    final widget = myCloudHelperFunctions.checkMultiRecordState(
                      snapshot: snapshot,
                    );
                    if (widget != null) return widget;
                    final products = snapshot.data!;
                    final filteredProducts = products
                        .where(
                          (product) => product.title.toLowerCase().contains(
                            searchText.value.toLowerCase(),
                          ),
                        )
                        .toList();

                    if (filteredProducts.isEmpty)
                      return Text("No product found!");
                    return MyGridLayout(
                      itemCount: filteredProducts.length,
                      itemBuilder: (context, index) {
                        final product = filteredProducts[index];
                        return MyProductCardVertical(product: product);
                      },
                    );
                  },
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
