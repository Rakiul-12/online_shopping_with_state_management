import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../../../utile/helpers/device_helper.dart';

class onBoardingDotIndicator extends StatelessWidget {
  const onBoardingDotIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: MyDeviceHelper.getBottomNavigationBarHeight() * 4,
        left: MyDeviceHelper.getScreenWidth(context) / 3,
        right: MyDeviceHelper.getScreenWidth(context) / 3,
        child: SmoothPageIndicator(
          controller: PageController(),
          count: 3,
          effect: ExpandingDotsEffect(
              dotHeight: 6.0
          ),
        )
    );
  }
}