import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:online_shop/features/shop/models/promoCodeModel.dart';
import 'package:online_shop/utile/const/keys.dart';

import '../../../utile/exceptions/firebase_auth_exceptions.dart';
import '../../../utile/exceptions/firebase_exceptions.dart';
import '../../../utile/exceptions/formate_exceptions.dart';
import '../../../utile/exceptions/platform_exceptions.dart';

class PromoCodeRepository extends GetxController{
  static PromoCodeRepository get instance => Get.find();


  final _db = FirebaseFirestore.instance;



  // function to upload list of promo code to firestore
  Future<void> uploadPromoCodes(List<PromoCodeModel> promoCodes)async{
    try{
      for(final promoCode in promoCodes){
        await _db.collection(MyKeys.promoCodeCollection).doc(promoCode.id).set(promoCode.toJson());
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

  // function to fetch single promo code details
  Future<PromoCodeModel> fetchSinglePromoCodes(String code)async{
    try{
      final query =await _db.collection(MyKeys.promoCodeCollection).where("code",isEqualTo: code).get();
      if(query.docs.isNotEmpty){
        PromoCodeModel promoCode = PromoCodeModel.fromSnapshot(query.docs.first);
        return promoCode;
      }
      return PromoCodeModel.empty();

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

  // function to update single filed of promo code
  Future<void> updateSingleField(PromoCodeModel promoCode, String key, dynamic value)async{
    try{
      await _db.collection(MyKeys.promoCodeCollection).doc(promoCode.id).update({key : value});

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