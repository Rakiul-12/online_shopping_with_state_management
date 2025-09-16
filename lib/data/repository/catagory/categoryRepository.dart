import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:online_shop/utile/const/keys.dart';
import 'package:online_shop/utile/helpers/helper_functions.dart';
import '../../../features/shop/models/catagoryModel.dart';
import '../../../utile/exceptions/firebase_exceptions.dart';
import '../../../utile/exceptions/formate_exceptions.dart';
import '../../../utile/exceptions/platform_exceptions.dart';
import '../../service/cloudinaryService.dart';
import 'package:dio/dio.dart'as dio;

class categoryRepository extends GetxController{
  static categoryRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;
  final _cloudinaryServices = Get.put(cloudinaryServices());

  // Function to upload list of category
  Future<void> uploadCategories (List<CategoryModel> categories) async {
    try {
      for (final category in categories ){
        File image = await MyHelperFunction.assetToFile(category.image);
         dio.Response response = await _cloudinaryServices.uploadImage(image, MyKeys.categoryFolder);
         if(response.statusCode == 200){
           category.image = response.data["url"];
         }

        await _db.collection(MyKeys.categoriesCollection).doc(category.id).set(category.toJson());

         print("Category Upload : ${category.name}");
      }

    } on FirebaseException catch (e) {
      throw MyFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw MyFormatException();
    } on PlatformException catch (e) {
      throw MyPlatformException(e.code).message;
    } catch (e) {
      throw "Something went wrong.Please try again";
    }
    
  }


  // Function to fetch list of categories
  Future<List<CategoryModel>> getAllCategories() async{
    try{

      final query = await _db.collection(MyKeys.categoriesCollection).get();

      if(query.docs.isNotEmpty){
        List<CategoryModel> categories = query.docs.map((document) => CategoryModel.fromSnapshot(document)).toList();
        return categories;
      }

      return [];

    }on FirebaseException catch(e){
      throw MyFirebaseException(e.code).message;
    } on FormatException catch(_){
      throw MyFormatException();
    } on PlatformException catch(e){
      throw MyPlatformException(e.code).message;
    } catch(e){
      throw 'Something went wrong. Please try again';
    }
  }

}