import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:online_shop/common/widgets/custom_shapes/rounded_container.dart';
import 'package:online_shop/utile/const/colors.dart';
import 'package:online_shop/utile/const/sizes.dart';
import 'package:online_shop/utile/helpers/helper_functions.dart';

class order_list extends StatelessWidget {
  const order_list({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = MyHelperFunction.isDarkMode(context);
    return ListView.separated(
      shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return MyRoundedContainer(
            showBorder: true,
            backgroundColor: dark ? Mycolors.dark : Mycolors.light,
            padding: EdgeInsets.all(Mysize.md),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Icon(Iconsax.ship),
                    SizedBox(width: Mysize.spaceBtwItems),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Processing",
                            style: Theme.of(context).textTheme.bodyLarge!
                                .apply(
                              color: Mycolors.primary,
                              fontWeightDelta: 1,
                            ),
                          ),
                          Text("01 Jan 2025"),
                        ],
                      ),
                    ),
                    Icon(
                      Iconsax.arrow_right_34,
                      color: Mycolors.darkGrey,
                      size: Mysize.iconSm,
                    ),
                  ],
                ),
                SizedBox(height: Mysize.spaceBtwItems / 1),
                Row(
                  children: [
                    Icon(Iconsax.tag),
                    SizedBox(width: Mysize.spaceBtwItems),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Order",
                            style: Theme.of(context).textTheme.labelMedium!
                                .apply(
                              color: Mycolors.darkGrey,
                              fontWeightDelta: 1,
                            ),
                          ),
                          Text(
                            "GYS324",
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Icon(Iconsax.calendar_1),
                        SizedBox(width: Mysize.spaceBtwItems),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Order",
                              style: Theme.of(context).textTheme.bodyLarge!
                                  .apply(
                                color: Mycolors.darkGrey,
                                fontWeightDelta: 1,
                              ),
                            ),
                            Text(
                              "06 Jan 2025",
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          );
        },
        separatorBuilder: (context, index) => SizedBox(height: Mysize.spaceBtwItems,),
        itemCount: 3
    );
  }
}
