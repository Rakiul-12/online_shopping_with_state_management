import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';

class authentication_repo extends GetxController{
  static authentication_repo  get instance=>Get.find();


  @override
  void onReady() {
    FlutterNativeSplash.remove();
  }
}