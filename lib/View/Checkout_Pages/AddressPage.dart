import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:market/View/MyWidget/AppTextFiled.dart';
import 'package:market/ViewModel/Checkout.dart';


class AddressPage extends StatelessWidget {
  const AddressPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController c1 = TextEditingController();
    return SingleChildScrollView(
      child: Column(
        children: [
         Padding(
           padding: const EdgeInsets.only(top: 28.0 ),
           child: Row(
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
               Text("Billing address is the same as delivery address",style: TextStyle(fontSize: 14),)
             ],
           ),
         ),
       Padding(
         padding: const EdgeInsets.only(left: 10.0 , right: 10.0),
         child: Column(
           children: [
             Padding(
               padding: const EdgeInsets.only(top: 28.0 , bottom: 28.0),
               child: AppTextFiled(
                 controller: c1,
                 LabelText: "Street 1",
                 Ispassword: false,
               ),
             ),
             AppTextFiled(
               controller: c1,
               LabelText: "Street 2",
               Ispassword: false,
             ),
             Padding(
               padding: const EdgeInsets.only(top: 28.0 , bottom: 28.0),
               child: AppTextFiled(
                 controller: c1,
                 LabelText: "City",
                 Ispassword: false,
               ),
             ),

           ],
         ),
       ),
          Padding(
            padding: const EdgeInsets.only(top: 28.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox.fromSize(
                  size: Size(Get.width/2.3, 60),
                  child: AppTextFiled(
                    controller: c1,
                    LabelText: "State",
                    Ispassword: false,
                  ),
                ),
                SizedBox.fromSize(
                  size: Size(Get.width/2.3, 60),
                  child: AppTextFiled(
                    controller: c1,
                    LabelText: "Country",
                    Ispassword: false,
                  ),
                ),
              ],
            ),
          )


        ],
      ),
    );
  }
}
