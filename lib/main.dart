import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:market/Package/Binding.dart';
import 'package:market/View/HomeScreens/MainHomeScreen.dart';
import 'package:market/View/auth/LoginPage.dart';
import 'package:market/View/Theem/ApplicationTheem.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:market/firebase_options.dart';
import 'package:shared_preferences/shared_preferences.dart';

SharedPreferences? prefs;
void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform
  );
  prefs = await SharedPreferences.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: binding(),
      theme: LightTheem,
      home:  prefs!.getBool("IsLogin") == false || prefs!.getBool("IsLogin").isNull ?
      LoginPage():
      Mainhomescreen(),
    );
  }
}
