import 'package:flutter/material.dart';
import '../../../../../common/widgets/AppBar/CustomAppbar.dart';
import '../../../../../common/widgets/products/cart/cartCounterIcon.dart';
import '../../../../../utile/const/colors.dart';
import '../../../../../utile/const/text.dart';

class MyHomeAppBar extends StatelessWidget {
  const MyHomeAppBar({
    super.key,
    required this.dark,
  });

  final bool dark;

  @override
  Widget build(BuildContext context) {
    return MyAppbar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            MyText.HomeScreenAppBartitle,
            style: Theme.of(
              context,
            ).textTheme.titleMedium!.apply(color: Mycolors.grey),
          ),
          Text(
            MyText.HomeScreenAppBarsubtitle,
            style: Theme.of(
              context,
            ).textTheme.headlineSmall!.apply(color: Mycolors.grey),
          ),
        ],
      ),
      actions: [
        MyCardCounterIcon(dark: dark)

      ],
    );
  }
}