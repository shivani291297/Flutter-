import 'package:flutter/material.dart';

class User {
  int _id;

  String _name;
  String _phone;

  // Constructor...
  User(this._name, this._phone);
// constuctor with id
  User.withId(this._id, this._name, this._phone);

  // getters.....
int get id{
  return this._id;
}
String get name{
  return this._name;
}

String get phone{
  return this._phone;
}

// Setters.....
set id(int id ){
  this._id = id;
}
set name(String name) {
  this._name = name ;
}
set phone (String phone) {
  this._phone = phone ;
}

// extract user data from user'map (Named Constuctor )
User.fromMapObject(Map<String,dynamic> map) {
  this._id = map['id'];
  this._name = map['name'];
  this._phone = map['phone'];
}

// Extract map object from user'object
Map<String,dynamic>toMap() {
  Map<String,dynamic> map = new Map<String,dynamic>();
  map['id'] = this._id;
  map['name'] = this._name;
  map['phone'] =  this._phone;
  return map ;
}

}
