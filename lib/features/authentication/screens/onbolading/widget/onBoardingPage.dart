import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:online_shop/utile/const/sizes.dart';
import '../../../../../utile/helpers/device_helper.dart';

class onBoardingPage extends StatelessWidget {
  const onBoardingPage({
    super.key, required this.animation, required this.title, required this.subtitle,
  });

  final String animation;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: MyDeviceHelper.getAppBarHeight()),
      child: Column(
        children: [
          Lottie.asset(animation),
          Text(title,style: Theme.of(context).textTheme.headlineMedium,),
          SizedBox(height: 10,),
          Text(subtitle,textAlign: TextAlign.center,style: Theme.of(context).textTheme.titleSmall,)
        ],
      ),
    );
  }
}
