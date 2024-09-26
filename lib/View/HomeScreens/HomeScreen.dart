import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:market/View/HomeScreens/DetilScreen.dart';
import 'package:market/ViewModel/HomeFromFireStore.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<HomeFromFireStore>(
        autoRemove: false,
        init: HomeFromFireStore(),
        builder: (controller) {
          return SafeArea(
            child: controller.loading == false ? SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Padding(
                     padding: const EdgeInsets.only(left: 10.0,right: 10.0,top: 10.0),
                     child: TextFormField(
                       style: TextStyle(
                         color: Colors.black
                       ),
                       decoration: InputDecoration(
                         filled: true,
                         fillColor: Color(0xffEFEFEF),
                         prefixIcon: Icon(Icons.search_rounded , color: Colors.black,),
                         focusedBorder:OutlineInputBorder(borderRadius: BorderRadius.circular(50),borderSide: BorderSide.none),
                         border: OutlineInputBorder(borderRadius: BorderRadius.circular(50),borderSide: BorderSide.none),
                         enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(50),borderSide: BorderSide.none),
                       ),
                     ),
                   ),
                   Padding(
                     padding: const EdgeInsets.only(left: 10.0 , top: 20.0),
                     child: Text("Categories",style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold),),
                   ),
                  GetBuilder<HomeFromFireStore>(
                    builder: (controller) {
                      return Container(
                        height: 120 ,
                        child: ListView.builder(itemBuilder: (context, index) {
                          return  Padding(
                              padding: const EdgeInsets.only(left: 10.0 , top: 18.0 , right: 5.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(bottom: 8),
                                    width: 65,
                                    height: 65,
                                    decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(color: Colors.black12,offset: Offset(0, 0),spreadRadius: 0.1,blurRadius: 7)
                                        ],
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(50)
                                    ),
                                    alignment: Alignment.center,
                                    child: SvgPicture.network("${controller.catgmodel[index].image}"),
                                  ),
                                  Text("${controller.catgmodel[index].title}",style: TextStyle(fontSize: 14.0),),
                                ],
                              )
                          );
                        },
                        shrinkWrap: true,
                          itemCount: controller.catgmodel.length,
                          scrollDirection: Axis.horizontal,
                        ),
                      );
                    }
                  ),

                 Padding(
                   padding: const EdgeInsets.only(left: 10.0 , right: 10.0 , top: 25.0),
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                     Text("Best Selling",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                     Text("See all",style: TextStyle(fontSize: 16 , color: Get.theme.primaryColor),),
                   ],),
                 ),
                   Container(
                     padding: EdgeInsets.only(top: 10.0),
                     width: Get.width,
                     height: 380,
                     child: ListView.builder(itemBuilder: (context, index) {
                       return  Padding(
                           padding: const EdgeInsets.only(left: 10.0 , top: 18.0 , right: 5.0),
                           child: GestureDetector(
                             onTap: (){
                               Get.to(DetilScreen(index: index,));
                             },
                             child: Column(
                               crossAxisAlignment: CrossAxisAlignment.start,
                               children: [
                                 Container(
                                   margin: EdgeInsets.only(bottom: 15),
                                   decoration: BoxDecoration(
                                       boxShadow: [
                                         BoxShadow(color: Colors.black12,offset: Offset(0, 0),spreadRadius: 0.1,blurRadius: 7)
                                       ],
                                       color: Colors.white,
                                       borderRadius: BorderRadius.circular(10)
                                   ),
                                   child:Image.network("${controller.Products[index].image}"),
                                 ),
                                 Text("${controller.Products[index].title}",style: TextStyle(fontSize: 14.0),),
                                 Padding(
                                   padding: const EdgeInsets.only(top: 8.0,bottom: 8.0),
                                   child: Text("${controller.Products[index].suptitle}",style: TextStyle(fontSize: 14.0,color: Colors.grey),),
                                 ),
                                 Text("\$${controller.Products[index].price}",style: TextStyle(fontSize: 14.0,color: Get.theme.primaryColor),),
                               ],
                             ),
                           )
                       );
                     },
                       shrinkWrap: true,
                       scrollDirection: Axis.horizontal,
                       itemCount: controller.Products.length,
                     ),
                   ),

                 ],
              ),
            ):Center(child: CircularProgressIndicator(color: Get.theme.primaryColor,strokeCap:StrokeCap.round ,strokeWidth:6 ,)),
          );
        }
      ),
    );
  }
}
