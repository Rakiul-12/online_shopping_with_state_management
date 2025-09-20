import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:online_shop/data/repository/banner/banner_repository.dart';
import 'package:online_shop/data/repository/brand/brandRepository/brand_repository.dart';
import 'package:online_shop/data/repository/product/productRepository.dart';
import 'package:online_shop/data/repository/user/UserRepository.dart';
import 'package:online_shop/dummyData.dart';
import 'package:online_shop/features/authentication/screens/login/login_screen.dart';
import 'package:online_shop/features/authentication/screens/onbolading/onBoading.dart';
import 'package:online_shop/features/authentication/screens/signUp/verifyScreen/verifyScreen.dart';
import 'package:online_shop/features/personalization/controller/userController.dart';
import 'package:online_shop/navigation_menu.dart';
import 'package:online_shop/utile/exceptions/firebase_auth_exceptions.dart';
import 'package:online_shop/utile/exceptions/firebase_exceptions.dart';
import 'package:online_shop/utile/exceptions/formate_exceptions.dart';
import 'package:online_shop/utile/exceptions/platform_exceptions.dart';

import 'catagory/categoryRepository.dart';


class authentication_repo extends GetxController {
  static authentication_repo get instance => Get.find();

  final Localstorage = GetStorage();
  final _auth = FirebaseAuth.instance;

  User? get currentUser =>_auth.currentUser;

  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
    // Get.put(categoryRepository()).uploadBrandCategories(MyDummyData.brandCategory);
    // Get.put(categoryRepository()).uploadProductCategories(MyDummyData.productCategory);
  }

  // function to redirect to the right screen
  void screenRedirect() {
    final user = _auth.currentUser;
    if(user != null){
      // if user is verify
      if(user.emailVerified){
        Get.offAll(()=>navigationMenuScreen());
      }
      // if user is not verify
      else{
        Get.offAll(()=>verifyScrreen(email: user.email,));
      }
    }else{
      // write isFirstTime if Null
      Localstorage.writeIfNull("isFirstTime", true);

      // check if user is first time
      Localstorage.read("isFirstTime") != true
          ? Get.to(() => logInScreen())
          : Get.to(() => onBoadingScreen());
    }

  }

  // Authentication --signUp with email and pass and other information
  Future<UserCredential> registerUser(String email, String pass) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: pass);
      return userCredential;
    }on FirebaseAuthException catch(e){
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


  // Authentication --logIn with email and pass
  Future<UserCredential> loginWithEmailAndPass(String email, String pass) async {
    try {
      UserCredential userCredential = await _auth
          .signInWithEmailAndPassword(email: email, password: pass);
      return userCredential;
    }on FirebaseAuthException catch(e){
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


  // Authentication --Sign in with google
  Future<UserCredential> signInWithGoogle() async {
    try {

      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

      final AuthCredential authCredential = GoogleAuthProvider.credential(
        idToken: googleAuth?.idToken,
        accessToken: googleAuth?.accessToken
      );
      UserCredential userCredential = await _auth.signInWithCredential(authCredential);
      return userCredential;

    }on FirebaseAuthException catch(e){
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


  // Email verification -sent email
  Future<void> sendEmailToVerification() async {
    try{
      await _auth.currentUser?.sendEmailVerification();
    }on FirebaseAuthException catch(e){
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


  // Logout User
  Future<void> logoutUser() async {
    try{
      await FirebaseAuth.instance.signOut();
      await GoogleSignIn().signOut();
      Get.offAll(() => logInScreen());
    }on FirebaseAuthException catch(e){
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


  // Sent email to reset password
  Future<void> sendEmailToRestPassword(String email) async {
    try{
      await _auth.sendPasswordResetEmail(email: email);
    }on FirebaseAuthException catch(e){
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


  // Delete user account
  Future<void> deleteAccount() async {
    try{
     await UserRepository.instance.removeUserRecord(currentUser!.uid);


     // Remove profile Picture from cloudinary
     String publicId = userController.instance.user.value.publicId;
     if(publicId.isNotEmpty){
       UserRepository.instance.deleteProfilePicture(publicId);
     }
     await _auth.currentUser?.delete();

    }on FirebaseAuthException catch(e){
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


  // Re-Authenticate User With Email and Password
  Future<void> reauthenticateUserWithEmailAndPassword(String email , String password) async {
    try{
      AuthCredential credential = EmailAuthProvider.credential(email: email, password: password);
      await currentUser!.reauthenticateWithCredential(credential);
    }on FirebaseAuthException catch(e){
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
