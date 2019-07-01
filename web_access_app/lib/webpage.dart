import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class WebViewPage extends StatefulWidget {
  final String url;

  WebViewPage({this.url});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return  WebViewPageState(this.url);
  }
}
class WebViewPageState extends State<WebViewPage>{
  String url;
  WebViewPageState(this.url);
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    debugPrint("urL $url");

    final flutterWebviewPlugin=new FlutterWebviewPlugin();
    flutterWebviewPlugin.onUrlChanged.listen((String url){
      debugPrint("url= $url");
    },
    );
  }
  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      url: url,
      hidden: true,
      appBar: AppBar(
           backgroundColor: Colors.deepPurple,
          title: Text("Open Web Page URL in webview")
      ),
    );
  }
}

