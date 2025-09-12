import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:online_shop/common/widgets/icons/circular_icon.dart';
import 'package:online_shop/utile/const/colors.dart';
import 'package:online_shop/utile/const/sizes.dart';
import 'package:online_shop/utile/helpers/helper_functions.dart';

class addToCartSection extends StatelessWidget {
  const addToCartSection({super.key});

  @override
  Widget build(BuildContext context) {
    bool dark = MyHelperFunction.isDarkMode(context);
    return Container(
      decoration: BoxDecoration(
        color:  dark ? Mycolors.darkerGrey : Mycolors.light,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(Mysize.cardRadiusLg),
          topRight: Radius.circular(Mysize.cardRadiusLg)
        )
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Mysize.defaultSpace,vertical: Mysize.defaultSpace /2 ),
        child: Row(
          children: [
            MyCircularIcon(icon: Iconsax.minus,backgroundColor: Mycolors.darkGrey,width: 40,height: 40,color: Mycolors.white,),
            SizedBox(width: Mysize.spaceBtwItems,),
            Text("2",style: Theme.of(context).textTheme.titleSmall,),
            SizedBox(width: Mysize.spaceBtwItems,),
            MyCircularIcon(icon: Iconsax.add,backgroundColor: Mycolors.black,width: 40,height: 40,color: Mycolors.white,),
            Spacer(),
            ElevatedButton(onPressed: (){},
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(Mysize.md),
                  backgroundColor: Mycolors.black,
                  side: BorderSide(
                    color: Mycolors.black
                  )
                ),
                child: Row(
                  children: [
                    Icon(Iconsax.shopping_bag),
                    SizedBox(width: Mysize.spaceBtwItems / 2,),
                    Text("Add to cart"),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
