import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../utile/const/colors.dart';
import '../../../utile/const/enums.dart';
import '../../../utile/const/sizes.dart';
import 'brandTitleText.dart';

class MyBrandTittleWithVerifyIcon extends StatelessWidget {
  const MyBrandTittleWithVerifyIcon({
    super.key,
    this.textColor,
    this.iconColor = Mycolors.primary,
    required this.title,
    this.maxLines =1,
    this.textAlign = TextAlign.center,
    this.brandTextSize = TextSize.small,
  });

  final Color? textColor, iconColor;
  final String title;
  final int maxLines;
  final TextAlign? textAlign;
  final TextSize brandTextSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: MyBrandTitleText(
            title: title,
            maxLines: maxLines,
            textAlign: textAlign,
            brandTextSize: brandTextSize,
            color: textColor,
          ),
        ),
        SizedBox(width: Mysize.xs),
        Icon(Iconsax.verify5, color: Mycolors.primary, size: Mysize.iconXs),
      ],
    );
  }
}
