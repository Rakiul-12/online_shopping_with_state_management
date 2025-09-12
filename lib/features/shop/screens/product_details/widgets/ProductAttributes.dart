import 'package:flutter/material.dart';
import 'package:online_shop/common/widgets/custom_shapes/rounded_container.dart';
import 'package:online_shop/common/widgets/text/productText.dart';
import 'package:online_shop/common/widgets/text/product_price.dart';
import 'package:online_shop/common/widgets/text/sectionHeading.dart';
import 'package:online_shop/utile/const/colors.dart';
import 'package:online_shop/utile/const/sizes.dart';
import '../../../../../common/widgets/Chips/choicheChips.dart';
import '../../../../../utile/helpers/helper_functions.dart';

class productAttributes extends StatelessWidget {
  const productAttributes({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = MyHelperFunction.isDarkMode(context);
    return Column(
      children: [
        MyRoundedContainer(
          padding: EdgeInsets.all(Mysize.md),
          backgroundColor: dark ? Mycolors.darkerGrey : Mycolors.grey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  MySectionHeading(title: "Variation",showActionBtn: false,),
                  SizedBox(width: Mysize.spaceBtwItems,),
                  Column(
                    children: [
                      Row(
                        children: [
                          MyProducttitleText(title: "Price: ", smallSize: true,),
                          Text(" \$250",style: Theme.of(context).textTheme.titleSmall!.apply(
                              decoration:TextDecoration.lineThrough
                          ),),
                          SizedBox(width: Mysize.spaceBtwItems,),
                          MyProductPriceText(price: "2000")
                        ],
                      ),
                      Row(
                        children: [
                          MyProducttitleText(title: "Stock: ", smallSize: true,),
                          Text(" In Stock",style: Theme.of(context).textTheme.titleMedium,)
                        ],
                      )
                    ],
                  )
                ],
              ),
              MyProducttitleText(title: "This is a product of iPhone 11 with 512 GB",smallSize: true,maxLines: 1,)
            ],
          ),
        ),
        SizedBox(height: Mysize.spaceBtwItems,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MySectionHeading(title: "Colors",showActionBtn: false,),
            SizedBox(height: Mysize.spaceBtwItems / 2,),
            Wrap(
              spacing: Mysize.sm,
              children: [
                MyChoiceChip(
                    text: "Red",
                    selected: false,
                    onSelected: (value){}
                ),
                MyChoiceChip(
                    text: "Grey",
                    selected: false,
                    onSelected: (value){}
                ),
                MyChoiceChip(
                    text: "Black",
                    selected: false,
                    onSelected: (value){}
                ),
              ],
            )
          ],
        ),
        SizedBox(height: Mysize.spaceBtwItems,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MySectionHeading(title: "Sizes",showActionBtn: false,),
            SizedBox(height: Mysize.spaceBtwItems / 2,),
            Wrap(
              spacing: Mysize.sm,
              children: [
                MyChoiceChip(
                    text: "Small",
                    selected: false,
                    onSelected: (value){}
                ),
                MyChoiceChip(
                    text: "Medium",
                    selected: false,
                    onSelected: (value){}
                ),
                MyChoiceChip(
                    text: "Large",
                    selected: false,
                    onSelected: (value){}
                ),
              ],
            )
          ],
        )
      ],
    );
  }
}


