import 'package:flutter/material.dart';
import 'database_helper.dart';
import 'model.dart';

class ShowFriends extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ShowFriendsState();
  }

}

class ShowFriendsState extends State<ShowFriends>{

  DatabaseHelper helper = new DatabaseHelper() ;
  List<Friend> friendList = new List();

  void getData() async{
   List<Friend> localList  = await helper.getFriendObjectData();

   setState(() {
     friendList = localList;
   });
    debugPrint("hllo");
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      getData();
    });

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.orangeAccent,
        title: Text(
            "Friends",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: ListView.builder(
          itemCount: friendList == null ?0:friendList.length,
          itemBuilder: (BuildContext context,int index){
            return Container(
              child: Dismissible(
                  onDismissed: (direction){
                    setState(() {
                      removeData(friendList[index].getId);
                      friendList.removeAt(index);
                    });
                  },
                  key: Key(friendList[index].getName),
                  child: ListTile(
                    title: Text(friendList[index].getName),
                  ),
              ),
            );
          }
          ),
    );
  }

  void removeData(int id) async{
    await helper.removeFriendData(id);
  }

}