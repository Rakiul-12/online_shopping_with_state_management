import 'package:get/get.dart';
import 'package:online_shop/utile/helpers/NetworkManager.dart';

class MyBindings extends Bindings{
  @override
  void dependencies() {
    Get.put(NetworkManager());
  }
}