import 'dart:io';
import 'package:dio/dio.dart'as dio;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:online_shop/data/repository/user/UserRepository.dart';
import 'package:online_shop/features/authentication/models/user_modal.dart';
import 'package:online_shop/features/authentication/screens/login/login_screen.dart';
import 'package:online_shop/features/personalization/screen/editProfileScreen/widgets/reAuthenticationUserForm.dart';
import 'package:online_shop/utile/const/sizes.dart';
import 'package:online_shop/utile/helpers/NetworkManager.dart';
import 'package:online_shop/utile/popup/snackbarHelpers.dart';
import '../../../data/repository/authentication_repo.dart';
import '../../../utile/popup/fullScreenLoader.dart';

class userController extends GetxController {
  static userController get instance => Get.find();
  final _userRepository = Get.put(UserRepository());

  Rx<UserModel> user = UserModel.empty().obs;
  RxBool profileLoading = false.obs;

  RxBool isLoading = false.obs;


  // Re-authentication screen form variable
  final email = TextEditingController();
  final pass = TextEditingController();
  final reAuthFormKey = GlobalKey<FormState>();
  RxBool isShow = true.obs;

  @override
  void onInit() {
    fetchUserRecord();
    super.onInit();
  }

  // save user record
  Future<void> saveUserRecord(UserCredential userCredential) async {
    try {
      await fetchUserRecord();
      if(user.value.id.isEmpty){
        final nameParts = UserModel.nameParts(userCredential.user!.displayName);
        final username = "${userCredential.user!.displayName}123";

        UserModel userModel = UserModel(
          id: userCredential.user!.uid,
          firstName: nameParts[0],
          lastName: nameParts.length > 1 ? nameParts.sublist(1).join(" ") : "",
          username: username,
          email: userCredential.user!.email ?? "",
          phoneNumber: userCredential.user!.phoneNumber ?? "",
          profilePicture: userCredential.user!.photoURL ?? "",
        );
        await _userRepository.saveUserRecord(userModel);
      }

    } catch (e) {
      MySnackBarHelpers.warningSnackBar(
        title: "Data not saved",
        message: "Something went wrong while saving your infotmation",
      );
    }
  }

  // fetch user record
  Future<void> fetchUserRecord() async {
    try {
      profileLoading.value = true;
      UserModel user = await _userRepository.fetchUserDetails();
      this.user(user);
    } catch (e) {
      user(UserModel.empty());
    } finally {
      profileLoading.value = false;
    }
  }

  // Delete account warning popup
  Future<void> deleteAccountWarningPopup() async {
    Get.defaultDialog(
      contentPadding: EdgeInsets.all(Mysize.md),
      title: "Delete Account",
      middleText: "Are you sure you want to delete your account",
      cancel: OutlinedButton(onPressed: Get.back, child: Text('Cancel')),
      confirm: ElevatedButton(
        onPressed: () => deleteUser(),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red,
          side: BorderSide(color: Colors.red),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Mysize.lg),
          child: Text("Delete"),
        ),
      ),
    );
  }

  // Delete user if login with google and go to the reAuthenticate screen for authenticate email and pass
  Future<void> deleteUser()async {
    try{
      MyFullScreenLoader.openLoadingDialog("Processing...");

      final authRepository = authentication_repo.instance;
      final provider = authRepository.currentUser!.providerData.map((e) => e.providerId).first;

      // if user login with google
      if(provider == "google.com"){
        await authRepository.signInWithGoogle();
        authRepository.deleteAccount();
        MyFullScreenLoader.stopLoading();
        Get.offAll(()=>logInScreen());
      }
      // if user login with email and pass
      else  if(provider == "password"){
        Get.to(()=>reAuthenticationScreen());
      }
    }catch(e){
      MyFullScreenLoader.stopLoading();
      MySnackBarHelpers.errorSnackBar(title: "Failed to verify your account",message: e.toString());
    }
  }

  // Re-authenticate with email and password and delete user
  Future<void>reAuthenticateUser()async{
    try{
      MyFullScreenLoader.openLoadingDialog("Processing...");

      // internet connection checked
      bool isConnected = await NetworkManager.instance.isConnected();
      if(!isConnected){
        MyFullScreenLoader.stopLoading();
        return;
      }
        // Form validation
      if(!reAuthFormKey.currentState!.validate()){
        MyFullScreenLoader.stopLoading();
        return;
      }
      // delete account
        await authentication_repo.instance.reauthenticateUserWithEmailAndPassword(email.text.trim(), pass.text.trim());
        await authentication_repo.instance.deleteAccount();
        MyFullScreenLoader.stopLoading();
        Get.offAll(()=>logInScreen());
    }catch(e){
      MyFullScreenLoader.stopLoading();
      MySnackBarHelpers.errorSnackBar(title: "Error",message: e.toString());
    }
  }


  // Update user profile picture
  Future<void>updateUserProfilePicture()async{
    try{

      isLoading.value= true;
      // pick image form gallery
      XFile? image = await ImagePicker().pickImage(source: ImageSource.gallery,maxHeight: 512,maxWidth: 512);
      if(image == null)return;

      // convert XFile to file
      File file = File(image.path);

      // delete user current profile picture
      if(user.value.publicId.isNotEmpty){
        await _userRepository.deleteProfilePicture(user.value.publicId);
      }

      // upload picture to cloudinary
      dio.Response response = await _userRepository.updateProfilePicture(file);
      if (response.statusCode == 200){
        final data = response.data;
        final imageUrl = data["url"];
        final publicId = data["public_id"];

        // update profile picture from firestore
        _userRepository.updateSingleField({"profilePicture" : imageUrl,"publicId" : publicId});

        // update profile and public id form RxUser
        user.value.profilePicture = imageUrl;
        user.value.publicId = publicId;
        user.refresh();
        MySnackBarHelpers.successSnackBar(title: "Congratulation",message: 'Profile picture update successfully');
      }else{
        throw "Failed to upload profile picture.Please try again";
      }
    }catch(e){
      MyFullScreenLoader.stopLoading();
      MySnackBarHelpers.errorSnackBar(title: "Failed!",message: e.toString());
    }finally{
      isLoading.value= false;
    }
  }
}
