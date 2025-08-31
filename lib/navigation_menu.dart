import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:online_shop/features/shop/screens/home/home_screen.dart';
import 'package:online_shop/features/shop/screens/profile/profile_screen.dart';
import 'package:online_shop/features/shop/screens/shop/shop_screen.dart';
import 'package:online_shop/features/shop/screens/wishlist/wishlist_screen.dart';
import 'package:online_shop/utile/const/colors.dart';
import 'package:online_shop/utile/helpers/helper_functions.dart';

class navigationMenuScreen extends StatelessWidget {
  const navigationMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool dark = MyHeplerFunction.isDarkMode(context);
    final controller = Get.put(navigationController());
    return Scaffold(

      body: Obx(()=>controller.Screens[controller.selectedIndex.value]),
      bottomNavigationBar: Obx(
        ()=> NavigationBar(
          elevation: 0,
            selectedIndex: controller.selectedIndex.value,
            backgroundColor: dark ? Mycolors.dark: Mycolors.light,
            indicatorColor:dark ? Mycolors.light.withValues(alpha: .1): Mycolors.dark.withValues(alpha: .1),
            onDestinationSelected: (index){
            controller.selectedIndex.value = index;
            },
            destinations: [
              NavigationDestination(icon: Icon(Iconsax.home), label: "Home"),
              NavigationDestination(icon: Icon(Iconsax.shop), label: "Shop"),
              NavigationDestination(icon: Icon(Iconsax.heart), label: "Wishlist"),
              NavigationDestination(icon: Icon(Iconsax.user), label: "Profile"),
            ],
        ),
      ),
    );
  }
}
class navigationController extends GetxController{
  RxInt selectedIndex = 0.obs;
  List<Widget> Screens =[
    home_screen(),
    shop_screen(),
    wishlist_screen(),
    profile_screen()
  ] ;
}
