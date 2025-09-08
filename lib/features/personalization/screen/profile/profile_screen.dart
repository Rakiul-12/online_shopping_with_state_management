import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:online_shop/common/widgets/text/sectionHeading.dart';
import 'package:online_shop/data/repository/authentication_repo.dart';
import 'package:online_shop/features/personalization/screen/Address/UserAddress.dart';
import 'package:online_shop/features/personalization/screen/Order/OrderScreen.dart';
import 'package:online_shop/features/personalization/screen/profile/widgets/SettingMenuTile.dart';
import 'package:online_shop/features/personalization/screen/profile/widgets/UserProfileTile.dart';
import 'package:online_shop/features/personalization/screen/profile/widgets/profilePrimaryHeader.dart';
import 'package:online_shop/utile/const/sizes.dart';


class profile_screen extends StatelessWidget {
  const profile_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            MyProfilePrimaryHeader(),
            Padding(
              padding: const EdgeInsets.all(Mysize.defaultSpace),
              child: Column(
                children: [
                  UserProfileTile(),
                  SizedBox(height: Mysize.spaceBtwItems,),
                  MySectionHeading(title: "Account Setting", showActionBtn: false,),
                  SettingMenuTile(
                    title: "My Address",
                    subtitle: "Set shopping delivery address",
                    icon: Iconsax.safe_home, onPressed: ()=>Get.to(()=>UserAddress()),
                  ),
                  SettingMenuTile(
                    title: "My Cart",
                    subtitle: "Add, remove products and move to checkout",
                    icon: Iconsax.shopping_cart,
                    onPressed: () {  },
                  ),
                  SettingMenuTile(
                    title: "My Orders",
                    subtitle: "In-progress and Completed Orders",
                    icon: Iconsax.box,
                    onPressed: ()=>Get.to(()=>orderScreen()),
                  ),
                  SizedBox(height: Mysize.spaceBtwItems,),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                        onPressed: authentication_repo.instance.logoutUser,
                        child: Text("Logout")
                    ),
                  ),
                  SizedBox(height: Mysize.spaceBtwItems,),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}





