import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_shop/common/widgets/style/padding.dart';
import 'package:online_shop/common/widgets/form_devider/formDivider.dart';
import 'package:online_shop/features/authentication/backend/logIn/login_controller.dart';
import 'package:online_shop/features/authentication/screens/login/widgets/logInHeader.dart';
import 'package:online_shop/common/widgets/social_icon/socialIcon.dart';
import 'package:online_shop/features/authentication/screens/login/widgets/textField.dart';
import 'package:online_shop/utile/const/sizes.dart';
import 'package:online_shop/utile/const/text.dart';

class logInScreen extends StatelessWidget {
  const logInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(loginController());
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: MyPadding.screenPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MylogInHeader(),
        
              SizedBox(height: Mysize.spaceBtwItems),
        
              form_filed(),
        
              SizedBox(height: Mysize.spaceBtwInputFields),
        
              MyFormDivider(title: MyText.SignInWith),
        
              SizedBox(height: Mysize.spaceBtwSections),
        
              MySocialIcon(),
            ],
          ),
        ),
      ),
    );
  }
}


