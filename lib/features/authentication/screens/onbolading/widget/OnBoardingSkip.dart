import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_shop/features/authentication/backend/OnBoardingBackend/onBoarding_controller.dart';

import '../../../../../utile/helpers/device_helper.dart';
class OnBoadingSkipButton extends StatelessWidget {
  const OnBoadingSkipButton({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final controller = OnBoardingController.instance;
    return Obx(
          ()=> Positioned(
          top: MyDeviceHelper.getAppBarHeight(),
          right: 0,
          child: TextButton(
            onPressed: controller.skipPage,
            child: controller.CurrentIndex.value == 2 ? SizedBox() : Text("Skip"),
          )),
    );
  }
}