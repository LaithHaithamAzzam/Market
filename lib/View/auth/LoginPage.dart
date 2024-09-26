import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:market/View/MyWidget/AppButton.dart';
import 'package:market/View/MyWidget/AppTextFiled.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:market/View/auth/SignUpPage.dart';
import 'package:market/ViewModel/authViewModel.dart';
class LoginPage extends StatelessWidget {
  LoginPage({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(15),
                width: Get.width - 25 ,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                  boxShadow: [
                    BoxShadow(color: Colors.black26 , blurRadius: 8,offset: Offset(0, 5 ))
                  ]
                ),
                child: Column(
                   children: [
                     Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             Text("Welcome",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                             Text("Sign in to Continue")
                           ],
                         ),
                         GestureDetector(
                           onTap: (){
                             Get.to(SignUpPage());
                           },
                             child: Text("Sign Up",style: TextStyle(color: Get.theme.primaryColor),)
                         )
                       ],
                     ),
                     Padding(
                       padding: const EdgeInsets.only(top: 25.0,bottom: 25.0),
                       child: GetBuilder<AuthViewModel>(
                         autoRemove: false,
                         builder: (controller) {
                           return AppTextFiled(
                             LabelText: "Email",
                             Ispassword: false,
                             controller: controller.EmailController,
                           );
                         }
                       ),
                     ),
                     GetBuilder<AuthViewModel>(
                         builder: (controller) {
                         return AppTextFiled(
                           LabelText: "Password",
                           Ispassword: true,
                           controller: controller.PasswordController,
                         );
                       }
                     ),
                     Row(
                       mainAxisAlignment: MainAxisAlignment.end,
                       children: [
                         Padding(
                           padding: const EdgeInsets.only(top: 20.0,bottom: 12.0),
                           child: Text("Forgot Password?"),
                         ),
                       ],
                     ),
                     GetBuilder<AuthViewModel>(
                         builder: (controller) {
                         return Appbutton(LabelText: "SIGN IN",width: Get.width -50,Ontap: (){
                          if(controller.EmailController.text.isNotEmpty && controller.PasswordController.text.isNotEmpty){
                            controller.SigninWithEmailAndPassword();
                          }
                         },);
                       }
                     ),
                   ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 25.0,bottom: 20.0),
                child: Text("- OR -",style: TextStyle(fontSize: 18)),
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                width: Get.width - 50,
                height: 60,
                decoration: BoxDecoration(
                    border: Border.all(width: 1,color: Colors.black26),
                    borderRadius: BorderRadius.all(Radius.circular(4))
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: SvgPicture.asset("assets/images/facebook.svg"),
                    ),
                    Spacer(),
                    Text("Sign In with Facebook",style: TextStyle(fontSize: 16)),
                    Spacer()
                  ],
                ),
              ),
              GetBuilder<AuthViewModel>(
                  builder: (controller) {
                  return GestureDetector(
                    onTap: () {
                      controller.GooglesigninMethod();
                    },
                    child: Container(
                      margin: EdgeInsets.only(top: 10),
                      width: Get.width - 50,
                      height: 60,
                      decoration: BoxDecoration(
                          border: Border.all(width: 1,color: Colors.black26),
                          borderRadius: BorderRadius.all(Radius.circular(4))
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 15.0),
                            child: SvgPicture.asset("assets/images/google.svg"),
                          ),
                          Spacer(),
                          Text("Sign In with Google",style: TextStyle(fontSize: 16)),
                          Spacer()
                        ],
                      ),
                    ),
                  );
                }
              )
            ],
          ),
        ),
      ),
    );
  }
}
