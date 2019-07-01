import 'package:flutter/material.dart';
import 'package:registration_page/Reg.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/image.jpg"),
                fit: BoxFit.cover,
              )
          ),
          child: Column(
              children: <Widget>[
                Container(
          //Username
          margin: EdgeInsets.only(left: 10.0, right: 10.0, top: 40.0),
          child: TextField(
            style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                  hintText: "Username",
                  hintStyle: TextStyle(color: Colors.white,fontSize: 17.0),
                  border: new OutlineInputBorder(
                      borderSide: new BorderSide(color: Colors.white)))),
        ),
        Container(
          //password
          margin: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
          child: TextField(
            style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                  hintText: "Password",
                  hintStyle: TextStyle(color: Colors.white,fontSize: 17.0),
                  border: new OutlineInputBorder(
                      borderSide: new BorderSide(color: Colors.blue)))),
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
              "Login",
              style: TextStyle(color: Colors.white, fontSize: 16.0),
            ),
            color: Colors.blueAccent,
            elevation: 20.0,
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 90.0, left: 190.0),
          child: Text(
            'New User ?',
            style: TextStyle(
              fontSize: 17.0,
              color: Colors.white,
            ),
          ),
        ),
        Container(
          height: 40.0,
          width: 90.0,
          margin: EdgeInsets.only(top: 10.0,left: 190.0),
          child: RaisedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context){
                    return Registration();
              }
              ));
            },
            child: Text(
              "Sign Up",
              style: TextStyle(color: Colors.black, fontSize: 16.0),
            ),
            color: Colors.white,
            elevation: 20.0,
          ),
        ),
      ],
    )
    );
  }

  void alertDialog(BuildContext context) {
    var alertDialog = AlertDialog(
      title: Text("Login"),
      content: Text("Successfully Login..."),
    );

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alertDialog;
        });
  }
}
