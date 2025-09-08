import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';
import 'package:online_shop/features/authentication/backend/logIn/login_controller.dart';
import 'package:online_shop/features/authentication/screens/forgetPass/forgotPassword.dart';
import 'package:online_shop/features/authentication/screens/signUp/signUpScreen.dart';
import 'package:online_shop/navigation_menu.dart';
import 'package:online_shop/utile/validators/validations.dart';
import '../../../../../common/widgets/Button/elevatedButton.dart';
import '../../../../../utile/const/sizes.dart';
import '../../../../../utile/const/text.dart';

class form_filed extends StatelessWidget {
  const form_filed({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = loginController.instance;
    return Form(
      key: controller.loginFormKey,
      child: Column(
        children: [
          TextFormField(
            controller: controller.email,
            validator: (value) => MyValidator.validateEmail(value),
            decoration: InputDecoration(
              prefixIcon: Icon(Iconsax.direct_right),
              labelText: MyText.onLogInScreenEmail,
            ),
          ),
          SizedBox(height: Mysize.spaceBtwInputFields),
          Obx(
            () => TextFormField(
              controller: controller.pass,
              validator: (value) => MyValidator.validateEmptyText("Password",value),
              obscureText: controller.showPass.value,
              decoration: InputDecoration(
                prefixIcon: Icon(Iconsax.password_check),
                labelText: MyText.onLogInScreenPassword,
                suffixIcon: IconButton(
                  onPressed: () => controller.showPass.toggle(),
                  icon: controller.showPass.value
                      ? Icon(Iconsax.eye_slash)
                      : Icon(Iconsax.eye),
                ),
              ),
            ),
          ),
          SizedBox(height: Mysize.spaceBtwInputFields / 2),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Obx(
                    () => Checkbox(
                      value: controller.CheckRememberMe.value,
                      onChanged: (value) {
                        controller.CheckRememberMe.toggle();
                      },
                    ),
                  ),
                  Text(MyText.onLogInScreenRemember),
                ],
              ),
              TextButton(
                onPressed: () {
                  Get.off(() => forgotPass());
                },
                child: Text(MyText.onLogInScreenForgetPass),
              ),
            ],
          ),

          SizedBox(height: Mysize.spaceBtwInputFields),

          MyElevatedButton(
            onPressed:  controller.logInWithEmailAndPass ,
            child: Text(MyText.SignIn),
          ),
          SizedBox(height: Mysize.spaceBtwItems),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              onPressed: () => Get.to(() => signUpScreen()),
              child: Text(MyText.CreateAc),
            ),
          ),
        ],
      ),
    );
  }
}
