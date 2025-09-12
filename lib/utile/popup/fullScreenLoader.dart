import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_shop/common/widgets/loader/MyAnimationLoader.dart';
import 'package:online_shop/utile/const/colors.dart';
import 'package:online_shop/utile/helpers/helper_functions.dart';

class MyFullScreenLoader {
  static void openLoadingDialog(String text ){
    showDialog(
        context: Get.overlayContext!,
        barrierDismissible: false,
        builder: (_)=>PopScope(
          canPop: false,
            child:Container(
              color: MyHelperFunction.isDarkMode(Get.context!) ? Mycolors.dark : Mycolors.white,
              width: double.infinity,
              height: double.infinity,
              child: Column(
                children: [
                  SizedBox(height: 250),
                  MyAnimationLoader(text: text)
                ],
              ),
            )
        )
    );
  }

  static stopLoading(){
    Navigator.of(Get.overlayContext!).pop();
  }

}