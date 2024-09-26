import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:market/ViewModel/HomeScreen_ViewModel.dart';

class bottomNavBar extends StatelessWidget {
  const bottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeScreen_ViewModel>(
      init: HomeScreen_ViewModel(),
      autoRemove: false,
      builder: (controller) {

      return BottomNavigationBar(
          currentIndex: controller.Currentindex,
          backgroundColor: Colors.white,
          showUnselectedLabels: false,
          showSelectedLabels: false,
          onTap: (value) {
            if (value != controller.Currentindex) {
              controller.SetCurrentIndex(value);
            }
          },
          items: [
            BottomNavigationBarItem(
                icon: SvgPicture.asset("assets/images/Icons/home.svg"),
                label: ".",
                activeIcon: Text(
                  "Explore",
                  style: TextStyle(color: Get.theme.primaryColor, fontSize: 16),
                )),
            BottomNavigationBarItem(
                icon: SvgPicture.asset("assets/images/Icons/cart.svg"),
                label: ".",
                activeIcon: Text("Cart",
                    style: TextStyle(
                        color: Get.theme.primaryColor, fontSize: 16))),
            BottomNavigationBarItem(
                icon: SvgPicture.asset("assets/images/Icons/profile.svg"),
                label: ".",
                activeIcon: Text("Profile",
                    style: TextStyle(
                        color: Get.theme.primaryColor, fontSize: 16))),
          ]);
    });
  }
}
