import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:async';
import 'dart:io';
import 'model.dart';

class DatabaseHelper {

 static DatabaseHelper _databaseHelper ;
 DatabaseHelper.getInstance();
 static Database _database ;

 //Database table details...
 String colTableName = "friendsTable";
 String colId = "id";
 String colName = "name" ;




 factory DatabaseHelper(){

   if(_databaseHelper == null) {
     _databaseHelper = DatabaseHelper.getInstance() ;
   }
   return _databaseHelper;
 }

 Future<Database> get database async{


   if(_database == null){
     _database = await _databaseHelper.initDatabase();
   }

   return _database;
 }

  Future<Database> initDatabase() async{
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + "friends.db";
    Database local_database = await openDatabase(path,version: 1,onCreate: _createDb);

    return local_database;

  }

  void _createDb(Database db, int newVersion) async {
   await db.execute('CREATE TABLE $colTableName($colId INTEGER PRIMARY KEY AUTOINCREMENT,$colName TEXT)');
  }

  // insert friend's data into the table of db
Future<int> insertFriendData(Friend friend) async {
   Database db = await this.database;
   var result =  await db.insert(colTableName, friend.convertToMap());
   return result ;
}

Future<List<Map<String,dynamic>>>getFriendListMapData() async{
   Database db = await this.database ;
   var result = await db.query(colTableName);
   return result ;
}

Future<List<Friend>>getFriendObjectData() async {
   List<Map<String,dynamic>> friendMapList = await getFriendListMapData() ;
   List<Friend> friendList = new List() ;
   int len = friendMapList.length ;
   for(int i = 0 ; i<len ; i++) {
     friendList.add(Friend.toObject(friendMapList[i]));
   }

   return friendList ;

}

Future<int> removeFriendData(int id) async{
   Database db = await this.database;
     var result = await db.rawDelete('DELETE FROM $colTableName WHERE $colId = $id');
     return result ;
}


}