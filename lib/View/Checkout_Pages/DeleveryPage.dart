import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:market/ViewModel/Checkout.dart';


class DeleveryPage extends StatelessWidget {
  const DeleveryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 25.0,left: 10.0 , right: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Standard Delivery",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                  Container(
                      width: Get.width - 80,
                      child: Text("Order will be delivered between 3 - 5 business days")),
                ],
              ),
              GetBuilder<Checkout_Controller>(
                builder: (controller) {
                  return Radio(
                    fillColor:  WidgetStatePropertyAll(Get.theme.primaryColor),
                    value: 1,
                    groupValue: controller.deliveryRadioValue,
                    onChanged: (value) {
                      controller.ChangeDeliveryRadioValue(int.parse(value.toString()));
                    },


                  );
                }
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 25.0,left: 10.0 , right: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Next Day Delivery",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                  Container(
                      width: Get.width - 80,
                      child: Text("Place your order before 6pm and your items will be delivered the next day")),
                ],
              ),
              GetBuilder<Checkout_Controller>(
                  builder: (controller) {
                  return Radio(
                    fillColor:  WidgetStatePropertyAll(Get.theme.primaryColor),
                    value:2,
                    groupValue: controller.deliveryRadioValue,
                    onChanged: (value) {
                      controller.ChangeDeliveryRadioValue(int.parse(value.toString()));
                    },

                  );
                }
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 25.0,left: 10.0 , right: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Nominated Delivery",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                  Container(
                      width: Get.width - 80,
                      child: Text("Pick a particular date from the calendar and order will be delivered on selected date")),
                ],
              ),
              GetBuilder<Checkout_Controller>(
                  builder: (controller) {
                  return Radio(
                    fillColor:  WidgetStatePropertyAll(Get.theme.primaryColor),
                    value: 3,
                    groupValue: controller.deliveryRadioValue,
                    onChanged: (value) {
                      controller.ChangeDeliveryRadioValue(int.parse(value.toString()));
                    },

                  );
                }
              ),
            ],
          ),
        ),
      ],
    );
  }
}
