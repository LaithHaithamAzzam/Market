import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:market/Model/Categories_Model.dart';
import 'package:market/Model/ProductsModel.dart';

class HomeFromFireStore extends GetxController {
  bool loading = true;
  final CollectionReference cat =
      FirebaseFirestore.instance.collection("Catigories");
  List<Categories_Model> _catgmodel = [];
  List<Categories_Model> get catgmodel => _catgmodel;

  final CollectionReference prod =
      FirebaseFirestore.instance.collection("Products");
  List<ProductsModel> _Prod = [];
  List<ProductsModel> get Products => _Prod;

  HomeFromFireStore() {
    getcat();
    GetBestProductdata();
  }

  void getcat() async {
    loading = true;
    await cat.get().then((value) {
      for (var i = 0; i < value.docs.length; i++) {
        var data = value.docs[i].data();
        if (data is Map<dynamic, dynamic>) {
          _catgmodel.add(Categories_Model.fromJson(data));
        } else {
          print('Unexpected data format for document at index $i: $data');
        }
      }
    });

    update();
  }

  void GetBestProductdata() async {
    await prod.get().then((value) {
      for (int i = 0; i < value.docs.length; i++) {
        var data = value.docs[i].data();
        if (data is Map<dynamic, dynamic>) {
          _Prod.add(ProductsModel.fromJson(data));
        } else {
          print('Unexpected data format for document at index $i: $data');
        }
      }
      loading = false;
    });
    update();
  }
}
