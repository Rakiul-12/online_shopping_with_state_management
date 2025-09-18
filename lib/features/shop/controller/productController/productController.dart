import 'dart:io';

import 'package:get/get.dart';
import 'package:online_shop/data/repository/product/productRepository.dart';
import 'package:online_shop/features/shop/models/productModel.dart';
import 'package:online_shop/utile/const/enums.dart';
import 'package:online_shop/utile/const/text.dart';
import 'package:online_shop/utile/popup/snackbarHelpers.dart';

class productController extends GetxController{
  static productController get instance => Get.find();
  final _productRepo = Get.put(productRepository());
  RxList<ProductModel> featuredProducts= <ProductModel>[].obs;
  RxBool isLoading = false.obs;


  @override
  void onInit() {
    super.onInit();
    getFeaturedProduct();
  }

  Future<void> getFeaturedProduct() async{
    try{

      isLoading.value = true;

      List<ProductModel> featuredProducts = await _productRepo.fetchProducts();

      this.featuredProducts.assignAll(featuredProducts);

    }catch(e){
      MySnackBarHelpers.errorSnackBar(title: "Failed",message: e.toString());
    }finally{
      isLoading.value = false;
    }
  }


  // Calculate Sale Percentage
  String? calculateSalePercentage(double originalPrice , double? salePrice){
    if(salePrice == null || salePrice <=0.0)return null;
    if(originalPrice <= 0.0)return null;
    double percentage = (( originalPrice - salePrice) / originalPrice) * 100;
    return percentage.toStringAsFixed(1);
  }


  // get product price or price range for variable product
  String getProductPrice(ProductModel product){
    double smallestPrice = double.infinity;
    double largestPrice = 0.0;

    // if not variation exist , return the single price or sale price

    if(product.productType == ProductType.single.toString()){
      return product.salePrice > 0 ? product.salePrice.toString() : product.price.toString();
    }
    else{

      // calculate the smallestPrice and largestPrice among variation

      for(final variation in product.productVariations!){
        double variationPrice = variation.salePrice > 0 ? variation.salePrice : variation.price;

        if(variationPrice > largestPrice){
          largestPrice = variationPrice;
        }
        if(variationPrice < smallestPrice){
          smallestPrice = variationPrice;
        }
      }
      if(smallestPrice.isEqual(largestPrice)){
        return largestPrice.toStringAsFixed(0);
      }else{
        return "${largestPrice.toStringAsFixed(0)} - ${MyText.currency}${smallestPrice.toStringAsFixed(0)}";
      }
    }
  }

}