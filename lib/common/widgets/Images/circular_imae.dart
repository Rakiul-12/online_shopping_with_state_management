import 'package:flutter/material.dart';
import 'package:online_shop/utile/const/colors.dart';
import 'package:online_shop/utile/const/sizes.dart';
import 'package:online_shop/utile/helpers/helper_functions.dart';


class MyCirculerImage extends StatelessWidget {
  const MyCirculerImage(
      {super.key,
        this.width = 56,
        this.height = 56,
        this.overlayColor,
        this.backgroundColor,
        required this.image,
        this.fit = BoxFit.cover,
        this.padding = Mysize.sm,
        this.isNetworkImage = false,
        this.showBorder = false,
        this.borderColor = Mycolors.primary,
        this.borderWidth = 1.0});

  final BoxFit? fit;
  final String image;
  final bool isNetworkImage;
  final Color? overlayColor;
  final Color? backgroundColor;
  final double width, height, padding;
  final bool showBorder;
  final Color borderColor;
  final double borderWidth;

  @override
  Widget build(BuildContext context) {
    final dark = MyHeplerFunction.isDarkMode(context);

    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
          color: backgroundColor ?? (dark ? Mycolors.dark : Mycolors.light),
          borderRadius: BorderRadius.circular(100),
          border: showBorder ? Border.all(color: borderColor, width: borderWidth) : null),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: Image(fit: fit,image: isNetworkImage ? NetworkImage(image) : AssetImage(image)as ImageProvider,),
      )
    );
  }
}

//
// ClipRRect(
// borderRadius: BorderRadius.circular(100),
// child: isNetworkImage
// ? CachedNetworkImage(
// fit: fit,
// color: overlayColor,
// progressIndicatorBuilder: (context, url, progress) => UShimmerEffect(width: 55, height: 55),
// errorWidget: (context, url, error) => Icon(Icons.error),
// imageUrl: image)
//     : Image(fit: fit, image: AssetImage(image)),
// ),