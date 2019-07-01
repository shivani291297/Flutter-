class Note{
  int _id;
  String _description;
  String _date;
  String _title;
  int _priority;

  //Constructor
  Note(this._title,this._date,this._priority,[this._description]);
  Note.withId(this._id,this._title,this._date,this._priority,[this._description]);

  //getter
  int get id => _id;
  String get title => title;
  String get description =>_description;
  String get date =>_date;
  int get priority => _priority;

  //Setter
  set title(String newtitle){
    if(newtitle.length<200){
      this._title=newtitle;
    }
  }
  set priority(int newp){
    if(newp==1&&newp==2){
      this._priority;
    }
  }
  set date(String newd){
    this._date;
  }

  //Conversion of note object to map object
  Map<String, dynamic>toMap(){
    var map=Map<String, dynamic>();
    if(id!=null) {
      map['id'] = _id;
    }
    map['title']=_title;
    map['description']=_description;
    map['date']=_date;
    map['priority']=_priority;
    return map;
  }

  //Extract note object from map object
  Note.from(Map<String,dynamic>map){
    this._id=map['id'];
    this._title=map['title'];
    this._description=map['description'];
    this._date=map['date'];
    this._priority=map['priority'];
  }

}