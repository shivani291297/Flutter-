import 'package:flutter/material.dart';
import 'database_helper.dart';
import 'model.dart';
import 'show_friends_list.dart';

class HomePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {

  DatabaseHelper helper = DatabaseHelper() ;
  TextEditingController nameController=  new TextEditingController() ;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.orangeAccent,
        title: Text(
            "FriendsList",
                style:TextStyle(color: Colors.black),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/image1.jpg"),
              fit: BoxFit.cover,
            )
        ),

       child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 20.0,right:20.0,top:50.0
            ),
            child: TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: "Enter Name",
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.red,
                  )
                )
              ),
            ),
          ),
          Container(
            height: 50.0,
            width: 120.0,
            margin: EdgeInsets.only(left: 20.0,right:20.0,top:25.0
            ),
            child: RaisedButton(
              color: Colors.orangeAccent,
                elevation: 7.0,
                child: Text("Save",
                style: TextStyle(color:Colors.black,fontSize: 20.0),

                ),
                onPressed: (){
                _save(context);
            })
          ),
          Container(
              height: 50.0,
              width: 120.0,
              margin: EdgeInsets.only(left: 20.0,right:20.0,top:15.0
              ),
              child: RaisedButton(
                  color: Colors.orangeAccent,
                  elevation: 7.0,
                  child: Text("Show Data",
                    style: TextStyle(color:Colors.black,fontSize: 18.0),

                  ),
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return new ShowFriends();
                    }));
                    //_show(context);
                  })
          )
        ],
      ),
      )
    );
  }

  void _show(BuildContext context) async{
    List<Friend> friendList = await helper.getFriendObjectData();
    debugPrint("name ${friendList[0].getName}");
  }
  void _save(BuildContext context)async {
    String name = nameController.text ;
    await helper.initDatabase();
    if(!name.isEmpty) {
      Friend friend = new Friend(name);
     await helper.insertFriendData(friend);
     _showAlertDialog(context,"Inserted successfully!!!");
     nameController.clear();
    }
    else{
      _showAlertDialog(context,"Please Enter a Name");
    }
  }

  void _showAlertDialog(BuildContext context,String message) {
    var alertDialog = new AlertDialog(
      title: Text("Status"),
      content: Text(message),
    );
    showDialog(context: context,
    builder: (BuildContext context){
      return alertDialog ;
    }
    );
  }
}