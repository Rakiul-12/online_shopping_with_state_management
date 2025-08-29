import 'package:flutter/material.dart';
import '../../../../../common/widgets/Button/elevatedButton.dart';
import '../../../../../utile/const/sizes.dart';

class OnBoardingElevatedButton extends StatelessWidget {
  const OnBoardingElevatedButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
        left: 0,
        right: 0,
        bottom: Mysize.spaceBtwItems,
        child: MyElevatedButton(onPressed: (){}, child: Text("Next")));
  }
}