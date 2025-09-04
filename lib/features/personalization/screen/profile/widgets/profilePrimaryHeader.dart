import 'package:flutter/material.dart';
import '../../../../../common/widgets/Images/UserProfileLogo.dart';
import '../../../../../common/widgets/custom_shapes/primary_home_container.dart';
import '../../../../../utile/const/sizes.dart';

class MyProfilePrimaryHeader extends StatelessWidget {
  const MyProfilePrimaryHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(height: Mysize.profilePrimaryHeaderHeight + 60),
        MyPrimaryHeaderContainer(
          height: Mysize.profilePrimaryHeaderHeight,
          child: Container(),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Center(
            child: UserProfileLogo(),
          ),
        ),

      ],
    );
  }
}
