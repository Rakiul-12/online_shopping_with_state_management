import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';
import 'package:online_shop/features/personalization/screen/editProfileScreen/edit_profile.dart';

class UserProfileTile extends StatelessWidget {
  const UserProfileTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text("Rakibul islam",style: Theme.of(context).textTheme.headlineSmall,),
      subtitle: Text("rakibulemon22@gmail.com",style: Theme.of(context).textTheme.bodySmall,),
      trailing: IconButton(onPressed: ()=>Get.to(()=>edit_profile()), icon: Icon(Iconsax.edit)),
    );
  }
}