
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utile/const/sizes.dart';
import '../layouts/grid_layout.dart';
import '../products/cart/product_card/product_cards_vertical.dart';

class MySortableProducts extends StatelessWidget {
  const MySortableProducts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DropdownButtonFormField(
          decoration: InputDecoration(prefixIcon: Icon(Iconsax.sort)),
          onChanged: (value) {},
          items: ["Name", "Lower Price", "Higher Price", "Sale", "Newest"]
              .map((filter) {
            return DropdownMenuItem(
              value: filter,
              child: Text(filter),
            );
          })
              .toList(),
        ),
        SizedBox(height: Mysize.spaceBtwSections,),
        MyGridLayout(itemCount: 10, itemBuilder: (context, index) => MyProductCardVertical(),)
      ],
    );
  }
}