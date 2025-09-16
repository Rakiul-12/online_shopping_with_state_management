import 'dart:io';
import 'package:dio/dio.dart'as dio;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:online_shop/features/shop/models/banners_model.dart';
import 'package:online_shop/utile/const/keys.dart';
import 'package:online_shop/utile/helpers/helper_functions.dart';
import '../../../utile/exceptions/firebase_exceptions.dart';
import '../../../utile/exceptions/formate_exceptions.dart';
import '../../../utile/exceptions/platform_exceptions.dart';
import '../../service/cloudinaryService.dart';

class bannerRepository extends GetxController{

  static bannerRepository get instance=>Get.find();

  final _db = FirebaseFirestore.instance;
  final _cloudinaryServices = Get.put(cloudinaryServices());


  // upload banner on firebase and cloudinary
  Future<void> uploadBanners (List<BannerModel> banners)async{
    try{

      for(final banner in banners){
        File image = await MyHelperFunction.assetToFile(banner.imageUrl);
        dio.Response response= await _cloudinaryServices.uploadImage(image, MyKeys.bannerFolder);
        if(response.statusCode == 200){
          banner.imageUrl = response.data['url'];
        }
        await _db.collection(MyKeys.bannersCollection).doc().set(banner.toJson());
        print("Banner uploaded : ${banner.targetScreen}");
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



  // fetch active banner from firebase and cloudinary
  Future<List<BannerModel>> fetchBanners ()async{
    try{
      final query =await _db.collection(MyKeys.bannersCollection).where("active",isEqualTo: true).get();

      if(query.docs.isNotEmpty){
        List<BannerModel>banners = query.docs.map((document) => BannerModel.fromDocument(document)).toList();
        return banners;
      }
        return [];
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
}