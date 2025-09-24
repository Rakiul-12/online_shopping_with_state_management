import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:online_shop/common/widgets/AppBar/CustomAppbar.dart';
import 'package:online_shop/common/widgets/Button/elevatedButton.dart';
import 'package:online_shop/common/widgets/custom_shapes/rounded_container.dart';
import 'package:online_shop/common/widgets/style/padding.dart';
import 'package:online_shop/features/shop/controller/cart/cartController.dart';
import 'package:online_shop/features/shop/controller/order/orderController.dart';
import 'package:online_shop/features/shop/screens/Cart/widgets/CartItems.dart';
import 'package:online_shop/features/shop/screens/checkpOut/widgets/MyAmountBillingSection.dart';
import 'package:online_shop/features/shop/screens/checkpOut/widgets/MyBillingAddressSection.dart';
import 'package:online_shop/features/shop/screens/checkpOut/widgets/MyPaymentBillingSection.dart';
import 'package:online_shop/utile/const/sizes.dart';
import 'package:online_shop/utile/const/text.dart';
import 'package:online_shop/utile/helpers/pricingCalculator.dart';
import 'package:online_shop/utile/popup/snackbarHelpers.dart';
import '../../../../common/widgets/textfield/MyPromoCodeField.dart';

class checkOutScreen extends StatelessWidget {
  const checkOutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;
    final orderController = Get.put(OrderController());
    double subTotal = cartController.totalCartPrice.value;
    double total = MyPricingCalculator.calculateTotalPrice(
      subTotal,
      "Bangladesh",
    );
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
          onPressed:
          subTotal > 0
              ? () => orderController.processOrder(total)
              : () => MySnackBarHelpers.errorSnackBar(
                  title: "Empty cart",
                  message: "Add items in the cart",
                ),
          child: Text("Checkout ${MyText.currency}${total}"),
        ),
      ),
    );
  }
}
