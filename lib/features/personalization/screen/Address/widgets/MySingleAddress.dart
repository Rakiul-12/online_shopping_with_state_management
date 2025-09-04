import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:online_shop/utile/helpers/helper_functions.dart';
import '../../../../../common/widgets/custom_shapes/rounded_container.dart';
import '../../../../../utile/const/colors.dart';
import '../../../../../utile/const/sizes.dart';

class MySingleAddress extends StatelessWidget {
  const MySingleAddress({
    super.key,
    required this.isSelected,
  });

  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    final dark = MyHeplerFunction.isDarkMode(context);
    return MyRoundedContainer(
      width: double.infinity,
      borderColor: isSelected ? Colors.transparent : dark ?  Mycolors.darkGrey : Mycolors.grey,
      backgroundColor: isSelected ? Mycolors.primary.withValues(alpha: .5) : Colors.transparent,
      showBorder: true,
      padding: EdgeInsets.all(Mysize.md),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Md Rakibul islam",style: Theme.of(context).textTheme.titleLarge,maxLines: 1,overflow: TextOverflow.ellipsis,),
              SizedBox(height: Mysize.spaceBtwItems /2,),
              Text("01870457061",maxLines: 1,overflow: TextOverflow.ellipsis,),
              SizedBox(height: Mysize.spaceBtwItems /2,),
              Text("House No.295, Hyderabad, Sindh, Pakistan")
            ],
          ),
          if(isSelected)
          Positioned(
            top: 0,
              bottom: 0,
              right: 6,
              child: Icon(Iconsax.tick_circle5))
        ],
      )
    );
  }
}