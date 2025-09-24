import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:online_shop/features/authentication/screens/onbolading/onBoading.dart';
import 'package:online_shop/utile/theme/themes.dart';

import 'bindings/bindings.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: Mytheme.lightTheme,
      darkTheme: Mytheme.darkTheme,
      initialBinding: MyBindings(),
      home: OnBoardingScreen(),
    );
  }
}