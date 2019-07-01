import 'package:flutter/material.dart';
import 'package:calling_flutter_app/calling_page.dart';

void main()=>runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'Calling App',
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: CallPage(),
    );
  }
}
