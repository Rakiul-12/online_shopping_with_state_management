import 'dart:convert';

import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:online_shop/data/repository/authentication_repo.dart';
import 'package:online_shop/data/repository/product/productRepository.dart';
import 'package:online_shop/features/shop/models/productModel.dart';
import 'package:online_shop/utile/popup/snackbarHelpers.dart';

class FavouriteController extends GetxController{
  static FavouriteController instance = Get.find();

  RxMap<String, bool> favourites = <String, bool>{}.obs;
  final _storage = GetStorage(AuthenticationRepository.instance.currentUser!.uid);

  @override
  void onInit() {
    super.onInit();
    initFavourite();
  }

  // load favourite from local storage
  Future<void> initFavourite()async{
     String? encodedFavourite =  _storage.read("favourite");
     if(encodedFavourite == null) return;
     Map<String, dynamic> storedFavourites = jsonDecode(encodedFavourite) as Map<String, dynamic>;
     favourites.assignAll(storedFavourites.map((key, value) => MapEntry(key, value as bool)));
  }

  // function to add or remove products from wishlist
  void toggleFavouriteProducts(String productId){
    if(favourites.containsKey(productId)){
      favourites.remove(productId);
      saveFavouriteToStorage();
      MySnackBarHelpers.customToast(message: "Product has been removed from the Wishlist");
    }else{
      favourites[productId] = true;
      saveFavouriteToStorage();
      MySnackBarHelpers.customToast(message: "Product has been added to the Wishlist");
    }

  }

  // function to store favourite in local storage
  void saveFavouriteToStorage(){
    _storage.write("favourite", jsonEncode(favourites));
  }

  // check available products in favourite
  bool isFavourite(String productId){
    return favourites[productId] ?? false;
  }

  // function to get all favourite products
  Future<List<ProductModel>> getFavouriteProducts()async{
    final productIds = favourites.keys.toList();
    return await productRepository.instance.getFavouriteProducts(productIds);
  }

}