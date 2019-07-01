import 'package:flutter/material.dart';
import 'Login.dart';
void main()=> runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          centerTitle: true,
            backgroundColor: Colors.blueAccent,
            title: Text(
                "Login Page",
                    style: TextStyle(
                     fontSize: 20.0,
            ),
            )
        ),
        body: Login(),
      ),
    );
  }
}
