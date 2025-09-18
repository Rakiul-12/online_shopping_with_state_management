import 'package:flutter/cupertino.dart';
import 'package:online_shop/common/widgets/shimmer/shimmerEffets.dart';
import 'package:online_shop/utile/const/sizes.dart';

class MyBrandShimmer extends StatelessWidget{
  MyBrandShimmer({
    super.key,
    this.itemCount = 4
  });

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context, index) => MyShimmerEffect(width: Mysize.brandCardWidth, height: Mysize.brandCardHeight),
        separatorBuilder: (context, index) => SizedBox(width: Mysize.spaceBtwItems),
        itemCount: itemCount,
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
    );
  }
}