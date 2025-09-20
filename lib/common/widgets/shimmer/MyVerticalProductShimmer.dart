import 'package:flutter/material.dart';
import 'package:online_shop/common/widgets/shimmer/shimmerEffets.dart';
import 'package:online_shop/utile/const/sizes.dart';
import '../layouts/grid_layout.dart';

class MyVerticalProductShimmer extends StatelessWidget {
  const MyVerticalProductShimmer({
    super.key,
    this.itemCount = 16
  });

  final int itemCount;
  @override
  Widget build(BuildContext context) {
    return MyGridLayout(
      itemCount: itemCount,
      itemBuilder: (context, index) => SizedBox(
        width: 180,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Image
            MyShimmerEffect(width: 180, height: 180),
            const SizedBox(height: Mysize.spaceBtwItems,),

            /// Text
            MyShimmerEffect(width: 160, height: 15),
            const SizedBox(height: Mysize.spaceBtwItems / 2,),
            MyShimmerEffect(width: 110, height: 15)
          ],
        ),
      ),
    );
  }
}
