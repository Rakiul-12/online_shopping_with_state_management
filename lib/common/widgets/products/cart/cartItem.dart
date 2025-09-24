import 'package:flutter/material.dart';
import 'package:online_shop/features/shop/models/cartItemModel.dart';
import '../../../../utile/const/colors.dart';
import '../../../../utile/const/sizes.dart';
import '../../../../utile/helpers/helper_functions.dart';
import '../../Images/roundedImage.dart';
import '../../text/brandTitleWithVerifyIcon.dart';
import '../../text/productText.dart';

class MyCardItem extends StatelessWidget {
  const MyCardItem({
    super.key,
    required this.cartItem
  });

  final CartItemModel cartItem;

  @override
  Widget build(BuildContext context) {
    final dark = MyHelperFunction.isDarkMode(context);
    return Row(
      children: [
        MyRoundedImge(
            width: 60,
            height: 60,
            padding: EdgeInsets.all(Mysize.sm),
            backgroundColor: dark ? Mycolors.darkerGrey : Mycolors.light,
            imageUrl: cartItem.image ?? "",
            isNetworkImage: true,
        ),
        SizedBox(width: Mysize.spaceBtwItems,),
        Expanded(
            child:
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyBrandTittleWithVerifyIcon(title: cartItem.brandName ?? ""),
                MyProducttitleText(title: cartItem.title,maxLines: 1,),
                RichText(
                    text: TextSpan(
                        children: (cartItem.selectedVariation ?? {}).entries.map((e) => TextSpan(
                          children: [
                            TextSpan(text: "${e.key} ",style: Theme.of(context).textTheme.bodySmall),
                            TextSpan(text: "${e.value} ",style: Theme.of(context).textTheme.bodyLarge),
                          ]
                        ),).toList()
                    )
                )
              ],
            )
        )
      ],
    );
  }
}