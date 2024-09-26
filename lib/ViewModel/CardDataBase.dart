import 'package:get/get.dart';
import 'package:market/Service/Database/DataBase.dart';
import '../Model/CartProductModel.dart';

class CardDataBase extends GetxController{

bool loading = true;
double get total => _totalprice;
var dbHalper = CardDataBaseHelper.db;
double _totalprice =0.0;
CardDataBase(){
  getallprod();
}

List<CartProductsModel> _cardprod = [];

List<CartProductsModel> get cardprod => _cardprod;


void getallprod() async {
 loading = true;
 var  dbhelper = CardDataBaseHelper.db;

 _cardprod = await dbhelper.getallprod();
 gettotalprice();
 loading = false;
 update();
}

void addproduct(CartProductsModel cartproductsModel) async {
  await CardDataBaseHelper.db.initdb();
  for(int i = 0 ; i< _cardprod.length;i++){
    if(_cardprod[i].prodid == cartproductsModel.prodid){
      return;
    }
  }

  await dbHalper.insertdata(cartproductsModel);
  _cardprod.add(cartproductsModel);

  gettotalprice();
  update();
}


gettotalprice(){
  for(int i = 0 ; i< _cardprod.length ; i ++){
  _totalprice += double.parse(_cardprod[i].pRICE.toString()) * int.parse(_cardprod[i].qUINTITY.toString());
  print(total);
  }
  update();
}


increasedCountiti(int index) async {

    cardprod[index].qUINTITY = cardprod[index].qUINTITY!+1;
    _totalprice += double.parse(_cardprod[index].pRICE.toString());
    await dbHalper.Updateprod(_cardprod[index]);




  update();
}

decreasedCountiti(int index) async {

  if(cardprod[index].qUINTITY! > 1 ){
    cardprod[index].qUINTITY = cardprod[index].qUINTITY!-1;
    _totalprice -= double.parse(_cardprod[index].pRICE.toString());
    await dbHalper.Updateprod(_cardprod[index]);
    update();
  }
}
}