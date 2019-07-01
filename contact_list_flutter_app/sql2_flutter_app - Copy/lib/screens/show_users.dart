import 'package:flutter/material.dart';
import 'package:sql2_flutter_app/models/user_model.dart';
import 'package:sql2_flutter_app/utils/database_helper.dart';

class ShowUser extends StatefulWidget{

  List<User> userList ;
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ShowUserState();
  }

}

class ShowUserState extends State<ShowUser> {

  List<User> userList;

  DatabaseHelper databaseHelper = new DatabaseHelper();

  void getData() async{
    List<User> localUserList = new List ();
    await databaseHelper.database ;
    localUserList = await databaseHelper.getUsersObjectList();
    setState(() {
      userList = localUserList;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Contacts"),

      ),
      body: ListView.builder(
          itemCount: userList == null ? 0 : userList.length,
          itemBuilder: (BuildContext context,int index){
            return(
                Dismissible(
                  key: new Key(userList[index].id.toString()),
                  onDismissed: (direction){
                    setState(() {
                      databaseHelper.deleteUser(userList[index].id);
                      userList.removeAt(index);
                    });
                  },
                  child: Container(
                    height: 80.0,
                    child: new Card(
                      elevation: 5.0,
                      child: Row(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(left:20.0),
                            child: CircleAvatar(
                              child: Text(userList[index].name[0]),
                            ),
                          ),
                          Column(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(top:10.0,left: 15.0),
                                child: Text(userList[index].name,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18.0
                                ),),
                              ),
                              Container(
                                margin: EdgeInsets.only(top:8.0,left: 15.0),
                                child: Text(userList[index].phone,
                                  style: TextStyle(
                                      color: Colors.green,
                                      fontSize: 14.0
                                  ),),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                )

            );
          }),
    );
  }

}