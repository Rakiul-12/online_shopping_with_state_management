import 'package:get/get.dart';
import 'package:online_shop/data/repository/brand/brandRepository/brand_repository.dart';
import 'package:online_shop/features/shop/models/brandModel.dart';
import 'package:online_shop/utile/popup/snackbarHelpers.dart';

class brandController extends GetxController{
  static brandController get instance => Get.find();
  final _brandRepo = Get.put(brandRepository());

  RxList<BrandModel> allBrands = <BrandModel>[].obs;
  RxList<BrandModel> featureBrands = <BrandModel>[].obs;
  RxBool isLoadingBrand = false.obs;


  @override
  void onInit() {
    getBrands();
    super.onInit();
  }


  // Get all brand and featured brand
  Future<void> getBrands() async {
    try{
      isLoadingBrand.value = true;
      List<BrandModel> allBrands = await _brandRepo.fetchBrand();

      this.allBrands.assignAll(allBrands);

      featureBrands.assignAll(allBrands.where((brand) => brand.isFeatured ?? false).toList());
    }catch(e){
      MySnackBarHelpers.errorSnackBar(title: "Failed",message: e.toString());
    }finally{
      isLoadingBrand.value = false;
    }
  }

}