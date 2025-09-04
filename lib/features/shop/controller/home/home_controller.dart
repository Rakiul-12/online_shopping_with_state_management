import 'package:carousel_slider/carousel_controller.dart';
import 'package:get/get.dart';

class HomeController extends GetxController{

  static HomeController get instance =>Get.find();

  final carousalController = CarouselSliderController();

  RxInt currentIndex = 0.obs;

  void onPagedChanged (int index){
    currentIndex.value = index ;
  }
}