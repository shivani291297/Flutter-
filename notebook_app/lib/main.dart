import 'package:flutter/material.dart';
import 'package:notebook_app/screens/note_list.dart';
import 'package:notebook_app/screens/note_detail.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: "Notebook",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: NoteList();
    );
  }

}