import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:online_shop/common/widgets/AppBar/CustomAppbar.dart';
import 'package:online_shop/common/widgets/Button/elevatedButton.dart';
import 'package:online_shop/common/widgets/Screens/success_screen.dart';
import 'package:online_shop/common/widgets/custom_shapes/rounded_container.dart';
import 'package:online_shop/common/widgets/style/padding.dart';
import 'package:online_shop/features/shop/screens/Cart/widgets/CartItems.dart';
import 'package:online_shop/features/shop/screens/checkpOut/widgets/MyAmountBillingSection.dart';
import 'package:online_shop/features/shop/screens/checkpOut/widgets/MyBillingAddressSection.dart';
import 'package:online_shop/features/shop/screens/checkpOut/widgets/MyPaymentBillingSection.dart';
import 'package:online_shop/navigation_menu.dart';
import 'package:online_shop/utile/const/image.dart';
import 'package:online_shop/utile/const/sizes.dart';

import '../../../../common/widgets/textfield/MyPromoCodeField.dart';

class checkOutScreen extends StatelessWidget {
  const checkOutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final dark = MyHeplerFunction.isDarkMode(context);
    return Scaffold(
      appBar: MyAppbar(
        showBackArrow: true,
        title: Text(
          "Order Review",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: MyPadding.screenPadding,
          child: Column(
            children: [
              MyCardItems(showAddRemoveBtn: false),
              SizedBox(height: Mysize.spaceBtwSections),
              MyPromoCodeFiled(),
              SizedBox(height: Mysize.spaceBtwItems),

              // Billing Section
              MyRoundedContainer(
                showBorder: true,
                backgroundColor: Colors.transparent,
                padding: EdgeInsets.all(Mysize.md),
                child: Column(
                  children: [
                    // Billing Section
                    MyAmountBillingSection(),
                    Divider(),
                    MyPaymentBillingSection(),
                    SizedBox(height: Mysize.spaceBtwItems / 2),
                    MyBillingAddressSection(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(Mysize.defaultSpace),
        child: MyElevatedButton(
          onPressed: () => Get.to(
            () => success_screen(
              title: "Payment Success!",
              subtitle: "Your item will be shipped soon!",
              image: MyImage.successfulPaymentIcon,
              onPressed: ()=>Get.offAll(()=>navigationMenuScreen()),
            ),
          ),
          child: Text("Checkout \$6000"),
        ),
      ),
    );
  }
}
