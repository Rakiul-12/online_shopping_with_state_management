import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:online_shop/features/authentication/backend/OnBoardingBackend/onBoarding_controller.dart';
import 'package:online_shop/features/authentication/screens/onbolading/widget/OnBoadingDotIndicator.dart';
import 'package:online_shop/features/authentication/screens/onbolading/widget/OnBoadingNextButton.dart';
import 'package:online_shop/features/authentication/screens/onbolading/widget/OnBoardingSkip.dart';
import 'package:online_shop/features/authentication/screens/onbolading/widget/onBoardingPage.dart';
import 'package:online_shop/utile/const/image.dart';
import 'package:online_shop/utile/const/sizes.dart';
import 'package:online_shop/utile/const/text.dart';

class onBoadingScreen extends StatelessWidget {
  const onBoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final light = MyHeplerFunction.isDarkMode(context);
    final controller = Get.put(OnBoardingController());
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Mysize.defaultSpace),
      child: Stack(
        children: [
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: [
              onBoardingPage(
                animation: MyImage.onboadingAnimation1,
                title: MyText.onBoardingTitle1,
                subtitle: MyText.onBoardingSubTitle1,
              ),
              onBoardingPage(
                animation: MyImage.onboadingAnimation2,
                title: MyText.onBoardingTitle2,
                subtitle: MyText.onBoardingSubTitle2,
              ),
              onBoardingPage(
                animation: MyImage.onboadingAnimation3,
                title: MyText.onBoardingTitle3,
                subtitle: MyText.onBoardingSubTitle3,
              ),
            ],
          ),

          onBoardingDotIndicator(),

          OnBoardingElevatedButton(),

          OnBoadingSkipButton(),
        ],
      ),
    );
  }
}
