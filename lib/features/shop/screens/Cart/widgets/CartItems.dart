import 'package:flutter/material.dart';
import '../../../../../common/widgets/products/cart/MyProductQuantityAddAndRemove.dart';
import '../../../../../common/widgets/products/cart/cartItem.dart';
import '../../../../../common/widgets/text/product_price.dart';
import '../../../../../utile/const/sizes.dart';

class MyCardItems extends StatelessWidget {
  const MyCardItems({super.key, this.showAddRemoveBtn = true});

  final bool showAddRemoveBtn;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: 3,
      itemBuilder: (context, index) {
        return Column(
          children: [
            MyCardItem(),

            // price and counter item
            if (showAddRemoveBtn) SizedBox(height: Mysize.spaceBtwItems),
            if (showAddRemoveBtn)
              Row(
                children: [
                  SizedBox(width: 70),
                  MyProductQuantityAddAndRemove(),
                  Spacer(),
                  MyProductPriceText(price: "2000"),
                ],
              ),
          ],
        );
      },
      separatorBuilder: (context, index) =>
          SizedBox(height: Mysize.spaceBtwSections),
    );
  }
}
