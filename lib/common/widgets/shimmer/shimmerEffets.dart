import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:online_shop/utile/const/colors.dart';
import 'package:shimmer/shimmer.dart';
import '../../../utile/helpers/helper_functions.dart';

class MyShimmerEffect extends StatelessWidget{
  final double width ,height , radius;
  final Color? color;
  
  MyShimmerEffect({
    super.key,
    required this.width,
    required this.height,
    this.radius = 15,
    this.color
});

  @override
  Widget build(BuildContext context) {
    final dark = MyHelperFunction.isDarkMode(context);
    return Shimmer.fromColors(
      baseColor: dark ? Colors.grey[850]! : Colors.grey[300]!,
      highlightColor: dark ? Colors.grey[700]! : Colors.grey[100]!,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            color: color ?? (dark ? Mycolors.darkerGrey : Mycolors.white),
            borderRadius: BorderRadius.circular(radius)
        ),
      ),
    );
  }
}