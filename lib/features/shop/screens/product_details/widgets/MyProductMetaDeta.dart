import 'package:flutter/material.dart';
import '../../../../../common/widgets/Images/circular_imae.dart';
import '../../../../../common/widgets/custom_shapes/rounded_container.dart';
import '../../../../../common/widgets/text/brandTitleWithVerifyIcon.dart';
import '../../../../../common/widgets/text/productText.dart';
import '../../../../../common/widgets/text/product_price.dart';
import '../../../../../utile/const/colors.dart';
import '../../../../../utile/const/image.dart';
import '../../../../../utile/const/sizes.dart';

class MyProductMetaDeta extends StatelessWidget {
  const MyProductMetaDeta({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            MyRoundedContainer(
              radius: Mysize.sm,
              backgroundColor: Mycolors.yellow.withValues(alpha: .8),
              padding: EdgeInsets.symmetric(
                horizontal: Mysize.sm,
                vertical: Mysize.xs,
              ),
              child: Text(
                "20%",
                style: Theme.of(
                  context,
                ).textTheme.labelLarge!.apply(color: Mycolors.black),
              ),
            ),
            SizedBox(width: Mysize.spaceBtwItems,),
            Text("\$2500",style: Theme.of(context).textTheme.titleSmall!.apply(
                decoration: TextDecoration.lineThrough
            ),),
            SizedBox(width: Mysize.spaceBtwItems,),
            MyProductPriceText(price: "2000",isLarge: true,),
            Spacer(),
            IconButton(onPressed: (){}, icon: Icon(Icons.share))
          ],
        ),
        SizedBox(height: Mysize.spaceBtwItems / 1.5,),
        MyProducttitleText(title: "Apple iPhone 11"),
        SizedBox(height: Mysize.spaceBtwItems /2,),
        Row(
          children: [
            MyProducttitleText(title: "Status"),
            SizedBox(width: Mysize.spaceBtwItems,),
            Text("In Stock",style: Theme.of(context).textTheme.titleMedium,)
          ],
        ),
        SizedBox(height: Mysize.spaceBtwItems /1.5,),
        Row(
          children: [
            MyCirculerImage(
              padding: 0,
              image: MyImage.appleLogo,height: 32,width: 32,),
            SizedBox(width: Mysize.spaceBtwItems,),
            MyBrandTittleWithVerifyIcon(title: "Apple")
          ],
        )
      ],
    );
  }
}