import 'package:market/ViewModel/authViewModel.dart';



List<String> iconlist = [
  "assets/images/Icons/editeprofile.svg",
  "assets/images/Icons/location.svg",
  "assets/images/Icons/orderhistoty.svg",
  "assets/images/Icons/card.svg",
  "assets/images/Icons/notification.svg",
  "assets/images/Icons/logout.svg",
];

List<String> TitleIcons = [
  "Edite Profile",
  "Location",
  "Order Histoty",
  "Card",
  "Notification",
  "Logout",
];
List<Function> onclick = [
      (){print("object1");},
      (){print("object2");},
      (){print("object3");},
      (){print("object4");},
      (){print("object5");},
      (){
    AuthViewModel().LogoutApplication();
  },
];

