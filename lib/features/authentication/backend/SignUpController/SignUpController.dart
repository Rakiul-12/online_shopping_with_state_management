
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:online_shop/data/repository/authentication_repo.dart';
import 'package:online_shop/data/repository/user/UserRepository.dart';
import 'package:online_shop/features/authentication/models/user_modal.dart';
import 'package:online_shop/features/authentication/screens/signUp/verifyScreen/verifyScreen.dart';
import 'package:online_shop/utile/helpers/NetworkManager.dart';
import 'package:online_shop/utile/popup/fullScreenLoader.dart';
import 'package:online_shop/utile/popup/snackbarHelpers.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  // variable

  final signUpKey = GlobalKey<FormState>();
  RxBool passVisible = false.obs;
  RxBool privacyPolicyCheck = false.obs;

  // Form controller
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final email = TextEditingController();
  final phoneNumber = TextEditingController();
  final pass = TextEditingController();


  Future<void> registerUser() async {
    try {
      // start loading
      MyFullScreenLoader.openLoadingDialog(
          "We are processing your information...");

      // Check Internet Connectivity
      bool isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        MyFullScreenLoader.stopLoading();
        MySnackBarHelpers.warningSnackBar(title: "No Internet Connection");
        return;
      }

      // Check Privacy Policy
      if (!privacyPolicyCheck.value) {
        MyFullScreenLoader.stopLoading();
        MySnackBarHelpers.warningSnackBar(title: "Accept Privacy Policy",
            message: "In order to create account,"
                "you must have to read and accept the privacy and policy & terms of user.");
        return;
      }

      // form validation
      if (!signUpKey.currentState!.validate()) {
        return;
      }

      // Register user with firebase
      UserCredential userCredential = await AuthenticationRepository.instance.registerUser(
          email.text.trim(), pass.text.trim());

      // Create user modal
      UserModel userModel = UserModel(
          id: userCredential.user!.uid,
          firstName: firstName.text,
          lastName: lastName.text,
          username: "${firstName.text}${lastName.text}123",
          email: email.text.trim(),
          phoneNumber: phoneNumber.text.trim(),
          profilePicture: ""
      );
      // save user record
      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(userModel);
      MySnackBarHelpers.successSnackBar(title: "Congratulation",message: "Your account has been created! Verify your email address to continue");
      MyFullScreenLoader.stopLoading();
      Get.to(()=>verifyScrreen(email:email.text));
    } catch (e) {
      MyFullScreenLoader.stopLoading();
      MySnackBarHelpers.errorSnackBar(title: "Error",message: e.toString());
    }
  }
}