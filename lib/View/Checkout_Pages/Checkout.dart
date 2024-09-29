import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:market/View/Checkout_Pages/AddressPage.dart';
import 'package:market/View/Checkout_Pages/DeleveryPage.dart';
import 'package:market/View/Checkout_Pages/SummerPage.dart';
import 'package:market/View/MyWidget/AppButton.dart';
import 'package:market/ViewModel/Checkout.dart';

class Checkout extends StatelessWidget {
   Checkout({super.key});

  @override
  PageController pageController = PageController(initialPage: 0);
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(title: Text("Checkout"), centerTitle: true,),
      bottomNavigationBar: Container(

        width: Get.width,
        height: 80,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GetBuilder<Checkout_Controller>(
                builder: (controller) {
                  return controller.currentPage >= 1 ?
                  Appbutton(
                    Ontap: (){
                      if(controller.currentPage != 0 ){
                        pageController.animateToPage(controller.currentPage-1, duration: Duration(milliseconds: 250), curve: Curves.linear);
                        controller.ChangePage(controller.currentPage-1);
                      }
                    },
                    width: 140,
                    LabelText: "BACK",
                    bgcolor: Colors.white,
                    sidecolor:Get.theme.primaryColor,
                    fontColor:Get.theme.primaryColor ,
                  ):
                     Expanded(child: Text(""));
                }
            ),
            GetBuilder<Checkout_Controller>(
                builder: (controller) {
                  return Padding(
                    padding:  EdgeInsets.only(right: controller.currentPage == 0 ? 20.0 : 0.0 ),
                    child: Appbutton(
                      Ontap: (){
                        if(controller.currentPage < 2 ){
                          pageController.animateToPage(controller.currentPage+1, duration: Duration(milliseconds: 250), curve: Curves.linear);
                          controller.ChangePage(controller.currentPage+1);
                        }
                      },
                      width: 140,
                      LabelText: "NEXT",
                    ),
                  );
                }
            )
          ],
        ),
      ),
      body: GetBuilder<Checkout_Controller>(
        builder: (controller) {
          return Column(
            children: [
             Padding(
               padding: const EdgeInsets.only(left: 10.0 , right: 10.0, top: 15.0),
               child: Row(
                 children: [
                   Container(
                     alignment: Alignment.center,
                     width: 50,
                     height: 50,
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(50),
                       border: Border.all(color: Get.theme.primaryColor )
                     ),
                     child: Icon(Icons.circle , color: Get.theme.primaryColor,),
                   ),
                   Expanded(child: Divider(
                     color:  controller.currentPage > 0 ? Get.theme.primaryColor: Colors.grey ,
                   )),
                   Container(
                     alignment: Alignment.center,
                     width: 50,
                     height: 50,
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(50),
                       border: Border.all(color:  controller.currentPage >= 1 ? Get.theme.primaryColor: Colors.grey )
                     ),
                     child: Icon(Icons.circle , color:  controller.currentPage >= 1 ? Get.theme.primaryColor: Colors.grey ,),
                   ),
                   Expanded(child: Divider(
                     color: controller.currentPage >= 2 ? Get.theme.primaryColor: Colors.grey ,
                   )),
                   Container(
                     alignment: Alignment.center,
                     width: 50,
                     height: 50,
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(50),
                       border: Border.all(color: controller.currentPage >= 2 ? Get.theme.primaryColor: Colors.grey )
                     ),
                     child: Icon(Icons.circle , color: controller.currentPage >= 2 ? Get.theme.primaryColor: Colors.grey ,),
                   ),
                 ],
               ),
             ),
             Padding(
               padding: const EdgeInsets.only(left: 10.0 , right: 10.0, top: 10.0),
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   Text("Delivery",style: TextStyle(color: controller.currentPage >= 0 ? Colors.black: Colors.grey),),
                   Text("Address",style: TextStyle(color: controller.currentPage >= 1 ? Colors.black: Colors.grey),),
                   Text("Summer",style: TextStyle(color: controller.currentPage >= 2 ? Colors.black: Colors.grey ),),
                 ],
               ),
             ),
              Expanded(
                child: GetBuilder<Checkout_Controller>(
                  builder: (controller) {
                    return PageView(
                      controller: pageController ,
                      physics: NeverScrollableScrollPhysics(),
                      children: [
                        DeleveryPage(),
                        AddressPage(),
                        Summerpage(),
                      ],
                    );
                  }
                ),
              )
            ],
          );
        }
      ),
    );
  }
}
