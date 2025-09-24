import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get_storage/get_storage.dart';
import 'package:online_shop/features/authentication/screens/login/login_screen.dart';

class OnBoardingController extends GetxController{

  static OnBoardingController get instance => Get.find();

  final pageController = PageController();

  final storage = GetStorage();
  RxInt CurrentIndex = 0.obs;


  /// Called when PageView changes
  void updatePageIndicator(index){
    CurrentIndex.value = index;
  }

  /// Jump to a specific dot/page
  void dotNavigationClick(index){
    CurrentIndex.value = index;
    pageController.jumpToPage(index);
  }

  /// Go to next page or Login screen
  void nextPage(){
    if(CurrentIndex.value == 2){
      storage.write("isFirstTime", false);
      Get.offAll(()=> logInScreen());
      return;
    }
    CurrentIndex.value++;
    pageController.jumpToPage(CurrentIndex.value);
  }

  /// Skip directly to last page
  void skipPage(){
    CurrentIndex.value++;
    pageController.jumpToPage(CurrentIndex.value);
  }

}