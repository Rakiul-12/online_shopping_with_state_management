import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:online_shop/my_app.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() {

  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(const MyApp());

}