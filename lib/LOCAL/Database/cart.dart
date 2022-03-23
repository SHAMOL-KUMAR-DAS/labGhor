import 'package:online_doctor_booking/LOCAL/Model/cart.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class CartDatabase{
  static final CartDatabase instance = CartDatabase._init();

  static Database? _database;
  CartDatabase._init();

  Future<Database> get database async{
    if(_database != null){
      return _database!;
    }
    _database = await _initDB('cart.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async{
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: collectionCreate);
  }

  ////////////////////////////////////////////////////
  //Collection

  //Create table
  Future collectionCreate(Database db, int version) async{
    await db.execute('''
    CREATE TABLE $tableNameCart(
    ${CartFields.id} INTEGER PRIMARY KEY AUTOINCREMENT,
    ${CartFields.product_id} INTEGER,
    ${CartFields.products} TEXT,
    ${CartFields.price} TEXT,
    ${CartFields.total} TEXT,
    ${CartFields.status} INTEGER NOT NULL
    )
    ''');
  }

  //Collection Create
  Future createCart(Cart cart) async{
    final db = await instance.database;

    final id = await db.insert(tableNameCart, cart.toJson());
    return cart.copy(id: id);
  }

  //View Collection
  Future<List<Cart>> ViewCart() async{
    final db = await instance.database;

    final result = await db.query(tableNameCart);
    return result.map((json) => Cart.fromJson(json)).toList();
  }

  //Delete Collection
  Future<int> delete(int id) async{
    final db = await instance.database;
    print('Delete.................................');
    return db.delete(tableNameCart, where: '${CartFields.id} = ?', whereArgs: [id]);
  }

  //Using
  Future close() async{
    final db = await instance.database;
    _database = null;
    db.close();
  }

}