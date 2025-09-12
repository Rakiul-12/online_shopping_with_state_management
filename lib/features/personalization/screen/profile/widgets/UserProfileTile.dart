import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';
import 'package:online_shop/features/personalization/controller/userController.dart';
import 'package:online_shop/features/personalization/screen/editProfileScreen/edit_profile.dart';

class UserProfileTile extends StatelessWidget {
  const UserProfileTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = userController.instance;
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Obx(()=> Text(controller.user.value.fullName,style: Theme.of(context).textTheme.headlineSmall,)),
      subtitle: Obx(()=> Text(controller.user.value.email,style: Theme.of(context).textTheme.bodySmall,)),
      trailing: IconButton(onPressed: ()=>Get.to(()=>edit_profile()), icon: Icon(Iconsax.edit)),
    );
  }
}