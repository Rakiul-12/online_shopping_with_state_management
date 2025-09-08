import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:online_shop/features/authentication/backend/SignUpController/SignUpController.dart';
import 'package:online_shop/utile/helpers/helper_functions.dart';
import 'package:online_shop/utile/validators/validations.dart';
import '../../../../common/widgets/Button/elevatedButton.dart';
import '../../../../utile/const/colors.dart';
import '../../../../utile/const/sizes.dart';
import '../../../../utile/const/text.dart';

class signUpForm extends StatelessWidget {
  const signUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = SignUpController.instance;
    final dark = MyHeplerFunction.isDarkMode(context);
    return Form(
      key: controller.signUpKey,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: controller.firstName,
                  validator: (value) =>
                      MyValidator.validateEmptyText("First Name", value),
                  decoration: InputDecoration(
                    prefixIcon: Icon(Iconsax.user),
                    labelText: MyText.SignUpFormFiled1,
                  ),
                ),
              ),
              SizedBox(width: Mysize.sm),
              Expanded(
                child: TextFormField(
                  controller: controller.lastName,
                  validator: (value) =>
                      MyValidator.validateEmptyText("Last Name", value),
                  decoration: InputDecoration(
                    prefixIcon: Icon(Iconsax.user),
                    labelText: MyText.SignUpFormFiled2,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: Mysize.spaceBtwInputFields),
          TextFormField(
            controller: controller.email,
            validator: (value) => MyValidator.validateEmail(value),
            decoration: InputDecoration(
              prefixIcon: Icon(Iconsax.direct_right),
              labelText: MyText.onLogInScreenEmail,
            ),
          ),
          SizedBox(height: Mysize.spaceBtwInputFields),
          TextFormField(
            controller: controller.phoneNumber,
            validator: (value) => MyValidator.validatePhoneNumber(value),
            decoration: InputDecoration(
              prefixIcon: Icon(Iconsax.call),
              labelText: MyText.SignUpFormFiled3,
            ),
          ),
          SizedBox(height: Mysize.spaceBtwInputFields),
          Obx(
            () => TextFormField(
              obscureText: controller.passVisible.value,
              controller: controller.pass,
              validator: (value) => MyValidator.validatePassword(value),
              decoration: InputDecoration(
                prefixIcon: Icon(Iconsax.password_check),
                suffixIcon: IconButton(
                  onPressed: () => controller.passVisible.value =
                      !controller.passVisible.value,
                  icon: Icon(
                    controller.passVisible.value
                        ? Iconsax.eye_slash
                        : Iconsax.eye,
                  ),
                ),
                labelText: MyText.onLogInScreenPassword,
              ),
            ),
          ),
          SizedBox(height: Mysize.spaceBtwInputFields / 2),
          Row(
            children: [
              Obx(
                () => Checkbox(
                  value: controller.privacyPolicyCheck.value,
                  onChanged: (value) => controller.privacyPolicyCheck.value =
                      !controller.privacyPolicyCheck.value,
                ),
              ),
              RichText(
                text: TextSpan(
                  style: Theme.of(context).textTheme.bodyMedium,
                  children: [
                    TextSpan(text: MyText.SignUpagreeAgree),
                    TextSpan(
                      text: MyText.SignUpagreePrivacy,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: dark ? Mycolors.white : Mycolors.primary,
                        decoration: TextDecoration.underline,
                        decorationColor: dark
                            ? Mycolors.white
                            : Mycolors.primary,
                      ),
                    ),
                    TextSpan(text: MyText.SignUpagreeAnd),
                    TextSpan(
                      text: MyText.SignUpagreeTerm,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: dark ? Mycolors.white : Mycolors.primary,
                        decoration: TextDecoration.underline,
                        decorationColor: dark
                            ? Mycolors.white
                            : Mycolors.primary,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: Mysize.spaceBtwItems),
          MyElevatedButton(
            onPressed: controller.registerUser,
            child: Text(MyText.SignUpCreateAc),
          ),
        ],
      ),
    );
  }
}
