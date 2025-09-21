import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:online_shop/common/widgets/Button/elevatedButton.dart';
import 'package:online_shop/common/widgets/style/padding.dart';
import 'package:online_shop/data/repository/authentication_repo.dart';
import 'package:online_shop/features/authentication/backend/SignUpController/verifyEmailController.dart';
import 'package:online_shop/utile/const/colors.dart';
import 'package:online_shop/utile/const/sizes.dart';
import 'package:online_shop/utile/const/text.dart';

class verifyScrreen extends StatelessWidget {
  const verifyScrreen({super.key, this.email});

  final String? email;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(verifyEmailController());
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed:AuthenticationRepository.instance.logoutUser,
            icon: Icon(CupertinoIcons.clear),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: MyPadding.screenPadding,
          child: Column(
            children: [
              Image.asset("assets/image/forgotPassBanner.png"),
              Text(
                MyText.verifyScreenTitle,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              SizedBox(height: Mysize.sm),
              Text(email ?? "", style: Theme.of(context).textTheme.labelLarge),
              SizedBox(height: Mysize.sm),
              Text(
                MyText.verifyScreenSubTitle,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodySmall,
              ),
              SizedBox(height: Mysize.spaceBtwSections),
              MyElevatedButton(
                onPressed: controller.checkEmailVerificationStatus,
                child: Text(MyText.verifyScreenBtnText),
              ),
              SizedBox(height: Mysize.sm),
              TextButton(
                onPressed: controller.sendEmailVerification,
                child: Text(
                  MyText.verifyScreenResendMail,
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium!.copyWith(color: Mycolors.primary),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
