import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Home extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomeState();
  }
}
class HomeState extends State<Home> {

  static const platform = const MethodChannel('MyNativeChannel');

  TextEditingController numcontroller = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        title: Text('Calling App'),
      ),
        body: Column(
          children: <Widget>[
            Container(
              margin:EdgeInsets.only(top: 20.0),
              child: _getimage(),
        ),
            Container(
              margin: EdgeInsets.only(top: 30.0, left: 10.0, right: 10.0),
              child: TextField(
                  controller: numcontroller,
                  decoration: InputDecoration(
                      labelText: 'Enter Phone Number',
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.deepPurple,
                          )
                      )
                  )
              ),
            ),
//            Container(
//              height: 45.0,
//              width: 90.0,
//              margin: EdgeInsets.only(top: 40, left: 10, right: 10.0),
//              child: RaisedButton(
//                  color: Colors.deepPurple,
//                  elevation: 7.0,
//                  child: Text(
//                    'Call',
//                    style: TextStyle(
//                      color: Colors.white,
//                      fontSize: 20.0,
//                    ),
//                  ),
//                  onPressed: () {
//                    _calling(context);
//                  }
//              ),
//            ),
             Container(
               margin: EdgeInsets.only(top:25.0),
                    child: FloatingActionButton(
                  onPressed: () {
                    _calling(context);
                  },
                  elevation: 20.0,
                  shape: CircleBorder(side: BorderSide(color: Colors.deepPurple)),
                  mini: false,
                  child: Icon(
                    Icons.call_end,
                    color: Colors.deepPurple,
                  ),
                  backgroundColor: Colors.white,
                )
          )

          ],
        ),
      ),
    );
  }

    Future<void> _calling(text) async {
      String message;
      String number=numcontroller.text;
      try {
        message = await platform.invokeMethod('getData', {"number": number});
      } on PlatformException catch (e) {
        message = "Failed to get data from native : '${e.message}'.";
      }
    }
  }
    Widget _getimage(){
    AssetImage assetImage=AssetImage('images/images.png');
    Image image = Image(
      image: assetImage,
    );

    return Container(
      width: 300.0,
      height: 120.0,
      child: image,
    );
    }
