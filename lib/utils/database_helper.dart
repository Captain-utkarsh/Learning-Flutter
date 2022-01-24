import 'dart:io';
import 'dart:async';
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


  DatabaseHelper._createInstance();

  DatabaseHelper(){
    if(_databaseHelper == null)
    {
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

  Future<Database> get database async => _database ??= await initializeDatabase();

  //   if(_database == null)
  //   {
  //     _database = await initializeDatabase()  ;
  //   }
  //   return _database;
  // }

  Future<Database> initializeDatabase() async {
    Directory directory =  await getApplicationDocumentsDirectory();
    String path = directory.path + 'list.db';

    var listDatabase = await openDatabase(path, version: 1,onCreate: _createDb);
    return listDatabase;
  }

  //created a fucntion for opening the database
  void _createDb(Database db,int newVersion) async
  {
    await db.execute('''
    CREATE TABLE $listTable(
      $listId INTEGER PRIMARY KEY AUTOINCREMENT,
      $listName TEXT,
      $listType TEXT,
      $totalItem INTEGER,
      $totalAmount INTEGER)''');
  }
  
  //created a function for fetch all objects from database
  Future<List<Map<String, dynamic>>> getDataMapList() async
  {
    Database db = await database;
    var result = await db.query(listTable,orderBy: '$listName ASC');
    return result;
  }

  Future<int> insertList(Lists list) async{
    Database db = await database;
    var result = await db.insert(listTable, list.toMap());
    return result; 
  } 
  Future<int> updateList(Lists list) async {
    var db = await database;
    var result = await db.update(listTable, list.toMap(),where: '$listId = ?');
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

  // Future<int> getCount() async
  // {
  //   Database db = await this.database;
  //   List<Map<String,dynamic>> x = await db.rawQuery('SELECT COUNT (*) from $listTable');
  //   int result = Sqflite.firstIntValue(x);
  //   return result;
  // }
  



  
}