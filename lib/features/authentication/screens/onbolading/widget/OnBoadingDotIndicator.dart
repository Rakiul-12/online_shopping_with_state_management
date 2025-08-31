import 'package:flutter/material.dart';
import 'package:online_shop/features/authentication/backend/OnBoardingBackend/onBoarding_controller.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../../../utile/helpers/device_helper.dart';

class onBoardingDotIndicator extends StatelessWidget {
  const onBoardingDotIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = OnBoardingController.instance;
    return Positioned(
        bottom: MyDeviceHelper.getBottomNavigationBarHeight() * 4,
        left: MyDeviceHelper.getScreenWidth(context) / 3,
        right: MyDeviceHelper.getScreenWidth(context) / 3,
        child: SmoothPageIndicator(
          controller: controller.pageController,
          onDotClicked: controller.dotNavigationClick,
          count: 3,
          effect: ExpandingDotsEffect(
              dotHeight: 6.0
          ),
        )
    );
  }
}