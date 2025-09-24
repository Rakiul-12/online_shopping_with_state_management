import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';
import 'package:online_shop/common/widgets/AppBar/CustomAppbar.dart';
import 'package:online_shop/common/widgets/Button/elevatedButton.dart';
import 'package:online_shop/common/widgets/icons/circular_icon.dart';
import 'package:online_shop/common/widgets/loader/MyAnimationLoader.dart';
import 'package:online_shop/common/widgets/style/padding.dart';
import 'package:online_shop/features/shop/controller/cart/cartController.dart';
import 'package:online_shop/features/shop/screens/Cart/widgets/CartItems.dart';
import 'package:online_shop/utile/const/image.dart';
import 'package:online_shop/utile/const/sizes.dart';
import '../checkpOut/CheckOut.dart';

class cartScreen extends StatelessWidget {
  const cartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = CartController.instance;
    return Scaffold(
      appBar: MyAppbar(
        showBackArrow: true,
        title: Text("Cart", style: Theme.of(context).textTheme.headlineMedium),
        actions: [
          MyCircularIcon(icon: Iconsax.box_remove,onPressed: ()=>controller.clearCart(),)
        ],
      ),
      body: Obx(() {

        final emptyWidget = MyAnimationLoader(
            text: "Cart is empty",
            animation: MyImage.cartEmptyAnimation,
            actionText: "Let's fill it",
            onActionPressed: Get.back,
            showActionButton: true,
        );

        if (controller.cartItems.isEmpty) {
          return emptyWidget;
        }
        return SingleChildScrollView(
          child: Padding(
            padding: MyPadding.screenPadding,
            child: MyCardItems(),
          ),
        );
      }),
      bottomNavigationBar: Obx(() {
        if (controller.cartItems.isEmpty) return SizedBox();
        return Padding(
          padding: const EdgeInsets.all(Mysize.defaultSpace),
          child: MyElevatedButton(
            onPressed: () => Get.to(() => CheckOutScreen()),
            child: Text("Checkout \$${controller.totalCartPrice.value.toStringAsFixed(2)}"),
          ),
        );
      }),
    );
  }
}
