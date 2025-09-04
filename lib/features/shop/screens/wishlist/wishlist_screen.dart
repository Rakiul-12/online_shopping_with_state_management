import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:online_shop/common/widgets/AppBar/CustomAppbar.dart';
import 'package:online_shop/common/widgets/icons/circular_icon.dart';
import 'package:online_shop/common/widgets/layouts/grid_layout.dart';
import 'package:online_shop/common/widgets/products/cart/product_card/product_cards_vertical.dart';

import 'package:online_shop/navigation_menu.dart';
import 'package:online_shop/utile/const/sizes.dart';

class wishlist_screen extends StatelessWidget {
  const wishlist_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppbar(
        title: Text(
          "Wishlist",
          style: Theme
              .of(context)
              .textTheme
              .headlineMedium,
        ),
        actions: [
          MyCircularIcon(
            icon: Iconsax.add,
            onPressed: () => navigationController.instance.selectedIndex.value = 0,)
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(Mysize.defaultSpace),
          child: MyGridLayout(
            itemCount: 10,
              itemBuilder: (context, index) {
                return MyProductCardVertical();
              },
          ),
        ),
      ),
    );
  }
}
