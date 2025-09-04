import 'package:flutter/material.dart';

import '../../../utile/const/sizes.dart';

class MyRoundedImge extends StatelessWidget {
  const MyRoundedImge({
    super.key,
    this.width,
    this.height,
    required this.imageUrl,
    this.ApplyImageRadius = true,
    this.border,
    this.backgroundColor,
    this.fit = BoxFit.contain,
    this.padding,
    this.isNetworkImage = false,
    this.onPressed,
    this.borderRadius = Mysize.md,
  });

  final double? width, height;
  final String imageUrl;
  final bool ApplyImageRadius;
  final BoxBorder? border;
  final Color? backgroundColor;
  final BoxFit? fit;
  final EdgeInsetsGeometry? padding;
  final bool isNetworkImage;
  final VoidCallback? onPressed;
  final double borderRadius;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: height,
        width: width,
        padding: padding,
        decoration: BoxDecoration(
          border: border,
          color: backgroundColor,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: ClipRRect(
          borderRadius: ApplyImageRadius
              ? BorderRadius.circular(borderRadius)
              : BorderRadius.zero,
          child: Image(
            image: isNetworkImage
                ? NetworkImage(imageUrl)
                : AssetImage(imageUrl),
            fit: fit,
          ),
        ),
      ),
    );
  }
}