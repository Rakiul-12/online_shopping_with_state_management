import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_shop/features/shop/models/productModel.dart';
import 'package:online_shop/utile/const/sizes.dart';

class imageController extends GetxController{
  static imageController get instance => Get.find();

  RxString selectedProductImage = "".obs;


  // Function to load all images of produts
  List<String> getAllProductImage (ProductModel product){

    Set<String> images = {};

    // load Thumbnail image
    images.add(product.thumbnail);

    // assign thumbnail as selected image
    selectedProductImage.value = product.thumbnail;

    // load all images of product
    if(product.images != null && product.images!.isNotEmpty){
      images.addAll(product.images!);
    }

    // load all images from the product variation
    if(product.productVariations != null && product.productVariations!.isNotEmpty){
      List<String> variationImages = product.productVariations!.map((variation) => variation.image).toList();
      images.addAll(variationImages);
    }
    return images.toList();
  }


  void showEnlargeImage(String image){
    Get.to(fullscreenDialog: true,
        ()=> Dialog.fullscreen(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: Mysize.defaultSpace * 2, horizontal: Mysize.defaultSpace),
                child: CachedNetworkImage(imageUrl: image),
              ),
              SizedBox(height: Mysize.spaceBtwSections,),
              Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  width: 150,
                  child: OutlinedButton(onPressed: Get.back, child: Text("Close")),
                ),
              )
            ],
          ),
        )
    
    );
  }
}