import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../utile/const/colors.dart';
import '../../../../utile/const/sizes.dart';
import '../../../../utile/helpers/helper_functions.dart';
import '../../icons/circular_icon.dart';

class MyProductQuantityAddAndRemove extends StatelessWidget {
  const MyProductQuantityAddAndRemove({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final dark = MyHelperFunction.isDarkMode(context);
    return Row(
      children: [
        MyCircularIcon(icon: Iconsax.minus,width: 32,height: 32,
          size: Mysize.iconSm,
          color: dark ? Mycolors.white : Mycolors.black,
          backgroundColor: dark ? Mycolors.darkerGrey : Mycolors.light,
        ),
        SizedBox(width: Mysize.spaceBtwItems,),
        Text("1",style: Theme.of(context).textTheme.titleSmall,),
        SizedBox(width: Mysize.spaceBtwItems,),
        MyCircularIcon(icon: Iconsax.add,width: 32,height: 32,
          size: Mysize.iconSm,
          color: Mycolors.white,
          backgroundColor: Mycolors.primary,
        ),
      ],
    );
  }
}