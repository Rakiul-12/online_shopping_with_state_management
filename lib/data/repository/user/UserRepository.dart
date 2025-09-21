import 'dart:convert';
import 'dart:io';
import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart'as dio;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:online_shop/data/repository/authentication_repo.dart';
import 'package:online_shop/features/authentication/models/user_modal.dart';
import 'package:online_shop/utile/const/apis.dart';
import 'package:online_shop/utile/const/keys.dart';
import '../../../utile/exceptions/firebase_auth_exceptions.dart';
import '../../../utile/exceptions/firebase_exceptions.dart';
import '../../../utile/exceptions/formate_exceptions.dart';
import '../../../utile/exceptions/platform_exceptions.dart';
import '../../service/cloudinaryService.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();
  final _coludnaryServcies = Get.put(cloudinaryServices());

  final _Db = FirebaseFirestore.instance;

  // Sent user details to Db
  Future<void> saveUserRecord(UserModel user) async {
    try {
      await _Db.collection(
        MyKeys.userCollection,
      ).doc(user.id).set(user.toJson());
    } on FirebaseAuthException catch (e) {
      throw MyFirebaseAuthException(e.code).message;
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

  // get user details to Db
  Future<UserModel> fetchUserDetails() async {
    try {
      final documentSnapshot = await _Db.collection(
        MyKeys.userCollection,
      ).doc(AuthenticationRepository.instance.currentUser!.uid).get();

      if (documentSnapshot.exists) {
        UserModel user = UserModel.fromSnapshot(documentSnapshot);
        return user;
      }
      return UserModel.empty();
    } on FirebaseAuthException catch (e) {
      throw MyFirebaseAuthException(e.code).message;
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

  // update user details in single filed to Db
  Future<void> updateSingleField(Map<String,dynamic>map) async {
    try {
      _Db.collection(MyKeys.userCollection).doc(AuthenticationRepository.instance.currentUser!.uid).update(map);
    } on FirebaseAuthException catch (e) {
      throw MyFirebaseAuthException(e.code).message;
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

  // delete user details from Db
  Future<void> removeUserRecord(String userId) async {
    try {
      await _Db.collection(MyKeys.userCollection).doc(userId).delete();
    } on FirebaseAuthException catch (e) {
      throw MyFirebaseAuthException(e.code).message;
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

  // update user profile picture form cloudinary
  Future<dio.Response> updateProfilePicture(File image) async {
    try {

      dio.Response response = await _coludnaryServcies.uploadImage(image, MyKeys.profileFolder);
      return response;

    } catch (e) {
      throw "Failed to upload profile picture. Please try again";
    }
  }

  // Delete profile picture form cloudinary
  Future<dio.Response> deleteProfilePicture(String publicId) async {
    try {

      dio.Response response = await _coludnaryServcies.deleteImage(publicId);
      return response;

    } catch (e) {
      throw "Something went wrong. Please try again";
    }
  }
}
