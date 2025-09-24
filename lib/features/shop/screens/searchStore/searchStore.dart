import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:online_shop/common/widgets/AppBar/CustomAppbar.dart';
import 'package:online_shop/common/widgets/style/padding.dart';
import 'package:online_shop/features/shop/controller/category/categoryController.dart';
import 'package:online_shop/features/shop/screens/searchStore/widgets/SearchStoreBrands.dart';
import 'package:online_shop/features/shop/screens/searchStore/widgets/SearchStoreCategory.dart';
import 'package:online_shop/utile/const/sizes.dart';

class SearchStoreScreen extends StatelessWidget {
  const SearchStoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppbar(
        showBackArrow: true,
        title: Text("Search",style: Theme.of(context).textTheme.headlineMedium),
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: MyPadding.screenPadding,
          child: Column(
            children: [
              // search field
              TextFormField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Iconsax.search_normal),
                  hintText: "Search in store"
                ),
              ),

              SizedBox(height: Mysize.spaceBtwItems),
              
              // Brands
              SearchStoreBrands(),

              // Categories
              SizedBox(height: Mysize.spaceBtwSections),
              SearchStoreCategory()
            ],
          ),
        ),
      ),
    );
  }
}


