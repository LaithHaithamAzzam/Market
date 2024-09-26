import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Appbutton extends StatelessWidget {
   Appbutton({super.key,required this.LabelText,required this.width,required this.Ontap});
   String LabelText;
   double width;
   double hight = 60;
   Function Ontap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          top: 8.0 , bottom: 8.0),
      child: TextButton(
        onPressed: (){
          Ontap();
        },
        child: Text("$LabelText"),style: ButtonStyle(
        foregroundColor: WidgetStatePropertyAll(Colors.white),
        shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(4)))),
        backgroundColor: WidgetStatePropertyAll(Get.theme.primaryColor),
        minimumSize: WidgetStatePropertyAll(Size(width,hight)),
        maximumSize: WidgetStatePropertyAll(Size(width,hight)) ,
      ),),
    );
  }
}
