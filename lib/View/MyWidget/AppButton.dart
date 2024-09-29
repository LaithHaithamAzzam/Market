import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Appbutton extends StatelessWidget {
   Appbutton({super.key,required this.LabelText,required this.width,required this.Ontap, this.bgcolor, this.sidecolor, this.fontColor});
   String LabelText;
   double width;
   double hight = 60;
   Function Ontap;
   Color? bgcolor;
   Color? sidecolor;
   Color? fontColor;
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
        foregroundColor: WidgetStatePropertyAll(fontColor ?? Colors.white),
        shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(4)),side: BorderSide(color: sidecolor ?? Colors.white))),
        backgroundColor: WidgetStatePropertyAll(bgcolor != null? bgcolor : Get.theme.primaryColor),
        minimumSize: WidgetStatePropertyAll(Size(width,hight)),
        maximumSize: WidgetStatePropertyAll(Size(width,hight)) ,
      ),),
    );
  }
}
