import 'package:flutter/material.dart';
import 'package:online_shop/common/widgets/shimmer/shimmerEffets.dart';
import 'package:online_shop/utile/const/sizes.dart';


class MyBoxesShimmer extends StatelessWidget {
  const MyBoxesShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Row(
          children: [
            /// Three Products
            Expanded(child: MyShimmerEffect(width: 150, height: 110)),
            SizedBox(width: Mysize.spaceBtwItems,),
            Expanded(child: MyShimmerEffect(width: 150, height: 110)),
            SizedBox(width: Mysize.spaceBtwItems,),
            Expanded(child: MyShimmerEffect(width: 150, height: 110)),
          ],
        )
      ],
    );
  }
}
