import 'package:flutter/material.dart';
import 'package:online_shop/utile/const/colors.dart';
import 'package:online_shop/utile/const/sizes.dart';


class MyRoundedContainer extends StatelessWidget {
  const MyRoundedContainer({super.key,
    this.width,
    this.height,
    this.radius = Mysize.cardRadiusLg,
    this.child,
    this.showBorder = false,
    this.borderColor = Mycolors.borderPrimary,
    this.backgroundColor = Mycolors.white,
    this.padding,
    this.margin
  });

  final double? width, height;
  final double radius;
  final Widget? child;
  final bool showBorder;
  final Color borderColor, backgroundColor;
  final EdgeInsetsGeometry? padding, margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(radius),
          border: showBorder ? Border.all(color: borderColor) : null
      ),
      child: child,
    );
  }
}
