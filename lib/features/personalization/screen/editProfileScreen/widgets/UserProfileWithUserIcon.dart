import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:online_shop/features/personalization/controller/userController.dart';
import '../../../../../common/widgets/Images/UserProfileLogo.dart';
import '../../../../../common/widgets/icons/circular_icon.dart';

class UserProfileWithUserIcon extends StatelessWidget {
  const UserProfileWithUserIcon({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = userController.instance;
    return Stack(
      children: [
        Center(child: UserProfileLogo()),
        Obx(() {
          if (controller.isLoading.value) {
            return SizedBox();
          }
          return Positioned(
            top: 0,
            bottom: 0,
            left: 0,
            right: 0,
            child: Center(
              child: MyCircularIcon(
                icon: Iconsax.edit,
                onPressed: controller.updateUserProfilePicture,
              ),
            ),
          );
        }),
      ],
    );
  }
}
