import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_shop/common/widgets/form_devider/formDivider.dart';
import 'package:online_shop/common/widgets/social_icon/socialIcon.dart';
import 'package:online_shop/common/widgets/style/padding.dart';
import 'package:online_shop/features/authentication/screens/signUp/signUpForm.dart';
import 'package:online_shop/utile/const/sizes.dart';
import 'package:online_shop/utile/const/text.dart';

import '../../backend/SignUpController/SignUpController.dart';

class signUpScreen extends StatelessWidget {
  const signUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
            padding: MyPadding.screenPadding,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(MyText.SignUpTitle,style: Theme.of(context).textTheme.headlineMedium),
              SizedBox(height: Mysize.spaceBtwSections),
              signUpForm(),
              SizedBox(height: Mysize.spaceBtwItems),
              MyFormDivider(title: MyText.SignUpwith),
              SizedBox(height: Mysize.spaceBtwInputFields),
              MySocialIcon()
            ],
          ),
        ),
      ),
    );
  }
}

