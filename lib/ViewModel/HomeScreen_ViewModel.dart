import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:market/View/Cart.dart';
import 'package:market/View/HomeScreens/HomeScreen.dart';
import 'package:market/View/UserProfile.dart';

class HomeScreen_ViewModel extends GetxController{

  int Currentindex = 0;
  Widget Screen = HomeScreen();

   SetCurrentIndex(int idx){
    print(idx);
    Currentindex = idx;
    switch(idx){
      case 0:{
        Screen = HomeScreen();
        break;
      }
      case 1:{
        Screen = CartScreen();
        break;
      }
      case 2:{
        Screen = Userprofile();
        break;
      }
    }
    update();
  }

}