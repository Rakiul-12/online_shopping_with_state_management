import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:online_shop/data/repository/authentication_repo.dart';
import 'package:online_shop/features/authentication/screens/forgetPass/restPassword.dart';
import 'package:online_shop/utile/helpers/NetworkManager.dart';
import 'package:online_shop/utile/popup/fullScreenLoader.dart';
import 'package:online_shop/utile/popup/snackbarHelpers.dart';

class forgetPassController extends GetxController{
  static forgetPassController get instance => Get.find();

  final email = TextEditingController();
  final forgetPasswordFormKey = GlobalKey<FormState>();


  Future<void> sendPasswordRestEmail ()async{
    try{

      MyFullScreenLoader.openLoadingDialog("Processing your request...");


      bool isConnected = await NetworkManager.instance.isConnected();
      if(!isConnected){
        MyFullScreenLoader.stopLoading();
        MySnackBarHelpers.warningSnackBar(title: "No Internet Connection");
        return;
      }
      // form validation
      if(!forgetPasswordFormKey.currentState!.validate()){
        MyFullScreenLoader.stopLoading();
        return;
      }

      // send mail to reset password
      AuthenticationRepository.instance.sendEmailToRestPassword(email.text.trim());
      MyFullScreenLoader.stopLoading();
      MySnackBarHelpers.successSnackBar(title: "Email sent",message: "Email link sent to reset your password");
      Get.to(()=> resetPasswordScreen(email: email.text.trim()));
    }catch(e){
      MyFullScreenLoader.stopLoading();
      MySnackBarHelpers.errorSnackBar(title: "Failed forget password",message: e.toString());
    }
  }

  Future<void> ResendPasswordRestEmail ()async{
    try{

      MyFullScreenLoader.openLoadingDialog("Processing your request...");


      bool isConnected = await NetworkManager.instance.isConnected();
      if(!isConnected){
        MyFullScreenLoader.stopLoading();
        MySnackBarHelpers.warningSnackBar(title: "No Internet Connection");
        return;
      }

      // send mail to reset password
      AuthenticationRepository.instance.sendEmailToRestPassword(email.text);
      MyFullScreenLoader.stopLoading();
      MySnackBarHelpers.successSnackBar(title: "Email sent",message: "Email link sent to reset your password");

    }catch(e){
      MyFullScreenLoader.stopLoading();
      MySnackBarHelpers.errorSnackBar(title: "Failed forget password",message: e.toString());
    }
  }

}