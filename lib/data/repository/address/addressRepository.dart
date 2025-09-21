import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:online_shop/data/repository/authentication_repo.dart';
import 'package:online_shop/features/personalization/models/addressModel.dart';
import 'package:online_shop/utile/const/keys.dart';
import '../../../utile/exceptions/firebase_exceptions.dart';
import '../../../utile/exceptions/formate_exceptions.dart';
import '../../../utile/exceptions/platform_exceptions.dart';

class AddressRepository extends GetxController{
 static AddressRepository get instance => Get.find();

 final _db = FirebaseFirestore.instance;


  // function to store user address on firebase
 Future<String> addAddress( AddressModel address)async{
   try{

     final userId = AuthenticationRepository.instance.currentUser!.uid;

     final currentAddress = await _db.collection(MyKeys.userCollection).doc(userId).collection(MyKeys.addressCollection).add(address.toJson());

     return currentAddress.id;

   }on FirebaseException catch(e){
     throw MyFirebaseException(e.code).message;
   }on FormatException catch(_){
     throw MyFormatException();
   }on PlatformException catch(e){
     throw MyPlatformException(e.code).message;
   }catch(e){
     throw "Something went wrong while saving address information.Please try again";
   }
 }

 // function to get user address from firebase
 Future<List<AddressModel>> fetchUserAddresses() async{
   try{

     final userId = AuthenticationRepository.instance.currentUser!.uid;

     if(userId.isEmpty) throw 'User not found. Please login again';

     final query = await _db.collection(MyKeys.userCollection).doc(userId).collection(MyKeys.addressCollection).get();
     if(query.docs.isNotEmpty){
       List<AddressModel> addresses = query.docs.map((doc) => AddressModel.fromDocumentSnapshot(doc)).toList();
       return addresses;
     }

     return [];

   }on FirebaseException catch(e){
     throw MyFirebaseException(e.code).message;
   } on FormatException catch(_){
     throw MyFormatException();
   } on PlatformException catch(e){
     throw MyPlatformException(e.code).message;
   } catch(e){
     throw 'Unable to find addresses. Please try again';
   }
 }

 // function to update select address
 Future<void> updateSelectedAddresses(String addressId, bool selected) async{
   try{

     final userId = AuthenticationRepository.instance.currentUser!.uid;

     await _db.collection(MyKeys.userCollection).doc(userId).collection(MyKeys.addressCollection).doc(addressId).update({"selectedAddress": selected});


   } catch(e){
     throw 'Unable to update selected address. Please try again';
   }
 }
}