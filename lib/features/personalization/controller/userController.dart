import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:online_shop/data/repository/user/UserRepository.dart';
import 'package:online_shop/features/authentication/models/user_modal.dart';
import 'package:online_shop/utile/popup/snackbarHelpers.dart';

class userController extends GetxController {
  static userController get instacnce => Get.find();


  final _userRepository = Get.put(UserRepository());

  Rx<UserModel> user = UserModel.empty().obs;
  RxBool profileLoading = false.obs;


  @override
  void onInit() {
    fetchUserRecord();
    super.onInit();
  }

  // save user record
  Future<void> saveUserRecord(UserCredential userCredential) async {
    try {
      final nameParts = UserModel.nameParts(userCredential.user!.displayName);
      final username = "${userCredential.user!.displayName}123";

      UserModel userModel = UserModel(id: userCredential.user!.uid,
          firstName: nameParts[0],
          lastName: nameParts.length > 1 ? nameParts.sublist(1).join(" ") : "",
          username: username,
          email: userCredential.user!.email ?? "",
          phoneNumber: userCredential.user!.phoneNumber ?? "",
          profilePicture: userCredential.user!.photoURL ?? ""
      );
     await _userRepository.saveUserRecord(userModel);
    } catch (e) {
      MySnackBarHelpers.warningSnackBar(title: "Data not saved",message: "Something went wrong while saving your infotmation");
    }
  }

  // fetch user record
  Future<void> fetchUserRecord() async {
    try {
      profileLoading.value = true;
      UserModel user = await _userRepository.FetchUserDetails();
      this.user(user);
    } catch (e) {
      user(UserModel.empty());
    }finally{
      profileLoading.value = false;
    }
  }
}