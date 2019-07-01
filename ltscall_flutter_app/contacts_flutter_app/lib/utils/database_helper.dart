import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:contacts_flutter_app/models/user_model.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:async';
import 'dart:io';

class DatabaseHelper {

  static DatabaseHelper _databaseHelper ;
  static Database _database ;

  String colTableName = "UserTable";
  String colId = "id";
  String colName = "name";
  String colPhone = "phone";

  DatabaseHelper.createInstance();

  factory DatabaseHelper() {

    if(_databaseHelper == null ) {
      _databaseHelper = DatabaseHelper.createInstance();
    }
    return _databaseHelper;
  }

  // getter for the database.....
  Future<Database>get database async{
    if(_database == null){
      _database = await _databaseHelper.initDatabase();
    }
    return _database ;
  }

  Future<Database>initDatabase () async{
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + "user2.db" ;
    var database1 = openDatabase(path,version: 1,onCreate: _createDb);
    return database1;
  }
  // create Database.......
  _createDb(Database db,int newVersion) async {
    await db.execute('CREATE TABLE $colTableName($colId INTEGER PRIMARY KEY AUTOINCREMENT,$colName TEXT,$colPhone TEXT)');
  }
// fetch all user data from the database in form of map
  Future<List<Map<String,dynamic>>>getUserMapList() async{
    Database db = await this.database;
    var usersMap = await db.query(colTableName);
    return usersMap ;
  }

// insert user's data to the database .....
  Future<int>insertUser(User user) async{
    Database db = await this.database;
    var result =  await db.insert(colTableName, user.toMap());
    return result ;
  }

// delete user's data from database...
  Future<int>deleteUser(int id) async{
    Database db = await this.database;
    int result = await db.rawDelete('DELETE FROM $colTableName WHERE $colId = $id');
    return result;
  }

// convert user's map list to the user's object list .....
  Future<List<User>>getUsersObjectList() async{
    List<Map<String,dynamic>> usersMap = await getUserMapList();
    int len = usersMap.length ;
    List<User> userList = new List() ;

    for(int i = 0 ; i<len ; i++) {
      userList.add(User.fromMapObject(usersMap[i]));
    }
    return userList;
  }

}