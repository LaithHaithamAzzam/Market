import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:market/View/MyWidget/AppButton.dart';
import 'package:market/ViewModel/HomeFromFireStore.dart';

import '../../Model/CartProductModel.dart';
import '../../ViewModel/CardDataBase.dart';

class DetilScreen extends GetWidget<HomeFromFireStore> {
   DetilScreen({super.key,required this.index});
  int index;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(left: 15.0 , right: 15.0),
        height: 70,
        width: Get.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
              Text("PRICE"),
              Text("\$${controller.Products[index].price}",style: TextStyle(color: Get.theme.primaryColor),),
            ],),
            GetBuilder<CardDataBase>(
              init:CardDataBase() ,
              builder: (controllers) {
                return Appbutton(
                  Ontap: () async {
                    controllers.addproduct(
                        CartProductsModel(
                          nAME: controller.Products[index].title,
                          iMAGE: controller.Products[index].image,
                          pRICE: controller.Products[index].price,
                          qUINTITY: 1,
                           prodid: controller.Products[index].prodid
                        )
                    );
                  },
                  width: 180,
                  LabelText: "ADD",
                );
              }
            )
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(left: 5.0,right: 10.0),
              width: Get.width,
              height: 196,
              decoration: BoxDecoration(

                image: DecorationImage(
                    image: NetworkImage("${controller.Products[index].image}"),
                  fit: BoxFit.cover
                )
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back_ios_new)),
                  IconButton(onPressed: (){}, icon: Icon(Icons.star_border),style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(Colors.white)),),

                ],
              ),
            ),
           Padding(
               padding: const EdgeInsets.only(left: 10.0,top: 15.0),
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Text("${controller.Products[index].title}" , style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceAround,
                   children: [
                     Container(
                       margin: EdgeInsets.all(10.0),
                       padding:  EdgeInsets.all(10.0),
                       decoration: BoxDecoration(
                           border: Border.all(width: 0.5,color: Colors.black12),
                           boxShadow: [
                             BoxShadow(color: Colors.black12,offset: Offset(0, 0),spreadRadius: 0.6,blurRadius: 4)
                           ],
                           borderRadius: BorderRadius.circular(50),
                           color: Colors.white
                       ),
                       width: 150,
                       height: 45,
                       child: Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                           Text("Size"),
                           Text("${controller.Products[index].size}",style: TextStyle(fontWeight: FontWeight.bold),),
                         ],
                       ),
                     ),
                     Container(
                       margin: EdgeInsets.all(10.0),
                       padding:  EdgeInsets.all(10.0),
                       decoration: BoxDecoration(
                           border: Border.all(width: 0.5,color: Colors.black12),
                           boxShadow: [
                             BoxShadow(color: Colors.black12,offset: Offset(0, 0),spreadRadius: 0.6,blurRadius: 4)
                           ],
                           borderRadius: BorderRadius.circular(50),
                           color: Colors.white
                       ),
                       width: 150,
                       height: 45,
                       child: Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                           Text("Color"),
                           Icon(Icons.square_rounded,color: Color(int.parse(controller.Products[index].color.toString())),size: 22.0,)
                         ],
                       ),
                     ),

                   ],
                 ),
                 Padding(
                   padding: const EdgeInsets.only(top: 18.0 , bottom: 18.0),
                   child: Text("Details" , style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                 ),
                 Text("${controller.Products[index].details}" ,
                 ),

               ],
             ),
           )
          ],
        ),
      ),
    );
  }
}
