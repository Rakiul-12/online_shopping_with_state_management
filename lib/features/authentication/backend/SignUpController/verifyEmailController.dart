import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:online_shop/common/widgets/Screens/success_screen.dart';
import 'package:online_shop/data/repository/authentication_repo.dart';
import 'package:online_shop/utile/const/image.dart';
import 'package:online_shop/utile/const/text.dart';
import 'package:online_shop/utile/popup/snackbarHelpers.dart';

class verifyEmailController extends GetxController {
  static verifyEmailController get instance => Get.find();

  @override
  void onInit() {
    setTimerForAuthentication();
    sendEmailVerification();
    super.onInit();
  }

  // send mail for verifiaction
  Future<void> sendEmailVerification() async {
    try {
      await AuthenticationRepository.instance.sendEmailToVerification();
      MySnackBarHelpers.successSnackBar(
        title: "Email sent",
        message: "Please check your email and verify your email!",
      );
    } catch (e) {
      MySnackBarHelpers.errorSnackBar(title: "Error", message: e.toString());
    }
  }


  // Timer to automatically redirect on email verification
  void setTimerForAuthentication() {
    Timer.periodic(Duration(seconds: 1), (timer) async {
      await FirebaseAuth.instance.currentUser!.reload();
      final user = FirebaseAuth.instance.currentUser;
      if (user?.emailVerified ?? false) {
        timer.cancel();
        Get.off(
          () => success_screen(
            title: MyText.accountCreateTitle,
            subtitle: MyText.accountCreateSubTitle,
            image: MyImage.successfulPaymentIcon,
            onPressed: () => AuthenticationRepository.instance.screenRedirect(),
          ),
        );
      }
    });
  }


  Future<void>checkEmailVerificationStatus()async{
    try{
      final cuttentUser = FirebaseAuth.instance.currentUser;
      if(cuttentUser != null && cuttentUser.emailVerified ){
        Get.off(
              () => success_screen(
            title: MyText.accountCreateTitle,
            subtitle: MyText.accountCreateSubTitle,
            image: MyImage.successfulPaymentIcon,
            onPressed: () => AuthenticationRepository.instance.screenRedirect(),
          ),
        );
      }
    }catch(e){
      MySnackBarHelpers.errorSnackBar(title: "Error",message: e.toString());
    }
  }
}
