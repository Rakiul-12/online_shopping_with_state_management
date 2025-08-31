import 'package:flutter/material.dart';
import '../../../utile/const/colors.dart';
import '../../../utile/const/sizes.dart';

class MySocialIcon extends StatelessWidget {
  const MySocialIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        buildSocialButtonContainer("assets/logo/google.png", (){}),
        SizedBox(width: Mysize.spaceBtwItems,),
        buildSocialButtonContainer("assets/logo/facebook.png", (){}),
      ],
    );
  }

  Container buildSocialButtonContainer(String image, VoidCallback onPressed) {
    return Container(
        decoration: BoxDecoration(
            border: Border.all(color: Mycolors.grey),
            borderRadius: BorderRadius.circular(100)
        ),
        child: IconButton(onPressed: onPressed, icon: Image.asset(image,height: Mysize.iconMd,width: Mysize.iconMd,)),
      );
  }
}