import 'package:flutter/material.dart';

class Registration extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.orange,
        title: Text(
          'Registration Page',
          style: TextStyle(
            fontSize: 20.0,
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
        image: DecorationImage(
        image: AssetImage("images/image2.jpg"),
        fit: BoxFit.cover,
           )
           ),
          child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 10.0, right: 10.0, top: 20.0),
            child: TextField(
                decoration: InputDecoration(
                    hintText: "Username",
                    border: new OutlineInputBorder(
                        borderSide: new BorderSide(color: Colors.deepPurple)))),
          ),
          Container(
            margin: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
            child: TextField(
                decoration: InputDecoration(
                    hintText: "Email Id",
                    border: new OutlineInputBorder(
                        borderSide: new BorderSide(color: Colors.deepPurple)))),
          ),
          Container(
            margin: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
            child: TextField(
                decoration: InputDecoration(
                    hintText: "Phone No",
                    border: new OutlineInputBorder(
                        borderSide: new BorderSide(color: Colors.deepPurple)))),
          ),
          Container(
            margin: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
            child: TextField(
                decoration: InputDecoration(
                    hintText: "Set Password",
                    border: new OutlineInputBorder(
                        borderSide: new BorderSide(color: Colors.deepPurple)))),
          ),
          Container(
            height: 40.0,
            width: 90.0,
            margin: EdgeInsets.only(top: 20.0),
            child: RaisedButton(
              onPressed: () {
                alertDialog(context);
              },
              child: Text(
                "Submit",
                style: TextStyle(color: Colors.white, fontSize: 16.0),
              ),
              color: Colors.orange,
              elevation: 20.0,
            ),
          ),
        ],
      ),
      )
    );
  }

  void alertDialog(BuildContext context) {
    var alertDialog = AlertDialog(
      title: Text("Registration"),
      content: Text("Registration Successful..."),
    );

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alertDialog;
        });
  }
}
