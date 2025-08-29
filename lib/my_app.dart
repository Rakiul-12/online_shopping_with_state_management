import 'package:flutter/material.dart';
import 'package:online_shop/features/authentication/screens/onbolading/onbolading.dart';
import 'package:online_shop/utile/theme/themes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: Mytheme.lightTheme,
      darkTheme: Mytheme.darkTheme,
      home: onBoadingScreen(),
    );
  }
}