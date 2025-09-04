import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:online_shop/common/widgets/AppBar/CustomAppbar.dart';
import 'package:online_shop/common/widgets/style/padding.dart';
import 'package:online_shop/common/widgets/text/sectionHeading.dart';
import 'package:online_shop/features/personalization/screen/editProfileScreen/widgets/UserProfileWithUserIcon.dart';
import 'package:online_shop/utile/const/sizes.dart';

class edit_profile extends StatelessWidget {
  const edit_profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppbar(
        showBackArrow: true,
        title: Text(
          "Edit Profile",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: MyPadding.screenPadding,
          child: Column(
            children: [
              UserProfileWithUserIcon(),
              SizedBox(height: Mysize.spaceBtwSections),
              Divider(),
              SizedBox(height: Mysize.spaceBtwItems),
              MySectionHeading(title: "Account Settings",showActionBtn: false,),
              UserDetailRow(
                title: "Name",
                value: "Rakibul islam",
                onPressed: () {},
              ),
              UserDetailRow(
                title: "Username",
                value: "Rakibul_islam12",
                onPressed: () {},
              ),
              SizedBox(height: Mysize.spaceBtwSections),
              Divider(),
              SizedBox(height: Mysize.spaceBtwItems),
              MySectionHeading(title: "Profile Settings",showActionBtn: false,),
              UserDetailRow(
                title: "UserID",
                value: "232345",
                icon: Iconsax.copy,
                onPressed: () {},
              ),
              UserDetailRow(
                title: "Email",
                value: "rakibulemon22@gmail.com",
                icon: Iconsax.arrow_right_34,
                onPressed: () {},
              ),
              UserDetailRow(
                title: "Phone Number",
                value: "01870457061",
                icon: Iconsax.arrow_right_34,
                onPressed: () {},
              ),
              UserDetailRow(
                title: "Gender",
                value: "Male",
                icon: Iconsax.arrow_right_34,
                onPressed: () {},
              ),
              SizedBox(height: Mysize.spaceBtwSections),
              Divider(),
              SizedBox(height: Mysize.spaceBtwItems),
              TextButton(
                onPressed: () {},
                child: Text(
                  "Close account",
                  style: Theme.of(
                    context,
                  ).textTheme.titleSmall!.apply(color: Colors.red),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class UserDetailRow extends StatelessWidget {
  const UserDetailRow({
    super.key,
    required this.title,
    required this.value,
    this.icon = Iconsax.arrow_right_34,
    required this.onPressed,
  });

  final String title, value;
  final IconData icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: Mysize.spaceBtwItems / 1.5,
        ),
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: Text(
                title,
                style: Theme.of(context).textTheme.bodySmall,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Expanded(
              flex: 5,
              child: Text(
                value,
                style: Theme.of(context).textTheme.bodyMedium,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Expanded(child: Icon(icon, size: Mysize.iconSm)),
          ],
        ),
      ),
    );
  }
}
