
import 'package:flutter/material.dart';
import 'package:online_shop/common/widgets/shimmer/shimmerEffets.dart';
import 'package:online_shop/utile/const/sizes.dart';

class MyHorizontalProductShimmer extends StatelessWidget {
  const MyHorizontalProductShimmer({super.key, this.itemCount = 4});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: Mysize.spaceBtwSections),
      height: 120,
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => SizedBox(width: Mysize.spaceBtwItems),
        itemCount: itemCount,
        itemBuilder: (context, index) => Row(
          mainAxisSize: MainAxisSize.min,
          children: [

            /// Image
            MyShimmerEffect(width: 120, height: 120),
            SizedBox(width: Mysize.spaceBtwItems),


            /// Text
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: Mysize.spaceBtwItems),

                    /// Title
                    MyShimmerEffect(width: 160, height: 15),
                    SizedBox(height: Mysize.spaceBtwItems / 2),
                    /// Brand
                    MyShimmerEffect(width: 110, height: 15)
                  ],

                ),

                Row(
                  children: [
                    MyShimmerEffect(width: 40, height: 20),
                    SizedBox(width: Mysize.spaceBtwSections),
                    MyShimmerEffect(width: 40, height: 20)
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
