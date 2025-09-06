import 'package:flutter/material.dart';
import 'package:online_shop/common/widgets/custom_shapes/rounded_container.dart';
import 'package:online_shop/common/widgets/text/sectionHeading.dart';
import 'package:online_shop/utile/const/colors.dart';
import 'package:online_shop/utile/const/image.dart';
import 'package:online_shop/utile/const/sizes.dart';
import 'package:online_shop/utile/helpers/helper_functions.dart';

class MyPaymentBillingSection extends StatelessWidget {
  const MyPaymentBillingSection({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = MyHeplerFunction.isDarkMode(context);
    return Column(
      children: [
        MySectionHeading(
          title: "Payment Method",
          buttontitle: "Change",
          onPressed: () {}
        ),
        SizedBox(height: Mysize.spaceBtwItems / 2,),
        Row(
          children: [
            MyRoundedContainer(
              width: 60,
              height: 35,
              backgroundColor: dark ? Mycolors.light : Mycolors.white,
              padding: EdgeInsets.all(Mysize.sm),
              child: Image(image: AssetImage(MyImage.masterCard)),
            ),
            SizedBox(width: Mysize.spaceBtwItems / 2),
            Text("Master Card",style: Theme.of(context).textTheme.bodyLarge)
          ],
        )
      ],
    );
  }
}
