import "package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart";
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_shop/features/authentication/backend/OnBoardingBackend/onBoarding_controller.dart';
import '../../../../../common/widgets/Button/elevatedButton.dart';
import '../../../../../utile/const/sizes.dart';

class OnBoardingElevatedButton extends StatelessWidget {
  const OnBoardingElevatedButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = OnBoardingController.instance;
    return Positioned(
        left: 0,
        right: 0,
        bottom: Mysize.spaceBtwItems,
        child: MyElevatedButton(
            onPressed : controller.nextPage,
            child:  Obx(
                    ()=> Text(controller.CurrentIndex.value == 2 ? "Get started" : "Next"))
            ));
  }
}