import 'dart:async';
import 'dart:io';
import 'package:notebook_app/models/note.dart';
//import 'package:path_provier/path_provider.dart';

class Helper{

  static Helper _helper;
  static Database _database;
  

  Helper._createinstance();
  factory Helper(){
    if(_helper==null) {
      _helper = Helper._createinstance();
    }
    return _helper;

  }
}