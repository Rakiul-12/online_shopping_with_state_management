import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:online_shop/data/service/cloudinaryService.dart';
import 'package:online_shop/features/shop/models/brandCategoryModel.dart';
import 'package:online_shop/features/shop/models/brandModel.dart';
import 'package:online_shop/utile/const/keys.dart';
import 'package:online_shop/utile/helpers/helper_functions.dart';
import 'package:dio/dio.dart'as dio;
import '../../../../utile/exceptions/firebase_auth_exceptions.dart';
import '../../../../utile/exceptions/firebase_exceptions.dart';
import '../../../../utile/exceptions/formate_exceptions.dart';
import '../../../../utile/exceptions/platform_exceptions.dart';

class brandRepository extends GetxController{
  brandRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;
  final _cloudinaryService = Get.put(cloudinaryServices());


  // Function to upload brand in cloudinary and firestore
  Future<void> uploadBrand(List<BrandModel> brands)async{
    try{
      for (final brand in brands){
        File brandImage = await MyHelperFunction.assetToFile(brand.image);
        dio.Response response = await _cloudinaryService.uploadImage(brandImage, MyKeys.brandFolder);
        if(response.statusCode == 200){
          brand.image = response.data["url"];
        }
        await _db.collection(MyKeys.brandCollection).doc(brand.id).set(brand.toJson());
        // print("Brand ${brand.name} upload successfully");
      }

    } on FirebaseAuthException catch(e){
      throw MyFirebaseAuthException(e.code).message;
    }on FirebaseException catch(e){
      throw MyFirebaseException(e.code).message;
    }on FormatException catch(_){
      throw MyFormatException();
    }on PlatformException catch(e){
      throw MyPlatformException(e.code).message;
    }catch(e){
      throw "Something went wrong.Please try again";
    }
  }

  // Function to fetch brand in cloudinary and firestore
  Future<List<BrandModel>>fetchBrand()async{
    try{
      final query = await _db.collection(MyKeys.brandCollection).get();
      if(query.docs.isNotEmpty){
        List<BrandModel> brands = query.docs.map((brand) => BrandModel.fromSnapshot(brand)).toList();
        return brands;
      }
      return [];
    } on FirebaseAuthException catch(e){
      throw MyFirebaseAuthException(e.code).message;
    }on FirebaseException catch(e){
      throw MyFirebaseException(e.code).message;
    }on FormatException catch(_){
      throw MyFormatException();
    }on PlatformException catch(e){
      throw MyPlatformException(e.code).message;
    }catch(e){
      throw "Something went wrong.Please try again";
    }
  }


  // Function to get categories specific brand
  Future<List<BrandModel>>fetchBrandForCategories(String categoryId)async{
    try{

      // Query to get all documents where categoryId matches the provided categoryId
      final brandCategoryQuery = await _db.collection(MyKeys.brandCategoryCollection).where("categoryId",isEqualTo: categoryId).get();

      // Convert document to model
      List<BrandCategoryModel> brandCategories = brandCategoryQuery.docs.map((doc) => BrandCategoryModel.fromSnapshot(doc)).toList();

      // extract brandIds from brandCategoryModel
      List<String> brandIds = brandCategories.map((brandCategory) => brandCategory.brandId).toList();

      // Query to get brands based on brandIds
      final brandQuery = await _db.collection(MyKeys.brandCollection).where(FieldPath.documentId,whereIn: brandIds).limit(2).get();

      // covert documents to model
      List<BrandModel> brands = brandQuery.docs.map((doc) => BrandModel.fromSnapshot(doc)).toList();

      return brands;
    } on FirebaseAuthException catch(e){
      throw MyFirebaseAuthException(e.code).message;
    }on FirebaseException catch(e){
      throw MyFirebaseException(e.code).message;
    }on FormatException catch(_){
      throw MyFormatException();
    }on PlatformException catch(e){
      throw MyPlatformException(e.code).message;
    }catch(e){
      throw "Something went wrong.Please try again";
    }
  }


}