import 'package:get/get.dart';
import 'package:online_shop/features/shop/controller/productController/variationController.dart';
import 'package:online_shop/features/shop/controller/promoCode/PromoCodeController.dart';
import 'package:online_shop/utile/helpers/NetworkManager.dart';

import '../features/shop/controller/checkout/checkOutController.dart';



class MyBindings extends Bindings{
  @override
  void dependencies() {
    Get.put(NetworkManager());
    Get.put(variationController());
    // Get.put(CheckOutController());
  }
}