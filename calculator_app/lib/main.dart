import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Calculator app",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Calculator"),
        ),

        body: Calculator(),
        resizeToAvoidBottomPadding: false,
      ),
    );
  }
}

class Calculator extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return CalculatorState();
  }
}

class CalculatorState extends State<Calculator> {

  var _formkey = GlobalKey<FormState>() ;

  TextEditingController principalC = TextEditingController() ;
  TextEditingController roRC = TextEditingController() ;
  TextEditingController timeC = TextEditingController() ;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Form(
      key : _formkey ,
      child: Column(
        children: <Widget>[
          getAssestImage(),
          Container(
              margin: EdgeInsets.all(8.0),
              child: TextFormField(
                controller: principalC,
                validator: (value){
                  if(value.isEmpty) {
                    return "Please Enter Principal";
                  }
                },
                decoration: InputDecoration(
                    labelText: "Principal",
                    hintText: "Enter principal e.g 10,000",
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue))),
              )),
          Container(
              margin: EdgeInsets.all(8.0),
              child: TextFormField(
                controller: roRC,
                validator: (value){
                  if(value.isEmpty) {
                   return "Please Enter Rate";
                  }
                },
                decoration: InputDecoration(
                    labelText: "Rate of Interest",
                    hintText: "In Percent",
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue))),
              )),
          Row(
            children: <Widget>[
              Expanded(
                child: Container(
                    margin: EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: timeC,
                      validator: (value){
                        if(value.isEmpty){
                          return "Please Enter Time";
                        }
                      },
                      decoration: InputDecoration(
                          labelText: "Time",
                          hintText: "In Years",
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue))),
                    )),
              ),
            ],
          ),

            Container(
            height: 40.0,
            width: 110.0,
            child: RaisedButton(
              onPressed: () {
                if(_formkey.currentState.validate()) {
                  calculateSI(context);
                }
              },
              color: Colors.lightGreen,
              child: Text(
                    "Calculate",
                style: TextStyle(color: Colors.white,fontSize: 18.0),
              ),
            ),
          ),
          Container(
            height: 40.0,
            width: 100.0,
            margin: EdgeInsets.only(top: 5.0),
            child: RaisedButton(
                onPressed: (){
                  principalC.text = "";
                  roRC.text=" ";
                  timeC.text=" ";
                },
              color: Colors.red,
              child: Text(
                " Reset",
                style: TextStyle(color: Colors.white,fontSize: 18.0),
              ),

            ),
          )
        ],
      ),
    );
  }
  void calculateSI(BuildContext context) {
    double si = (double.parse(principalC.text)*double.parse(roRC.text)*double.parse(timeC.text))/100;

    var alertDialog = AlertDialog(
      title: Text("Simple Interest"),
      content: Text("SI => $si"),
    );
    showDialog(context: context,
    builder: (BuildContext context) {
      return alertDialog ;
    }) ;
  }
}

Widget getAssestImage() {
  AssetImage assetImage = AssetImage("images/img1.jpg");
  Image image = Image(
    image: assetImage,
  );

  return Container(
    width: 300.0,
    height: 120.0,
    child: image,
  );
}
