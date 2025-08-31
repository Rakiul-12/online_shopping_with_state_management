import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:online_shop/features/authentication/screens/login/login_screen.dart';

class OnBoardingController extends GetxController{

  static OnBoardingController get instance => Get.find();

  final pageController = PageController();

  RxInt CurrentIndex = 0.obs;

  void updatePageIndicator(index){
    CurrentIndex.value = index;
  }

  void dotNavigationClick(index){
    CurrentIndex.value = index;
    pageController.jumpToPage(index);
  }

  void nextPage(){
    if(CurrentIndex.value == 2){
      Get.offAll(()=> logInScreen());
      return;
    }
    CurrentIndex.value++;
    pageController.jumpToPage(CurrentIndex.value);
  }

  void skipPage(){
    CurrentIndex.value++;
    pageController.jumpToPage(CurrentIndex.value);
  }

}