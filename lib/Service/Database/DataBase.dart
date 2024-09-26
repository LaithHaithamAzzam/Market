import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

import '../../Model/CartProductModel.dart';

class CardDataBaseHelper{

  CardDataBaseHelper._();

  static final CardDataBaseHelper db =  CardDataBaseHelper._();

  static Database?  _database;

  Future<Database?> get database async{
    if(_database != null)
      {
        return _database!;
      }
    else{
       _database =await initdb();
       return _database;
    }

  }
  initdb() async {
    String path = join(await getDatabasesPath(), 'CartProducts.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int vrs) async {
        await db.execute('''  
      CREATE TABLE CARDPROD (  
      NAME TEXT NOT NULL,  
      IMAGE TEXT NOT NULL,  
      PRICE TEXT NOT NULL,  
      QUINTITY INT NOT NULL,
      prodid TEXT NOT NULL  
      )  
      ''');
      },
    );
  }

  insertdata(CartProductsModel model) async {
    var dbclint =await database ;
    try{
      await dbclint!.insert("CARDPROD", model.toJson(),conflictAlgorithm: ConflictAlgorithm.replace);
    }catch (e){

      await initdb();
      await dbclint!.insert("CARDPROD", model.toJson(),conflictAlgorithm: ConflictAlgorithm.replace);

    }

  }

  Updateprod(CartProductsModel model)async{
    var dbclint =await database ;
    await dbclint!.update("CARDPROD", model.toJson(),
        where:'prodid =?',
        whereArgs: [model.prodid]
    );
  }


  Reamove(CartProductsModel model)async{
    var dbclint =await database ;
    await dbclint!.delete("CARDPROD",
        where:'prodid =?',
        whereArgs: [model.prodid]
    );
  }

  Future<List<CartProductsModel>>  getallprod() async {
    var dbclint =await database ;
   List<Map> map = await dbclint!.query("CARDPROD");
   List<CartProductsModel> list = map.isNotEmpty?
       map.map((prod)=> CartProductsModel.fromJson(prod)).toList()
       :
       [];

   return list;
  }


  DeleteDatabase()async{
    String path = join(await getDatabasesPath(), 'CartProducts.db');
    await deleteDatabase(path);
  }
}