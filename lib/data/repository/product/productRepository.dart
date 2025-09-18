import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:online_shop/data/service/cloudinaryService.dart';
import 'package:online_shop/features/shop/models/productModel.dart';
import 'package:online_shop/utile/const/keys.dart';
import 'package:online_shop/utile/helpers/helper_functions.dart';
import 'package:dio/dio.dart'as dio;
import '../../../utile/exceptions/firebase_auth_exceptions.dart';
import '../../../utile/exceptions/firebase_exceptions.dart';
import '../../../utile/exceptions/formate_exceptions.dart';
import '../../../utile/exceptions/platform_exceptions.dart';

class productRepository extends GetxController{
   productRepository get instance => Get.find();

   final _db = FirebaseFirestore.instance;
   final _cloudinaryService = Get.put(cloudinaryServices());

   // Function to upload list of product to firebase
  Future<void> uploadProducts(List<ProductModel> products)async{
    try{
      for(ProductModel product in products){
        File thumbnailsFile = await MyHelperFunction.assetToFile(product.thumbnail);
        dio.Response response = await _cloudinaryService.uploadImage(thumbnailsFile, MyKeys.productFolder);
        if(response.statusCode == 200){
          product.thumbnail = response.data['url'];
        }

        // for upload image one by one
        if(product.images != null && product.images!.isNotEmpty){
          List<String> imageUrls = [];

          for(String image in product.images!){
            File imageFile = await MyHelperFunction.assetToFile(image);
            dio.Response response = await _cloudinaryService.uploadImage(imageFile, MyKeys.productFolder);
            if(response.statusCode == 200){
              imageUrls.add(response.data["url"]);
            }
          }
          // update product variation image
          for(final variation in product.productVariations ?? []){
            int index = product.images!.indexWhere((image) => image == variation.image);
            if(index != -1 && index < imageUrls.length ){
              variation.image = imageUrls[index];
            }else{
              print("Variation image '${variation.image}' not found in product.images.");
            }

          }
          // assign image urls to product
          product.images!.clear();
          product.images!.assignAll(imageUrls);
        }

        await _db.collection(MyKeys.productCollection).doc(product.id).set(product.toJson());
        
        print("Product ${product.id} uploaded");
      }
    }on FirebaseAuthException catch(e){
      throw MyFirebaseAuthException(e.code).message;
    }on FirebaseException catch(e){
      throw MyFirebaseException(e.code).message;
    }on FormatException catch(_){
      throw MyFormatException();
    }on PlatformException catch(e){
      throw MyPlatformException(e.code).message;
    }catch(e){
      rethrow;
    }
  }

   // Function to fetch list of product to firebase
   Future<List<ProductModel>> fetchProducts()async{
     try{
       final query = await _db.collection(MyKeys.productCollection).where("isFeatured",isEqualTo: true).limit(4).get();
       if(query.docs.isNotEmpty){
         List<ProductModel> products = query.docs.map((document) => ProductModel.fromSnapshot(document)).toList();
         return products;
       }
       return [];

     }on FirebaseAuthException catch(e){
       throw MyFirebaseAuthException(e.code).message;
     }on FirebaseException catch(e){
       throw MyFirebaseException(e.code).message;
     }on FormatException catch(_){
       throw MyFormatException();
     }on PlatformException catch(e){
       throw MyPlatformException(e.code).message;
     }catch(e){
       rethrow;
     }
   }
}