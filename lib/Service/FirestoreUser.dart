import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:market/Model/UserModel.dart';

class FirestoreUser {
  final CollectionReference _collectionReference = FirebaseFirestore.instance.collection('Users');

  Future<void> addUserToFireStore(UserModel userModel) async {
    return await _collectionReference
        .doc(userModel.userid)
        .set(userModel.toJson());
  }


}