import 'package:flutter/material.dart';
import '../../../utile/const/colors.dart';
import '../../../utile/const/sizes.dart';
import '../../../utile/helpers/helper_functions.dart';
import '../custom_shapes/circuler_container.dart';

class MyVerticaLImageText extends StatelessWidget {
  const MyVerticaLImageText({
    super.key,
    required this.title,
    required this.image,
    required this.textColor,
    this.backgroundColor,
    this.onPressed,
  });

  final String title,image;
  final Color textColor;
  final Color? backgroundColor;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    bool dark = MyHelperFunction.isDarkMode(context);
    return GestureDetector(
      onTap: onPressed,
      child: Column(
        children: [
          MyCirculerContainer(
            height: 56,
            width: 56,
            backgroundColor: backgroundColor ?? (dark ? Mycolors.dark : Mycolors.light),
            padding: EdgeInsets.all(Mysize.sm),
            child: Image(image: AssetImage(image),fit: BoxFit.cover,color: dark ? Mycolors.light : Mycolors.dark,),
          ),
          SizedBox(height: Mysize.spaceBtwItems / 2,),
          SizedBox(
            width : 55,
            child: Text(title,style: Theme.of(context).textTheme.labelMedium!.apply(
                color: textColor
            ),overflow: TextOverflow.ellipsis,textAlign: TextAlign.center,),
          )
        ],
      ),
    );
  }
}