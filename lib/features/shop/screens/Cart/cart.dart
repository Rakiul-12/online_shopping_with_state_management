import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:online_shop/common/widgets/AppBar/CustomAppbar.dart';
import 'package:online_shop/common/widgets/Button/elevatedButton.dart';
import 'package:online_shop/common/widgets/style/padding.dart';
import 'package:online_shop/features/shop/screens/Cart/widgets/CartItems.dart';
import 'package:online_shop/utile/const/sizes.dart';

import '../checkpOut/CheckOut.dart';


class cartScreen extends StatelessWidget {
  const cartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppbar(
        showBackArrow: true,
        title: Text("Cart",style: Theme.of(context).textTheme.headlineMedium,),
      ),
      body: Padding(
        padding: MyPadding.screenPadding,
        child: MyCardItems(),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(Mysize.defaultSpace),
        child: MyElevatedButton(onPressed: ()=>Get.to(()=>checkOutScreen()), child: Text("Checkout \$6000")),
      ),
    );
  }
}





