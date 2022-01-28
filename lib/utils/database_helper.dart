import 'dart:io';
import 'dart:async';
import 'package:login_signup/models/items.dart';
import 'package:login_signup/models/list.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseHelper {
  static DatabaseHelper? _databaseHelper;
  static Database? _database;

  String listTable = 'list_table';
  String listId = 'id';
  String listName = 'list_name';
  String listType = 'list_type';
  String totalItem = 'total_item';
  String totalAmount = 'total_amount';
  //
  String itemTable = 'item_table';
  String itemId = 'id';
  String itemName = 'item_name';
  String quantity = 'item_quantity';
  String price = 'item_price';
  String description = 'item_description';
  String tListId = 'item_listid';

  DatabaseHelper._createInstance();

  DatabaseHelper() {
    if (_databaseHelper == null) {
      _databaseHelper ??= DatabaseHelper._createInstance();
    }
  }

  // factory DatabaseHelper(){

  //   if(_databaseHelper == null)
  //   {
  //     _databaseHelper ??= DatabaseHelper._createInstance();
  //   }
  //   return _databaseHelper;
  // }

  Future<Database> get database async =>
      _database ??= await initializeDatabase();

  //   if(_database == null)
  //   {
  //     _database = await initializeDatabase()  ;
  //   }
  //   return _database;
  // }

  Future<Database> initializeDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'list.db';

    var listDatabase =
        await openDatabase(path, version: 1, onCreate: createTables);
    return listDatabase;
  }

  void createTables(Database db, int version) {
    createListTable(db, version);
    createItemTable(db, version);
  }

  //created a fucntion for opening the database
  void createListTable(Database db, int version) async {
    await db.execute('''
    CREATE TABLE $listTable(
      $listId INTEGER PRIMARY KEY AUTOINCREMENT,
      $listName TEXT,
      $listType TEXT,
      $totalItem INTEGER,
      $totalAmount INTEGER)''');
  }

  void createItemTable(Database db, int version) {
    db.execute('''
      CREATE TABLE $itemTable (
        $itemId INTEGER PRIMARY KEY AUTOINCREMENT,
        $itemName TEXT NOT NULL,
        $quantity INTEGER NOT NULL,
        $price INTEGER NOT NULL,
        $description TEXT NOT NULL,
        $tListId INTEGER NOT NULL )
      ''');
  }

  //created a function for fetch all objects from database
  Future<List<Map<String, dynamic>>> getDataMapList() async {
    Database db = await database;
    var result = await db.query(listTable, orderBy: '$listName ASC');
    return result;
  }

  Future<int> insertList(Lists list) async {
    Database db = await database;
    return await db.insert(
      'list_table',
      {
        'list_name': list.listName,
        'list_type': list.listtype,
        'total_item': list.totalItem,
        'total_amount': list.totalAmount,
      },
    );
  }

  Future<int> updateList(Lists list) async {
    var db = await database;
    var result = await db.update(listTable, list.toMap(), where: '$listId = ?');
    return result;
  }

  Future<int> deleteList(int id) async {
    var db = await database;
    int result = await db.rawDelete('DELETE FROM $listTable WHERE $listId');
    return result;
  }

  Future<int> queryListCount() async {
    Database db = await database;
    return (await db.query(listTable)).length;
  }

  Future<List<Map<String, dynamic>>> queryAllLists() async {
    Database db = await database;
    return await db.query(listTable);
  }

  Future<int> updateListFields(Lists list) async {
    Database db = await database;
    return await db.rawUpdate('''
        UPDATE list_table SET 
        $totalItem = $totalItem + ?, 
        $totalAmount = $totalAmount + ? 
        WHERE id = ?''', [
      '${list.toMap()['total_item']}',
      '${list.toMap()['total_amount']}',
      '${list.toMap()['id']}'
    ]);
  }

  Future<List<Map<String, dynamic>>> getDataMapItem() async {
    Database db = await database;
    var result = await db.query(itemTable, orderBy: '$itemName ASC');
    return result;
  }

  Future<int> insertItem(Items item) async {
    Database db = await database;
    return await db.insert(
      'item_table',
      {
        'item_name': item.itemName,
        'item_quantity': item.quantity,
        'item_price': item.price,
        'item_description': item.description,
        'item_listId': item.tListId,
      },
    );
  }

  Future<int> updateItem(Items item) async {
    var db = await database;
    var result = await db.update(itemTable, item.toMap(), where: '$itemId = ?');
    return result;
  }

  Future<int> deleteItem(int id) async {
    var db = await database;
    int result = await db.rawDelete('DELETE FROM $itemTable WHERE $itemId');
    return result;
  }

  Future<int> queryItemCount() async {
    Database db = await database;
    return (await db.query(itemTable)).length;
  }

  Future<List<Map<String, dynamic>>> queryAllItems() async {
    Database db = await database;
    return await db.query(itemTable);
  }

  // Future<int> getCount() async
  // {
  //   Database db = await this.database;
  //   List<Map<String,dynamic>> x = await db.rawQuery('SELECT COUNT (*) from $listTable');
  //   int result = Sqflite.firstIntValue(x);
  //   return result;
  // }

}
