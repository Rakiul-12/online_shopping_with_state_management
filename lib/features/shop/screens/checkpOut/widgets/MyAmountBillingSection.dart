
import 'package:flutter/material.dart';
import '../../../../../utile/const/sizes.dart';

class MyAmountBillingSection extends StatelessWidget {
  const MyAmountBillingSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Subtotal",style: Theme.of(context).textTheme.bodyMedium,),
            Text("\$6000",style: Theme.of(context).textTheme.bodyMedium,)
          ],
        ),
        SizedBox(height: Mysize.spaceBtwItems /2,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Shipping Fee",style: Theme.of(context).textTheme.bodyMedium,),
            Text("\$32",style: Theme.of(context).textTheme.bodyMedium,)
          ],
        ),
        SizedBox(height: Mysize.spaceBtwItems /2,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Tax Fee",style: Theme.of(context).textTheme.bodyMedium,),
            Text("\$231",style: Theme.of(context).textTheme.bodyMedium,)
          ],
        ),
        SizedBox(height: Mysize.spaceBtwItems ,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Order Total",style: Theme.of(context).textTheme.titleMedium,),
            Text("\$6263",style: Theme.of(context).textTheme.titleMedium,)
          ],
        ),
        SizedBox(height: Mysize.spaceBtwItems /2,),
      ],
    );
  }
}