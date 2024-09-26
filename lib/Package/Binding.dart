import 'package:get/get.dart';
import 'package:market/ViewModel/CardDataBase.dart';
import 'package:market/ViewModel/HomeFromFireStore.dart';
import 'package:market/ViewModel/HomeScreen_ViewModel.dart';
import 'package:market/ViewModel/authViewModel.dart';

class binding extends Bindings{
  @override
  void dependencies() {
   Get.lazyPut( () => AuthViewModel(),fenix: true);
   Get.lazyPut( () => HomeScreen_ViewModel(),fenix: true);
   Get.lazyPut( () => HomeFromFireStore());
   Get.lazyPut( () => CardDataBase());
  }

}