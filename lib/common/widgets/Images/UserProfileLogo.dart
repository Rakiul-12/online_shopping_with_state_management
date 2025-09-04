import 'package:flutter/material.dart';
import '../../../utile/const/image.dart';
import 'circular_imae.dart';

class UserProfileLogo extends StatelessWidget {
  const UserProfileLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MyCirculerImage(
      image: MyImage.profileLogo,
      height: 120,
      width: 120,
      borderWidth: 5.0,
      padding: 0,
    );
  }
}