import 'package:flutter/material.dart';
import 'package:online_shop/common/widgets/shimmer/shimmerEffets.dart';
import 'package:online_shop/utile/const/sizes.dart';


class MyListTileShimmer extends StatelessWidget {
  const MyListTileShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            /// Brand Logo
            MyShimmerEffect(width: 50, height: 50, radius: 50,),
            SizedBox(width: Mysize.spaceBtwItems,),
            Column(
              children: [
                /// Brand Name
                MyShimmerEffect(width: 100, height: 15),
                SizedBox(height: Mysize.spaceBtwItems / 2,),
                /// Brand products
                MyShimmerEffect(width: 80, height: 12)
              ],
            )
          ],
        )
      ],
    );
  }
}
