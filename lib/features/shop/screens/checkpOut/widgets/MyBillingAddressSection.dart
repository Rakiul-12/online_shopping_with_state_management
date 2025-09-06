import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:online_shop/common/widgets/text/sectionHeading.dart';
import 'package:online_shop/utile/const/colors.dart';
import 'package:online_shop/utile/const/sizes.dart';

class MyBillingAddressSection extends StatelessWidget {
  const MyBillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MySectionHeading(title: "Shipping Address",buttontitle: "Change",onPressed: (){},),
        Text("Rakibul islam",style: Theme.of(context).textTheme.titleLarge,),
        Row(
          children: [
            Icon(Iconsax.call,size: Mysize.iconSm,color: Mycolors.darkerGrey,),
            SizedBox(width: Mysize.spaceBtwItems/2),
            Text("01870457061"),
          ],
        ),
        SizedBox(height: Mysize.spaceBtwItems/2),
        Row(
          children: [
            Icon(Iconsax.user,size: Mysize.iconSm,color: Mycolors.darkerGrey,),
            SizedBox(width: Mysize.spaceBtwItems/2),
            Expanded(child: Text("House No.295, Hyderabad, Sindh, Pakistan",softWrap: true,)),
          ],
        ),
      ],
    );
  }
}
