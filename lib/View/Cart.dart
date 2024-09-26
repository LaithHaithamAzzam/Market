import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:market/View/MyWidget/AppButton.dart';

import '../ViewModel/CardDataBase.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: Container(
          margin: EdgeInsets.only(top: 5.0),
          padding: EdgeInsets.only(left: 15.0 , right: 15.0),
          height: 70,
          width: Get.width,
          child:  GetBuilder<CardDataBase>(
              builder: (controllers) {
              return controllers.cardprod.length > 0 ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text("PRICE"),
                      Text("\$${controllers.total}",style: TextStyle(color: Get.theme.primaryColor),)


                    ],),
                  Appbutton(
                    Ontap: (){

                    },
                    width: 180,
                    LabelText: "CHECKOUT",
                  )
                ],
              ):Text("");
            }
          ),
        ),
        body: GetBuilder<CardDataBase>(
          init: CardDataBase(),
          builder: (controller) {
            return controller.cardprod.length > 0 ? SafeArea(
            child: ListView.builder(itemBuilder: (context, index) {
              return Container(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.grey,
                      borderRadius: BorderRadius.circular(5),
                      image: DecorationImage(
                          image: NetworkImage("${controller.cardprod[index].iMAGE}"),
                          fit: BoxFit.cover
                      )
                    ),
                    margin: EdgeInsets.only(right: 18.0),
                    width: 120,
                    height: 120,

                  ),
                  Column(

                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("${controller.cardprod[index].nAME}"),
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0),
                        child: Text("\$${controller.cardprod[index].pRICE}",style: TextStyle(color: Get.theme.primaryColor),),
                      ),
                      GetBuilder<CardDataBase>(
                        builder: (controllers) {
                          return Container(
                            padding: EdgeInsets.only(left: 8.0,right: 8.0),
                            margin: EdgeInsets.only(top: 8.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Color(0xffF0F0F0)
                            ),
                            child: Row(
                              children: [
                                IconButton(onPressed: (){
                                  controllers.increasedCountiti(index);
                                }, icon: Icon(Icons.add)),
                                Text("${controllers.cardprod[index].qUINTITY}"),
                                IconButton(onPressed: (){
                                  controllers.decreasedCountiti(index);
                                }, icon: Icon(Icons.remove)),
                              ],
                            ),
                          );
                        }
                      )
                    ],
                  )
                  ],
                ),
              );
            },
            itemCount: controller.cardprod.length,
            )
                    ):Center(child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 60.0),
                          child: SvgPicture.asset("assets/images/nodata.svg" , width: Get.width /1.5,),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 18.0),
                          child: Text("No Item In Cart",style: TextStyle(fontSize: 16),),
                        )
                      ],
                    ));
          }
        ));
  }
}
