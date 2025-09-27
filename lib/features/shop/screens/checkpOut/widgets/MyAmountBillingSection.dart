import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_shop/features/shop/controller/promoCode/PromoCodeController.dart';
import 'package:online_shop/utile/const/colors.dart';
import 'package:online_shop/utile/const/text.dart';
import 'package:online_shop/utile/helpers/pricingCalculator.dart';
import '../../../../../utile/const/sizes.dart';
import '../../../controller/cart/cartController.dart';

class MyAmountBillingSection extends StatelessWidget {
  const MyAmountBillingSection({super.key});

  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;
    final SubTotal = cartController.totalCartPrice.value;
    final controller = PromoCodeController.instance;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Subtotal", style: Theme.of(context).textTheme.bodyMedium),
            Text(
              "${MyText.currency}${SubTotal}",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
        SizedBox(height: Mysize.spaceBtwItems / 2),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Shipping Fee", style: Theme.of(context).textTheme.bodyMedium),
            Text(
              "${MyText.currency}${MyPricingCalculator.calculateShippingCost(SubTotal, "Bangladesh")}",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
        SizedBox(height: Mysize.spaceBtwItems / 2),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Tax Fee", style: Theme.of(context).textTheme.bodyMedium),
            Text(
              "${MyText.currency}${MyPricingCalculator.calculateTax(SubTotal, "Bangladesh")}",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
        SizedBox(height: Mysize.spaceBtwItems),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Order Total", style: Theme.of(context).textTheme.titleMedium),
            Obx(() {
              double total = MyPricingCalculator.calculateTotalPrice(SubTotal, "Bangladesh");
              final promoCode = controller.appliedPromoCode.value;
              total = controller.calculatePriceAfterDiscount(promoCode, total);
              return Text(
                "${MyText.currency}${total.toStringAsFixed(2)}",
                style: Theme.of(context).textTheme.titleMedium,
              );
            }),
          ],
        ),
        SizedBox(height: Mysize.spaceBtwItems / 2),
        Obx((){
          final promoCode = controller.appliedPromoCode.value;
          if(promoCode.id.isEmpty)return SizedBox();
          return  Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Discount", style: Theme.of(context).textTheme.bodyMedium!.apply(color: Mycolors.success)),
              Text(controller.getDiscountPrice(),style: Theme.of(context).textTheme.titleMedium!.apply(color: Mycolors.success))
            ],
          );
        }),
        SizedBox(height: Mysize.spaceBtwItems),

      ],
    );
  }
}
