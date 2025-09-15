import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:online_shop/data/repository/user/UserRepository.dart';
import 'package:online_shop/features/personalization/controller/userController.dart';
import 'package:online_shop/navigation_menu.dart';
import 'package:online_shop/utile/helpers/NetworkManager.dart';
import 'package:online_shop/utile/popup/fullScreenLoader.dart';
import 'package:online_shop/utile/popup/snackbarHelpers.dart';

class ChangeNameController extends GetxController{
  static ChangeNameController get instance => Get.find();

  final _userController = userController.instance;
  final _userRepository = UserRepository.instance;
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final updateUserFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    initializeNames();
    super.onInit();
  }


  void initializeNames(){
    firstName.text = _userController.user.value.firstName;
    lastName.text = _userController.user.value.lastName;
  }


  Future<void>updateUserName()async{

    try{
      MyFullScreenLoader.openLoadingDialog('We are updating your information...');

      bool isConnected = await NetworkManager.instance.isConnected();
      if(!isConnected){
        MyFullScreenLoader.stopLoading();
        MySnackBarHelpers.errorSnackBar(title: "No Internet Connection");
        return;
      }

      if(!updateUserFormKey.currentState!.validate()){
        MyFullScreenLoader.stopLoading();
        return;
      }

      Map<String ,dynamic>map ={"firstName": firstName.text,"lastName": lastName.text};
      await _userRepository.updateSingleField(map);


      // Update user form Rx
      _userController.user.value.firstName = firstName.text;
      _userController.user.value.lastName = lastName.text;

      MyFullScreenLoader.stopLoading();
      Get.offAll(()=>navigationMenuScreen());
      MySnackBarHelpers.successSnackBar(title: "Congratulations",message: "Your name has been updated");
    }catch(e){
      MyFullScreenLoader.stopLoading();
      MySnackBarHelpers.errorSnackBar(title: "Update named field!",message: e.toString());
    }
  }
}