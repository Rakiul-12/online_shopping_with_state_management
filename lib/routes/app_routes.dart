import 'package:get/get.dart';
import 'package:online_shop/features/authentication/screens/forgetPass/forgotPassword.dart';
import 'package:online_shop/features/authentication/screens/login/login_screen.dart';
import 'package:online_shop/features/authentication/screens/onbolading/onBoading.dart';
import 'package:online_shop/features/authentication/screens/signUp/signUpScreen.dart';
import 'package:online_shop/features/authentication/screens/signUp/verifyScreen/verifyScreen.dart';
import 'package:online_shop/features/personalization/screen/Address/UserAddress.dart';
import 'package:online_shop/features/personalization/screen/editProfileScreen/edit_profile.dart';
import 'package:online_shop/features/personalization/screen/profile/profile_screen.dart';
import 'package:online_shop/features/shop/screens/Cart/cart.dart';
import 'package:online_shop/features/shop/screens/checkpOut/CheckOut.dart';
import 'package:online_shop/features/shop/screens/shop/shop_screen.dart';
import 'package:online_shop/features/shop/screens/wishlist/wishlist_screen.dart';
import 'package:online_shop/navigation_menu.dart';
import 'package:online_shop/routes/routes.dart';

class MyAppRoutes{
  static final screens = [
    GetPage(name: MyRoutes.home, page: () => navigationMenuScreen(),),
    GetPage(name: MyRoutes.shop, page: () => shop_screen(),),
    GetPage(name: MyRoutes.wishlist, page: () => wishlist_screen(),),
    GetPage(name: MyRoutes.profile, page: () => profile_screen(),),
    GetPage(name: MyRoutes.checkout, page: () => checkOutScreen(),),
    GetPage(name: MyRoutes.cart, page: () => cartScreen(),),
    GetPage(name: MyRoutes.editProfile, page: () => edit_profile(),),
    GetPage(name: MyRoutes.userAddress, page: () =>UserAddress(),),
    GetPage(name: MyRoutes.signup, page: () => signUpScreen(),),
    GetPage(name: MyRoutes.verifyEmail, page: () => verifyScrreen(),),
    GetPage(name: MyRoutes.signIn, page: () => logInScreen(),),
    GetPage(name: MyRoutes.forgetPassword, page: () => forgotPass(),),
    GetPage(name: MyRoutes.onBoarding, page: () => onBoadingScreen(),),
  ];
}