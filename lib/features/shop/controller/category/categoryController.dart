import 'package:get/get.dart';
import 'package:online_shop/features/shop/models/catagoryModel.dart';
import 'package:online_shop/utile/popup/snackbarHelpers.dart';
import '../../../../data/repository/catagory/categoryRepository.dart';

class categoryController extends GetxController{
  static categoryController get instance => Get.find();

  final _repository = Get.put(categoryRepository());

  RxList<CategoryModel> allCategories = <CategoryModel>[].obs;

  RxList<CategoryModel> featureCategories = <CategoryModel>[].obs;
  RxBool isCategoryLoading = false.obs;


  @override
  void onInit() {
    super.onInit();
    fetchCategories();
  }


  // function to get all categories and featured categories from firebase
  Future<void> fetchCategories() async {
    try{

      // start loading
      isCategoryLoading.value = true;

      // fetch categories
      List<CategoryModel> categories = await _repository.getAllCategories();
      allCategories.assignAll(categories);


      // get feature categories
      featureCategories.assignAll(categories.where((category)=>category.isFeatured && category.parentId.isEmpty));

    }catch(e){
      MySnackBarHelpers.errorSnackBar(title: "Failed",message: e.toString());
    }finally{
      isCategoryLoading.value = false;
    }
  }
}