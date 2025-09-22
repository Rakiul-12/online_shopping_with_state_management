import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../utile/const/colors.dart';
import '../../../../utile/const/sizes.dart';
import '../../../../utile/helpers/helper_functions.dart';
import '../../icons/circular_icon.dart';

class MyProductQuantityAddAndRemove extends StatelessWidget {
  const MyProductQuantityAddAndRemove({
    super.key,
    required this.quantity,
    this.add,
    this.remove,
  });

  final int quantity;
  final VoidCallback? add, remove;

  @override
  Widget build(BuildContext context) {
    final dark = MyHelperFunction.isDarkMode(context);
    return Row(
      children: [
        MyCircularIcon(
          icon: Iconsax.minus,
          width: 32,
          height: 32,
          size: Mysize.iconSm,
          color: dark ? Mycolors.white : Mycolors.black,
          backgroundColor: dark ? Mycolors.darkerGrey : Mycolors.light,
          onPressed: remove,
        ),
        SizedBox(width: Mysize.spaceBtwItems),
        Text(
          quantity.toString(),
          style: Theme.of(context).textTheme.titleSmall,
        ),
        SizedBox(width: Mysize.spaceBtwItems),
        MyCircularIcon(
          icon: Iconsax.add,
          width: 32,
          height: 32,
          size: Mysize.iconSm,
          color: Mycolors.white,
          backgroundColor: Mycolors.primary,
          onPressed: add,
        ),
      ],
    );
  }
}
