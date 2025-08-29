import 'package:flutter/material.dart';
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
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Mysize.defaultSpace),
      child: Stack(
        children: [

          PageView(
            children: [
              onBoardingPage(animation: MyImage.onboadingAnimation,title: MyText.onBoardingTitle1,subtitle: MyText.onBoardingSubTitle1,),
              onBoardingPage(animation: MyImage.onboading2Animation,title: MyText.onBoardingTitle2,subtitle: MyText.onBoardingSubTitle2,),
              onBoardingPage(animation: MyImage.onboading3Animation,title: MyText.onBoardingTitle3,subtitle: MyText.onBoardingSubTitle3,),
            ],
          ),

          onBoardingDotIndicator(),

          OnBoardingElevatedButton(),

          OnBoadingSkipButton()

        ],
      ),
    );
  }
}