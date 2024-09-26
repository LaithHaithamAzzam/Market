import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:market/Model/UserModel.dart';
import 'package:market/Service/Database/DataBase.dart';
import 'package:market/Service/FirestoreUser.dart';
import 'package:market/View/HomeScreens/MainHomeScreen.dart';
import 'package:market/View/auth/LoginPage.dart';
import 'package:market/main.dart';
import 'package:shared_preferences/shared_preferences.dart';


class AuthViewModel extends GetxController{
  FirebaseAuth _auth = FirebaseAuth.instance;
  TextEditingController NameController = TextEditingController(text: "LaithAzzam");
  TextEditingController EmailController = TextEditingController(text: "laithhazzam@gmail.com");
  TextEditingController PasswordController = TextEditingController(text: "mmm100200mmm");


  @override
  void onInit() async {
    prefs = await SharedPreferences.getInstance();
    super.onInit();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }


  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }


  void GooglesigninMethod()async{
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
    AdduserDataBase(userCredential);

  }

   void SigninWithEmailAndPassword()async{
     try{
        await _auth.signInWithEmailAndPassword(
           email: EmailController.text,
           password: PasswordController.text
       ).then(
                (value){
                  SaveUser(email:value.user!.email ,name:value.user!.displayName ,photo:value.user!.photoURL);
                }
        );
       }catch (e){
       Get.snackbar("Error", e.toString() , colorText: Colors.white , backgroundColor: Colors.redAccent);
     }
   }

   void CreateAccount()async{
     try{
        await _auth.createUserWithEmailAndPassword(
           email: EmailController.text,
           password: PasswordController.text,
       ).then(
                (user) async {
                  await AdduserDataBase(user);
                  }
        );
       }catch (e){
       Get.snackbar("Error", e.toString() , colorText: Colors.white , backgroundColor: Colors.redAccent);
     }
   }

    AdduserDataBase(UserCredential user) async {
     UserModel usermodel = UserModel(
       userid: user.user!.uid,
       email: user.user!.email,
       name: user.user!.displayName,
       picid: user.user!.photoURL,
     );
     await Firestoreuser().addUserToFireStore(usermodel);
     SaveUser(email:user.user!.email ,name: user.user!.displayName ,photo:user.user!.photoURL);
   }


  void LogoutApplication(){
    GoogleSignIn().signOut();
    FirebaseAuth.instance.signOut();
    prefs!.clear();
    CardDataBaseHelper.db.DeleteDatabase();
    Get.offAll(LoginPage());

  }


  void SaveUser({email,name,photo}){
    print("${email}");
    print("${name}");
    print("${photo}");
    prefs!.setString("email", email);
    prefs!.setString("name",  "$name");
    prefs!.setString("photo", "$photo");
    prefs!.setBool("IsLogin", true);
    Get.offAll(Mainhomescreen());
  }

}