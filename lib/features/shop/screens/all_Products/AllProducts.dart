import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:online_shop/common/widgets/AppBar/CustomAppbar.dart';
import 'package:online_shop/common/widgets/layouts/grid_layout.dart';
import 'package:online_shop/common/widgets/products/cart/product_card/product_cards_vertical.dart';
import 'package:online_shop/common/widgets/style/padding.dart';
import 'package:online_shop/utile/const/sizes.dart';

class AllProdcuts extends StatelessWidget {
  const AllProdcuts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppbar(
        showBackArrow: true,
        title: Text(
          "Popular Products",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: MyPadding.screenPadding,
          child: Column(
            children: [
              DropdownButtonFormField(
                decoration: InputDecoration(prefixIcon: Icon(Iconsax.sort)),
                onChanged: (value) {},
                items: ["Name", "Lower Price", "Higher Price", "Sale", "Newest"]
                    .map((filter) {
                      return DropdownMenuItem(
                        value: filter,
                        child: Text(filter),
                      );
                    })
                    .toList(),
              ),
              SizedBox(height: Mysize.spaceBtwSections,),
              MyGridLayout(itemCount: 10, itemBuilder: (context, index) => MyProductCardVertical(),)
            ],
          ),
        ),
      ),
    );
  }
}
