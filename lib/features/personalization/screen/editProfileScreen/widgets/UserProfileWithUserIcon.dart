import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../common/widgets/Images/UserProfileLogo.dart';
import '../../../../../common/widgets/icons/circular_icon.dart';

class UserProfileWithUserIcon extends StatelessWidget {
  const UserProfileWithUserIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(child: UserProfileLogo()),
        Positioned(
            top: 0,
            bottom: 0,
            left: 0,
            right: 0,
            child: Center(child: MyCircularIcon(icon: Iconsax.edit,)))
      ],
    );
  }
}