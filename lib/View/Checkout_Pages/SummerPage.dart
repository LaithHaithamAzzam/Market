import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:market/ViewModel/CardDataBase.dart';
import 'package:market/ViewModel/Checkout.dart';


class Summerpage extends StatelessWidget {
  const Summerpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        GetBuilder<CardDataBase>(
          builder: (controller) {
            return Padding(
              padding: EdgeInsets.only(top: 25.0),
              child: Container(
                width: Get.width,
                height: 230,
                child: ListView.builder(itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
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

                          width: 130,
                          height: 130,

                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                                width: 135,
                                child: Text("${controller.cardprod[index].nAME}")),
                            Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child: Text("\$${controller.cardprod[index].pRICE}",style: TextStyle(color: Get.theme.primaryColor),),
                            ),
                          ],
                        )
                      ],
                    ),
                  );
                },
                  itemCount: controller.cardprod.length,
                  scrollDirection: Axis.horizontal,
                ),
              ),
            );
          }
        ),
        Divider(),
        Padding(
          padding: const EdgeInsets.only(left: 12.0,top: 15.0),
          child: Text("Shipping Address",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 28.0 ),
          child: Row(
            textDirection: TextDirection.rtl,
            children: [
              Transform.scale(
                scale: 1.2,
                child:  GetBuilder<Checkout_Controller>(
                    builder: (controller) {
                      return Checkbox(
                        activeColor: Get.theme.primaryColor,
                        focusColor: Colors.green,
                        shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),side: BorderSide(color: Get.theme.primaryColor)),
                        value: controller.cheeckBilling,
                        onChanged: (bool? value) {
                          controller.ChangeBilling(value!);
                        },
                      );
                    }
                ),
              ),
              SizedBox(
                  width: Get.width - 60,
                  child: Text("21, Alex Davidson Avenue, Opposite Omegatron, Vicent Smith Quarters, Victoria Island, Lagos, Nigeria",style: TextStyle(fontSize: 14),))
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 12.0),
          child: Text("Change",style: TextStyle(color: Get.theme.primaryColor),),
        ),
      ],
    );
  }
}
