import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:online_shop/features/shop/controller/cart/cartController.dart';
import 'package:online_shop/features/shop/screens/Cart/cart.dart';
import '../../../../utile/const/colors.dart';

class MyCardCounterIcon extends StatelessWidget {
  const MyCardCounterIcon({
    super.key,
    required this.dark,
  });

  final bool dark;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CartController());
    return Stack(
      children: [
        IconButton(onPressed: ()=> Get.to(()=>cartScreen()),
            icon: Icon(Iconsax.shopping_bag,color: Mycolors.light,)),
        Positioned(
          right: 6.0,
          child: Container(
            height: 18,
            width: 18,
            decoration: BoxDecoration(
                color: dark ? Mycolors.light : Mycolors.light,
                shape: BoxShape.circle
            ),
            child: Center(
              child: Obx(
                        ()=> Text(controller.numberOfCartItem.value.toString(),style: Theme.of(context).textTheme.labelLarge!.apply(
                    fontSizeFactor: 0.8,
                    color: dark ? Mycolors.dark : Mycolors.dark
                ),),
              ),
            ),
          ),
        )
      ],
    );
  }
}