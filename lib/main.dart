import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:online_shop/data/repository/authentication_repo.dart';
import 'package:online_shop/firebase_options.dart';
import 'package:online_shop/my_app.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:online_shop/utile/const/keys.dart';

Future<void> main() async {

  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  await GetStorage.init();


  // initialize publishable key
  Stripe.publishableKey = MyKeys.stripePublishableKey;

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform).then((value){
    Get.put(AuthenticationRepository());
  });

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(const MyApp());

}