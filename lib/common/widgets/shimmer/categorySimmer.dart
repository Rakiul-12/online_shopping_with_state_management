import 'package:flutter/material.dart';
import 'package:online_shop/common/widgets/shimmer/shimmerEffets.dart';
import 'package:online_shop/utile/const/sizes.dart';


class MyCategoryShimmer extends StatelessWidget {
  const MyCategoryShimmer({super.key,
    this.itemCount = 6
  });

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 82,
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: itemCount,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => const SizedBox(width: Mysize.spaceBtwItems),
        itemBuilder: (context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Image
              MyShimmerEffect(width: 55, height: 55, radius: 55),
              SizedBox(height: Mysize.spaceBtwItems /2),
              /// Text
              MyShimmerEffect(width: 55, height: 8)
            ],
          );
        },
      ),
    );
  }
}
