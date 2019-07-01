import 'package:flutter/material.dart';

class NoteDetail extends StatefulWidget{
  String appBarTitle;
  NoteDetail(this.appBarTitle);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return NoteDetailState(this.appBarTitle);
  }
}
class NoteDetailState extends State<NoteDetail>{
  var _prop=['High','Low'];
  String appBarTitle;
  TextEditingController titlecontroller=TextEditingController();
  TextEditingController descriptioncontroller=TextEditingController();
  NoteDetailState(this.appBarTitle);
  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.title;
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(title: Text(appBarTitle),
        ),
        body: Padding(
          padding: EdgeInsets.only(top: 15.0, right: 10.0, left: 10.0),
          child: ListView(
            children: <Widget>[
              ListTile(
                title: DropdownButton(
                    items: _prop.map((String dropDownStringItem) {
                      return DropdownMenuItem<String>(
                        value: dropDownStringItem,
                        child: Text(dropDownStringItem),
                      );
                    }).toList(),
                    style: textStyle,
                    value: 'Low',
                    onChanged: (valueSelectByUser) {
                      setState(() {
                        debugPrint('User selected $valueSelectByUser');
                      });
                    }
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                  child: TextField(
                    controller: titlecontroller,
                    style: textStyle,
                    onChanged: (value) {
                      debugPrint('Somethig Changed');
                    },
                    decoration: InputDecoration(
                        labelText: 'Title',
                        labelStyle: textStyle,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0)
                        )
                    ),
                  )
              ),
              Padding(
                  padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                  child: TextField(
                    controller: descriptioncontroller,
                    style: textStyle,
                    onChanged: (value) {
                      debugPrint('Somethig Changed in description');
                    },
                    decoration: InputDecoration(
                        labelText: 'Description',
                        labelStyle: textStyle,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0)
                        )
                    ),
                  )
              ),
              Padding(
                padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: RaisedButton(
                        color: Theme
                            .of(context)
                            .primaryColorDark,
                        textColor: Theme
                            .of(context)
                            .primaryColorLight,
                        child: Text(
                          'Save',
                          textScaleFactor: 1.5,
                        ),
                        onPressed: () {
                          setState(() {
                            debugPrint('Save button clicked');
                          });
                        },
                      ),
                    ),
                    Container(
                       width: 5.0,
                   ),
                    Expanded(
                      child: RaisedButton(
                        color: Theme
                            .of(context)
                            .primaryColorDark,
                        textColor: Theme
                            .of(context)
                            .primaryColorLight,
                        child: Text(
                          'Delete',
                          textScaleFactor: 1.5,
                        ),
                        onPressed: () {
                          setState(() {
                            debugPrint('Delete button clicked');
                          });
                        },
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        )
    );
  }

}