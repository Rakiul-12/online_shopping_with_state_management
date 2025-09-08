import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:online_shop/features/authentication/backend/logIn/login_controller.dart';
import '../../../utile/const/colors.dart';
import '../../../utile/const/sizes.dart';

class MySocialIcon extends StatelessWidget {
  const MySocialIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(loginController());
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        buildSocialButtonContainer("assets/logo/google.png", controller.SignInWithGoogle),
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