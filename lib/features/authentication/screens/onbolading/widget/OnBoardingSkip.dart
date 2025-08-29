import 'package:flutter/material.dart';

import '../../../../../utile/helpers/device_helper.dart';
class OnBoadingSkipButton extends StatelessWidget {
  const OnBoadingSkipButton({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: MyDeviceHelper.getAppBarHeight(),
        right: 0,
        child: TextButton(onPressed: (){}, child: Text("Skip")));
  }
}