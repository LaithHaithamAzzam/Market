import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppTextFiled extends StatelessWidget {
   AppTextFiled({super.key,required this.LabelText,required this.Ispassword,required this.controller});
  String LabelText;
  bool Ispassword;
   TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: Ispassword,
      decoration: InputDecoration(
        labelText: "$LabelText",
       labelStyle: TextStyle(color: Colors.grey),
        focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Get.theme.primaryColor))
      ),

    );
  }
}
