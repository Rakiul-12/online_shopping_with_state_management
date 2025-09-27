import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:online_shop/data/repository/authentication_repo.dart';
import 'package:online_shop/features/personalization/controller/userController.dart';
import 'package:online_shop/utile/const/keys.dart';
import 'package:online_shop/utile/helpers/NetworkManager.dart';
import 'package:online_shop/utile/popup/fullScreenLoader.dart';
import 'package:online_shop/utile/popup/snackbarHelpers.dart';

class LoginController extends GetxController{
  static LoginController get instance => Get.find();


  final email = TextEditingController();
  final pass = TextEditingController();
  RxBool showPass = true.obs;
  RxBool CheckRememberMe = false.obs;
  final loginFormKey = GlobalKey<FormState>();
  final localStorage = GetStorage();


  @override
  void onInit() {
    // show the email and pass on the login page
    email.text = localStorage.read(MyKeys.rememberMeEmail) ?? "";
    pass.text = localStorage.read(MyKeys.rememberMePass) ?? "";
    super.onInit();
  }

  // logInUserWithEmailAndPass
  Future<void>logInWithEmailAndPass()async{

    try{
      // start loading
      MyFullScreenLoader.openLoadingDialog("Logging you in...");

      // check interner connection
      final  isConnected = await NetworkManager.instance.isConnected();
      if(!isConnected){
        MyFullScreenLoader.stopLoading();
        MySnackBarHelpers.warningSnackBar(title: "No Internet Connection");
        return;
      }

      // form validation
      if(!loginFormKey.currentState!.validate()){
        MyFullScreenLoader.stopLoading();
        return;
      }

      // save data if remember me is checked
      if(CheckRememberMe.value){
        localStorage.write(MyKeys.rememberMeEmail, email.text.trim());
        localStorage.write(MyKeys.rememberMePass, pass.text.trim());
      }


      // logIn User
      await AuthenticationRepository.instance.loginWithEmailAndPass(email.text.trim(), pass.text.trim());
      MyFullScreenLoader.stopLoading();

      // screen redirection
      AuthenticationRepository.instance.screenRedirect();

    }catch(e){
      MyFullScreenLoader.stopLoading();
      MySnackBarHelpers.errorSnackBar(title: "Error",message: e.toString());
    }
  }

  // Sign in with google
  Future<void>SignInWithGoogle()async{
    try{
      MyFullScreenLoader.openLoadingDialog("Logging you in...");

      final isConnected = await NetworkManager.instance.isConnected();
      if(!isConnected){
        MyFullScreenLoader.stopLoading();
        MySnackBarHelpers.warningSnackBar(title: "No Internet Connection");
        return;
      }

      UserCredential userCredential = await AuthenticationRepository.instance.signInWithGoogle();

      // Save user record
      await  Get.put(userController()).saveUserRecord(userCredential);

      MyFullScreenLoader.stopLoading();

      AuthenticationRepository.instance.screenRedirect();
    }catch(e){
      MyFullScreenLoader.stopLoading();
      MySnackBarHelpers.errorSnackBar(title: "Login Failed",message: e.toString());
    }

  }


}
