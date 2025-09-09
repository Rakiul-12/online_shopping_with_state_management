import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:online_shop/common/widgets/Button/elevatedButton.dart';
import 'package:online_shop/common/widgets/style/padding.dart';
import 'package:online_shop/features/authentication/backend/forgatePassword/forgetPassController.dart';
import 'package:online_shop/features/authentication/screens/login/login_screen.dart';
import 'package:online_shop/utile/const/colors.dart';
import 'package:online_shop/utile/const/sizes.dart';
import 'package:online_shop/utile/const/text.dart';

class resetPasswordScreen extends StatelessWidget {
  const resetPasswordScreen({super.key,
    required this.email
  });

  final String email;
  @override
  Widget build(BuildContext context) {
    final controller = forgetPassController.instance;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        actions: [
          IconButton(onPressed: (){
            Get.offAll(()=>logInScreen());
          }, icon: Icon(CupertinoIcons.clear))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: MyPadding.screenPadding,
          child: Column(
            children: [
              Image.asset("assets/image/forgotPassBanner.png"),
              Text(MyText.ForgotPassSentMailTitle,style: Theme.of(context).textTheme.headlineMedium,),
              SizedBox(height: Mysize.sm,),
              Text(email,style: Theme.of(context).textTheme.labelLarge,),
              SizedBox(height: Mysize.sm,),
              Text(MyText.ForgotPassSentMailSubTitle,textAlign: TextAlign.center,style: Theme.of(context).textTheme.bodySmall,),
              SizedBox(height: Mysize.spaceBtwSections,),
              MyElevatedButton(onPressed: ()=>Get.offAll(logInScreen()), child: Text(MyText.ForgotPassSentMailBtnText)),
              SizedBox(height: Mysize.sm,),
              TextButton(onPressed: controller.ResendPasswordRestEmail, child: Text(MyText.ForgotPassSentMailResendMail,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Mycolors.primary
                ),))
            ],
          ),
        ),
      ),
    );
  }
}
