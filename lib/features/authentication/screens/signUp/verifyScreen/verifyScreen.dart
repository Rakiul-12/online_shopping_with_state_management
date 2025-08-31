import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:online_shop/common/widgets/Button/elevatedButton.dart';
import 'package:online_shop/common/widgets/style/padding.dart';
import 'package:online_shop/features/authentication/screens/login/login_screen.dart';
import 'package:online_shop/utile/const/colors.dart';
import 'package:online_shop/utile/const/sizes.dart';
import 'package:online_shop/utile/const/text.dart';
import '../../../../../common/widgets/Screens/success_screen.dart';


class verifyScrreen extends StatelessWidget {
  const verifyScrreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
              Text(MyText.verifyScreenTitle,style: Theme.of(context).textTheme.headlineMedium,),
              SizedBox(height: Mysize.sm,),
              Text(MyText.ForgotPassSentMail,style: Theme.of(context).textTheme.labelLarge,),
              SizedBox(height: Mysize.sm,),
              Text(MyText.verifyScreenSubTitle,textAlign: TextAlign.center,style: Theme.of(context).textTheme.bodySmall,),
              SizedBox(height: Mysize.spaceBtwSections,),
              MyElevatedButton(onPressed: (){
                Get.off(()=>success_screen(
                  image: "assets/image/successfullyCreatedBanner.png",
                  title: MyText.accountCreateTitle,
                  subtitle: MyText.accountCreateSubTitle,
                  onPressed: () { },
                ));
              }, child: Text(MyText.verifyScreenBtnText)),
              SizedBox(height: Mysize.sm,),
              TextButton(onPressed: (){
              }, child: Text(MyText.verifyScreenResendMail,
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
