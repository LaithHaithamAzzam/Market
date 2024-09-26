import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:market/Model/UserModel.dart';

class Firestoreuser{
  final CollectionReference _collectionReference = FirebaseFirestore.instance.collection('Users');

  Future<void> addUserToFireStore(UserModel usermodel)async{
    return await _collectionReference
        .doc(usermodel.userid)
        .set(usermodel.toJson());
  }


}