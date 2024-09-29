import 'package:get/get.dart';

class Checkout_Controller extends GetxController{

  int currentPage = 0 ;
  int deliveryRadioValue = 0;
  bool cheeckBilling = false;

  ChangeDeliveryRadioValue(int value){
    deliveryRadioValue = value;
    print(value);
    update();
  }

  ChangePage(int page){
    currentPage = page;
    update();
  }


  ChangeBilling(bool value){
    cheeckBilling = value;
    update();
  }

}