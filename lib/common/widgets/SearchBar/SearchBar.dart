import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:online_shop/common/widgets/style/Shadow.dart';
import 'package:online_shop/utile/helpers/helper_functions.dart';
import '../../../utile/const/colors.dart';
import '../../../utile/const/sizes.dart';
import '../../../utile/const/text.dart';

class MySearchBar extends StatelessWidget {
  const MySearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    bool dark = MyHeplerFunction.isDarkMode(context);
    return Positioned(
        bottom: 0,
        right: Mysize.spaceBtwSections,
        left: Mysize.spaceBtwSections,
        child: Container(
          height: Mysize.searchBarHeight,
          padding: EdgeInsets.symmetric(horizontal: Mysize.md),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Mysize.buttonRadius),
              color: dark ? Mycolors.dark : Mycolors.light,
              boxShadow: MyShadow.searchBarShadow
          ),
          child: Row(
            children: [
              Icon(Iconsax.search_normal,color: Mycolors.darkGrey,),
              SizedBox(width: Mysize.spaceBtwItems,),
              Text(MyText.HomeScreenSearchBar,style: Theme.of(context).textTheme.bodySmall)
            ],
          ),
        )
    );
  }
}