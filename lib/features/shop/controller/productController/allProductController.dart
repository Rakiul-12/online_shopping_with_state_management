import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:online_shop/data/repository/product/productRepository.dart';
import 'package:online_shop/features/shop/models/productModel.dart';
import 'package:online_shop/utile/popup/snackbarHelpers.dart';

class AllProductController extends GetxController{
  static AllProductController get instance => Get.find();
  final _repository = productRepository.instance;
  final RxString selectedSortOption = "Name".obs;
  final RxList<ProductModel> products = <ProductModel>[].obs;


  // fetch product user dynamic query
  Future<List<ProductModel>> fetchProductsByQuery(Query? query) async {
    try{
      if(query == null) return [];

      List<ProductModel> product = await _repository.fetchProductsByQuery(query);
      return product;
    }catch(e){
      MySnackBarHelpers.errorSnackBar(title: "Failed",message: e.toString());
      return [];
    }
  }

  // function to sort products
  void sortProducts(String sortOption) {
    selectedSortOption.value = sortOption;
    switch (sortOption) {
      case "Name":
        products.sort((a, b) => a.title.compareTo(b.title),);
        break;
      case "Lower Price":
        products.sort((a, b) => a.price.compareTo(b.price),);
        break;
      case "Higher Price":
        products.sort((a, b) => b.price.compareTo(a.price),);
        break;
      case "Newest":
        products.sort((a, b) => a.date!.compareTo(b.date!),);
        break;
      case "Sale":
        products.sort((a, b) {
          if(b.salePrice > 0){
            return b.salePrice.compareTo(a.salePrice);
          }else if(a.salePrice > 0){
            return -1;
          }else{
            return 1;
          }
        });
        break;
      default:
    }
  }

  // function to assign products
  void assignProducts(List<ProductModel> products){
    this.products.assignAll(products);
    sortProducts("Name");
  }
}