import 'package:flutter/material.dart';
import 'package:online_shop/utile/const/colors.dart';

class MyCirculerContainer extends StatelessWidget {
  const MyCirculerContainer({
    super.key,
     this.height = 400,
     this.width = 400,
     this.radius = 400,
     this.backgroundColor = Mycolors.white,
     this.padding,
     this.margin,
  });

  final double height,width,radius;
  final Color backgroundColor;
  final EdgeInsetsGeometry ?padding,margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          color: backgroundColor
      ),
    );
  }
}