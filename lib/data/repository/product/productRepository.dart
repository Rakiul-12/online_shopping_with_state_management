import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:online_shop/data/service/cloudinaryService.dart';
import 'package:online_shop/features/shop/models/productModel.dart';
import 'package:online_shop/utile/const/keys.dart';
import 'package:online_shop/utile/helpers/helper_functions.dart';
import 'package:dio/dio.dart'as dio;
import 'package:online_shop/utile/popup/snackbarHelpers.dart';
import '../../../utile/exceptions/firebase_auth_exceptions.dart';
import '../../../utile/exceptions/firebase_exceptions.dart';
import '../../../utile/exceptions/formate_exceptions.dart';
import '../../../utile/exceptions/platform_exceptions.dart';

class productRepository extends GetxController{
   static productRepository get instance => Get.find();

   final _db = FirebaseFirestore.instance;
   final _cloudinaryService = Get.put(cloudinaryServices());

   // Function to upload list of product to firebase
  Future<void> uploadProducts(List<ProductModel> products)async{
    try{
      for (ProductModel product in products) {
        final Map<String, String> uploadedImageMap = {}; // 'assets/products/productImage4' : 'https:cloudinary'

        // upload thumbnail to cloudinary
        File thumbnailFile = await MyHelperFunction.assetToFile(product.thumbnail);
        dio.Response response = await _cloudinaryService.uploadImage(thumbnailFile, MyKeys.productFolder);
        if (response.statusCode == 200) {
          String url = response.data['url'];
          uploadedImageMap[product.thumbnail] = url;
          product.thumbnail = url;
        }

        // upload product images
        if (product.images != null && product.images!.isNotEmpty) {
          List<String> imageUrls = [];

          for (String image in product.images!) {
            // upload image to cloudinary
            File imageFile = await MyHelperFunction.assetToFile(image);
            dio.Response response = await _cloudinaryService.uploadImage(imageFile, MyKeys.productFolder);
            if (response.statusCode == 200) {
              imageUrls.add(response.data['url']);
            }
          }

          // upload product variation images
          if (product.productVariations != null && product.productVariations!.isNotEmpty) {
            for (int i = 0; i < product.images!.length; i++) {
              uploadedImageMap[product.images![i]] = imageUrls[i];
            }

            for (final variation in product.productVariations!) {
              final match = uploadedImageMap.entries.firstWhere(
                    (entry) => entry.key == variation.image,
                orElse: () => const MapEntry('', ''),
              );
              if (match.key.isNotEmpty) {
                variation.image = match.value;
              }
            }
          }

          product.images!.clear();
          product.images!.assignAll(imageUrls);
        }

        // upload product to Fire store
        await _db.collection(MyKeys.productCollection).doc(product.id).set(product.toJson());

        debugPrint('Product ${product.id} uploaded');
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

   // Function to fetch all list of product to firebase
   Future<List<ProductModel>> fetchAllProducts()async{
     try{
       final query = await _db.collection(MyKeys.productCollection).where("isFeatured",isEqualTo: true).get();
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

   // Function to fetch all list of product to firebase
   Future<List<ProductModel>> fetchProductsByQuery(Query query)async{
     try{
       final querySnapshot = await query.get();
       if(querySnapshot.docs.isNotEmpty){
         List<ProductModel> products = querySnapshot.docs.map((document) => ProductModel.fromQuerySnapshot(document)).toList();
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

   // function to fetch all list of brand specific products
   Future<List<ProductModel>> getProductsForBrands({required String brandId, int limit = -1}) async {
    try{
      final query = limit == -1 ?
      await _db.collection(MyKeys.productCollection).where("brand.id",isEqualTo: brandId).get()
      : await _db.collection(MyKeys.productCollection).where("brand.id",isEqualTo: brandId).limit(limit).get();

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

   // function to fetch all list of category specific products
   Future<List<ProductModel>> getProductsForCategory({required String categoryId, int limit = -1}) async {
     try{

       final productCategoryQuery = limit == -1 ?
       await _db.collection(MyKeys.productCategoryCollection).where("categoryId",isEqualTo: categoryId).get()
       : await _db.collection(MyKeys.productCategoryCollection).where("categoryId",isEqualTo: categoryId).limit(limit).get();
       List<String> productIds = productCategoryQuery.docs.map((doc) => doc["productId"] as String).toList();
       final productQuery = await _db.collection(MyKeys.productCollection).where(FieldPath.documentId, whereIn: productIds).get();
       List<ProductModel> products = productQuery.docs.map((doc) => ProductModel.fromSnapshot(doc)).toList();
       return products;

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

   // function to fetch  list of favourite products
   Future<List<ProductModel>> getFavouriteProducts(List<String> productIds) async {
     try{
       final query = await _db.collection(MyKeys.productCollection).where(FieldPath.documentId,whereIn: productIds).get();

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