import 'package:flutter/material.dart';
import 'package:notebook_app/screens/note_detail.dart';


class NoteList extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return NoteState();
  }
}
class NoteState extends State<NoteList>{
  int count=0;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("NoteBook"),),
      body: getnotelist(),
      floatingActionButton: FloatingActionButton(
          onPressed:(){
            debugPrint('Clicked');
            navigateDetail('Add Note');
          },
        tooltip: 'Add Note',
        child: Icon(Icons.add),
      ),
    );
  }
      ListView getnotelist() {
        TextStyle tittleStyle = Theme.of(context).textTheme.subhead;

        return ListView.builder(
            itemCount: count,
            itemBuilder: (BuildContext context, int position) {
              return Card(
                color: Colors.white,
                elevation: 4.0,
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor:Colors.yellow,
                    child: Icon(Icons.keyboard_arrow_right)
                  ),
                  title: Text('Dummy Title',style: tittleStyle,),
                  subtitle: Text('Dummy Date'),
                  trailing: Icon(Icons.delete,color: Colors.grey,),
                  onTap: () {
                    debugPrint("Tapped");
                    navigateDetail('Edit Note');
                  }
                    ),
              );
            }
            );
      }
      void navigateDetail(String title){
        Navigator.push(context, MaterialPageRoute(builder: (context){
          return NoteDetail(title);
        }
        ));
      }
  }
