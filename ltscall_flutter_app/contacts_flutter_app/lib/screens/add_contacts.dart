import 'package:flutter/material.dart';
import 'dart:async';
import 'package:contacts_flutter_app/models/user_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:contacts_flutter_app/utils/database_helper.dart';
import 'show_users.dart';

class AddContacts extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return AddContactsState();
  }
}

class AddContactsState extends State<AddContacts> {

  TextEditingController _nameController = new TextEditingController() ;
  TextEditingController _phoneController = new TextEditingController() ;
  DatabaseHelper databaseHelper = new DatabaseHelper() ;

  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Center(
          child: Text("Add Contacts"),
        ),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: 20.0,right: 20.0,top: 50.0),
              child: TextField(
                controller: _nameController,
                decoration: InputDecoration(
                    labelText: "Enter Name",
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.deepPurple
                        )
                    )
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20.0,right: 20.0,top: 6.0),
              child: TextField(
                controller: _phoneController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: "Enter Phone Number",
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.deepPurple
                        )
                    )
                ),
              ),
            ),
            Container(
                height: 50.0,
                width: 180.0,
                margin: EdgeInsets.only(left: 20.0,right: 20.0,top: 40.0),
                child: RaisedButton(
                  color: Colors.deepPurple,
                  child: Text("Save Contact",
                    style: TextStyle(color: Colors.white,fontSize: 18.0),),
                  onPressed: (){
                    _save();
                  },
                )
            ),
            Container(
                height: 50.0,
                width: 180.0,
                margin: EdgeInsets.only(left: 20.0,right: 20.0,top: 10.0),
                child: RaisedButton(
                    color: Colors.deepPurple,
                    child: Text("Show Contacts",
                      style: TextStyle(color: Colors.white,fontSize: 18.0),),
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return ShowUser() ;
                      }));
                    })
            )
          ],
        ),
      ),
    );
  }
  void _save()async{
    String name = _nameController.text.trim() ;
    String phone = _phoneController.text.trim();

    if(phone.isEmpty ||name.isEmpty||phone ==''||name==''||phone==null||name==null){
      _showAlertDialog("Please Enter valid Data");
    }
    else {
      User user = new User(_nameController.text, _phoneController.text);
      await databaseHelper.database;
      var result = await databaseHelper.insertUser(user);
      if (result != 0) {
        _showAlertDialog("Data Saved Successfully");
      }
      else {

      }

    }

    _phoneController.clear();
    _nameController.clear();

  }

  void _showAlertDialog(String message){
    var alertDialog = new AlertDialog(
      title: Text("Status"),
      content: Text(message),
    );
    showDialog(context:context,
        builder: (BuildContext context){
          return alertDialog ;
        });

  }

}