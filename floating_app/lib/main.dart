
import 'package:flutter/material.dart';

void  main() =>runApp(MyApp());
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Demoapp",
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.blueAccent,
          title: Text("Demoapp"),
        ),
        body:getListView(),
        floatingActionButton: FloatingActionButton(
          onPressed: null,
          child: Icon(Icons.add),
          tooltip: "Add more items",
        ),
      ),
    );
  }
}
void showSnackBar(BuildContext context,String item){
  var snackBar=SnackBar(
      content:Text("just tappped $item")
  );
  Scaffold.of(context).showSnackBar(snackBar);
}

List<String>getListElements(){
  var items =List<String>.generate(50,(counter) =>"Item $counter");
  return items;
}
Widget getListView() {
  var listitems = getListElements();

  var listView = ListView.builder(
      itemBuilder: (context, index) {
        return ListTile(
            title: Text(listitems[index]),
            onTap: (){
              showSnackBar(context,listitems[index]);
            }
        );
      }
  );
  return listView;
}
