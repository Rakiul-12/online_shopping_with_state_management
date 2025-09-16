import 'package:carousel_slider/carousel_controller.dart';
import 'package:get/get.dart';
import 'package:online_shop/data/repository/banner/banner_repository.dart';
import 'package:online_shop/features/shop/models/banners_model.dart';
import 'package:online_shop/utile/popup/snackbarHelpers.dart';

class BannerController extends GetxController{
  static BannerController get instance => Get.find();

  final _repository = Get.put(bannerRepository());
  RxList<BannerModel> banners = <BannerModel>[].obs;
  RxBool isLoadingBanner = false.obs;

  final carousalController = CarouselSliderController();

  RxInt currentIndex = 0.obs;

  void onPagedChanged (int index){
    currentIndex.value = index ;
  }


  @override
  void onInit() {
    super.onInit();
    fetchBanners();
  }

  Future<void>fetchBanners() async {
    try{
      isLoadingBanner.value = true;

      List<BannerModel> activeBanners = await _repository.fetchBanners();
      banners.assignAll(activeBanners);
    }catch(e){
      MySnackBarHelpers.errorSnackBar(title: "Failed",message: e.toString());
    }finally{
      isLoadingBanner.value = false;
    }
  }
}