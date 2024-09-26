import 'package:flutter/material.dart';
import 'package:market/View/MyWidget/AppButton.dart';
import 'package:market/View/MyWidget/AppTextFiled.dart';
import 'package:get/get.dart';
import 'package:market/ViewModel/authViewModel.dart';

class SignUpPage extends GetWidget<AuthViewModel> {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        leading:
        IconButton(onPressed: (){
          Get.back();
        }, icon: Icon(Icons.arrow_back_ios_new)),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(top: 40.0),
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Sign Up",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),

                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 25.0,bottom: 25.0),
                      child: AppTextFiled(
                        LabelText: "Name",
                        Ispassword: false,
                        controller: controller.NameController,

                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 0.0,bottom: 25.0),
                      child: AppTextFiled(
                        LabelText: "Email",
                        Ispassword: false,
                        controller: controller.EmailController,

                      ),
                    ),
                    AppTextFiled(
                      LabelText: "Password",
                      Ispassword: true,
                      controller: controller.PasswordController,

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
                    Appbutton(LabelText: "SIGN UP",width: Get.width -50,Ontap: (){
                      controller.CreateAccount();
                    },),
                  ],
                ),
              ),


            ],
          ),
        ),
      ),
    );
  }
}
