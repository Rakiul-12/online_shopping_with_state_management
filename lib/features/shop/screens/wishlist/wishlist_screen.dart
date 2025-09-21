import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:online_shop/common/widgets/AppBar/CustomAppbar.dart';
import 'package:online_shop/common/widgets/icons/circular_icon.dart';
import 'package:online_shop/common/widgets/layouts/grid_layout.dart';
import 'package:online_shop/common/widgets/loader/MyAnimationLoader.dart';
import 'package:online_shop/common/widgets/products/cart/product_card/product_cards_vertical.dart';
import 'package:online_shop/common/widgets/shimmer/MyVerticalProductShimmer.dart';
import 'package:online_shop/features/shop/controller/productController/favouriteProductController.dart';
import 'package:online_shop/features/shop/models/productModel.dart';

import 'package:online_shop/navigation_menu.dart';
import 'package:online_shop/utile/const/image.dart';
import 'package:online_shop/utile/const/sizes.dart';
import 'package:online_shop/utile/helpers/cloudHelperFunction.dart';

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
          child: Obx(
                ()=> FutureBuilder(
                future: FavouriteController.instance.getFavouriteProducts(),
                builder: (context, snapshot) {
                  final nothingFound = MyAnimationLoader(
                      text: "Wishlist is Empty...",
                    animation: MyImage.pencilAnimation,
                    showActionButton: true,
                    actionText: "Let's add some",
                    onActionPressed: ()=>navigationController.instance.selectedIndex.value = 0,
                  );
                  final loader = MyVerticalProductShimmer(itemCount: 6,);
                  final widget = myCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot,nothingFound: nothingFound,loader:loader);
                  if(widget != null) return widget;
                  List<ProductModel> products = snapshot.data!;
                  return MyGridLayout(
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      return MyProductCardVertical(product: products[index]);
                    },
                  );
                },
            ),
          )
        ),
      ),
    );
  }
}
