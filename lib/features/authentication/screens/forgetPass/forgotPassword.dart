import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:online_shop/common/widgets/Button/elevatedButton.dart';
import 'package:online_shop/common/widgets/style/padding.dart';
import 'package:online_shop/features/authentication/screens/forgetPass/restPassword.dart';
import 'package:online_shop/features/authentication/screens/login/login_screen.dart';
import 'package:online_shop/utile/const/sizes.dart';
import 'package:online_shop/utile/const/text.dart';

class forgotPass extends StatelessWidget {
  const forgotPass({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Get.offAll(logInScreen());
          },
        ),
      ),
      body:
      SingleChildScrollView(
        child: Padding(
          padding: MyPadding.screenPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(MyText.ForgotPassTitle,style: Theme.of(context).textTheme.headlineMedium,),
              SizedBox(height: Mysize.spaceBtwItems,),
              Text(MyText.ForgotPassSubtitle,style: Theme.of(context).textTheme.bodyMedium,),
              SizedBox(height: Mysize.spaceBtwSections,),
              TextFormField(
                decoration: InputDecoration(
                  labelText: MyText.onLogInScreenEmail,
                  prefixIcon: Icon(Iconsax.direct_right)
                ),
              ),
              SizedBox(height: Mysize.spaceBtwInputFields,),
              MyElevatedButton(onPressed: (){
                Get.off(()=>resetPasswordScrren());
              }, child: Text(MyText.ForgotPassSubmit))
            ],
          ),
        ),
      ),
    );
  }
}
