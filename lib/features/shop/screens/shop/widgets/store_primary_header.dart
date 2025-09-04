import 'package:flutter/material.dart';
import '../../../../../common/widgets/AppBar/CustomAppbar.dart';
import '../../../../../common/widgets/SearchBar/SearchBar.dart';
import '../../../../../common/widgets/products/cart/cartCounterIcon.dart';
import '../../../../../utile/const/colors.dart';
import '../../../../../utile/const/sizes.dart';
import '../../../../../common/widgets/custom_shapes/primary_home_container.dart';

class MyStorePrimaryHeader extends StatelessWidget {
  const MyStorePrimaryHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(height: Mysize.storePrimaryHeaderHeight + 10),
        MyPrimaryHeaderContainer(
          height: Mysize.storePrimaryHeaderHeight,
          child: MyAppbar(
            title: Text(
              "Store",
              style: Theme.of(context).textTheme.headlineMedium!
                  .apply(color: Mycolors.white),
            ),
            actions: [MyCardCounterIcon(dark: true)],
          ),
        ),

        MySearchBar(),
      ],
    );
  }
}