import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:market/View/HomeScreens/bottomNavBar.dart';
import 'package:market/ViewModel/HomeScreen_ViewModel.dart';


class Mainhomescreen extends StatelessWidget {
  const Mainhomescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: bottomNavBar(),
      body: GetBuilder<HomeScreen_ViewModel>(
        builder: (controller) {
          return controller.Screen;
        }
      ),
    ) ;
  }
}

