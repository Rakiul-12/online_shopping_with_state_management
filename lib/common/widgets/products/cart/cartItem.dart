import 'package:flutter/material.dart';
import '../../../../utile/const/colors.dart';
import '../../../../utile/const/image.dart';
import '../../../../utile/const/sizes.dart';
import '../../../../utile/helpers/helper_functions.dart';
import '../../Images/roundedImage.dart';
import '../../text/brandTitleWithVerifyIcon.dart';
import '../../text/productText.dart';

class MyCardItem extends StatelessWidget {
  const MyCardItem({
    super.key,
  });


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
            imageUrl: MyImage.productImage4a
        ),
        SizedBox(width: Mysize.spaceBtwItems,),
        Expanded(
            child:
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyBrandTittleWithVerifyIcon(title: "iPhone"),
                MyProducttitleText(title: "iPhone 11 64 GB w",maxLines: 1,),
                RichText(
                    text: TextSpan(
                        children: [
                          TextSpan(text: "Color ",style: Theme.of(context).textTheme.bodySmall),
                          TextSpan(text: "Green ",style: Theme.of(context).textTheme.bodyLarge),
                          TextSpan(text: "Green ",style: Theme.of(context).textTheme.bodyLarge),
                          TextSpan(text: "Storage ",style: Theme.of(context).textTheme.bodySmall),
                          TextSpan(text: "512GB ",style: Theme.of(context).textTheme.bodyLarge),
                        ]
                    )
                )
              ],
            )
        )
      ],
    );
  }
}