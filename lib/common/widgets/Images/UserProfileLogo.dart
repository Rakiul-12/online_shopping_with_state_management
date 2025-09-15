import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:online_shop/common/widgets/shimmer/shimmerEffets.dart';
import 'package:online_shop/features/personalization/controller/userController.dart';
import '../../../utile/const/image.dart';
import 'circular_imae.dart';

class UserProfileLogo extends StatelessWidget {
  const UserProfileLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = userController.instance;
    return Obx(
      (){
        bool isProfileAvailable = controller.user.value.profilePicture.isNotEmpty;

        if(controller.isLoading.value){
         return MyShimmerEffect(width: 120, height: 120,radius: 120,);
        }
        return MyCirculerImage(
          image: isProfileAvailable ? controller.user.value.profilePicture : MyImage.profileLogo,
          height: 120,
          width: 120,
          borderWidth: 5.0,
          padding: 0,
          isNetworkImage: isProfileAvailable ? true : false,
        );
      }
    );
  }
}