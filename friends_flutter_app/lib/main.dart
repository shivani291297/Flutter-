import 'package:flutter/material.dart';
import 'package:friends_flutter_app/friends_list.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "FriendsList App",
      home: HomePage(),
    );
  }

}