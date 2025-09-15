import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:online_shop/common/widgets/AppBar/CustomAppbar.dart';
import 'package:online_shop/common/widgets/Button/elevatedButton.dart';
import 'package:online_shop/common/widgets/style/padding.dart';
import 'package:online_shop/features/personalization/controller/userController.dart';
import 'package:online_shop/navigation_menu.dart';
import 'package:online_shop/utile/const/sizes.dart';
import 'package:online_shop/utile/const/text.dart';
import 'package:online_shop/utile/validators/validations.dart';

class reAuthenticationScreen extends StatelessWidget {
  const reAuthenticationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = userController.instance;
    return Scaffold(
      appBar: MyAppbar(
        title: Text('Re-authenticate user'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: MyPadding.screenPadding,
          child: Form(
            key: controller.reAuthFormKey,
            child: Column(
              children: [
                Center(
                  child: Text(
                    "Re-authenticate and delete your account",
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ),
                SizedBox(height: Mysize.spaceBtwSections),
                TextFormField(
                  controller: controller.email,
                  validator: (value) => MyValidator.validateEmail(value),
                  decoration: InputDecoration(
                    prefixIcon: Icon(Iconsax.direct_right),
                    labelText: MyText.onLogInScreenEmail,
                  ),
                ),
                SizedBox(height: Mysize.spaceBtwItems),
                Obx(
                  () => TextFormField(
                    obscureText: controller.isShow.value,
                    controller: controller.pass,
                    validator: (value) =>
                        MyValidator.validateEmptyText("Password", value),
                    decoration: InputDecoration(
                      prefixIcon: Icon(Iconsax.password_check),
                      labelText: MyText.onLogInScreenPassword,
                      suffixIcon: IconButton(
                        onPressed: () => controller.isShow.toggle(),
                        icon:Icon(controller.isShow.value ? Iconsax.eye_slash : Iconsax.eye),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: Mysize.spaceBtwSections),
                MyElevatedButton(onPressed: controller.reAuthenticateUser, child: Text("Verify")),
                SizedBox(height: Mysize.spaceBtwItems),
                MyElevatedButton(onPressed:(){
                  Get.offAll(()=>navigationMenuScreen());
                }, child: Text("Cancel")),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
