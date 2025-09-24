import 'package:flutter/material.dart';
import 'package:online_shop/utile/const/text.dart';
import 'package:online_shop/utile/helpers/pricingCalculator.dart';
import '../../../../../utile/const/sizes.dart';
import '../../../controller/cart/cartController.dart';

class MyAmountBillingSection extends StatelessWidget {
  const MyAmountBillingSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;
    final SubTotal = cartController.totalCartPrice.value;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Subtotal",style: Theme.of(context).textTheme.bodyMedium,),
            Text("${MyText.currency}${SubTotal}",style: Theme.of(context).textTheme.bodyMedium,)
          ],
        ),
        SizedBox(height: Mysize.spaceBtwItems /2,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Shipping Fee",style: Theme.of(context).textTheme.bodyMedium,),
            Text("${MyText.currency}${MyPricingCalculator.calculateShippingCost(SubTotal, "Bangladesh")}",style: Theme.of(context).textTheme.bodyMedium,)
          ],
        ),
        SizedBox(height: Mysize.spaceBtwItems /2,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Tax Fee",style: Theme.of(context).textTheme.bodyMedium,),
            Text("${MyText.currency}${MyPricingCalculator.calculateTax(SubTotal, "Bangladesh")}",style: Theme.of(context).textTheme.bodyMedium,)
          ],
        ),
        SizedBox(height: Mysize.spaceBtwItems ,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Order Total",style: Theme.of(context).textTheme.titleMedium,),
            Text("${MyText.currency}${MyPricingCalculator.calculateTotalPrice(SubTotal, "Bangladesh")}",style: Theme.of(context).textTheme.titleMedium,)
          ],
        ),
        SizedBox(height: Mysize.spaceBtwItems /2,),
      ],
    );
  }
}