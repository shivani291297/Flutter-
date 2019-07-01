import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'webpage.dart';
class WebApp extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return WebAppState();
  }
}
class WebAppState extends State<WebApp> {
  TextEditingController controller = new TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.text = "https://";
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        title: Text(
          'Open WebPage URL',
        ),
      ),
      body: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 25.0, left: 10.0),
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
//                  border: InputBorder.none,
                hintText: ('Enter URL'),
              ),
            ),
          ),
          Container(
              margin: EdgeInsets.only(top: 30.0),
              height: 40.0,
              width: 100.0,
              child: RaisedButton(
                  child: Text("Go"),
                  color: Colors.red,
                  onPressed: () {
                    debugPrint("click");
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) {
                          return WebViewPage(
                            url: controller.text,
                          );
                        }
                        )
                    );
                  }
              )
          )
        ],
      ),
    );
  }
}

