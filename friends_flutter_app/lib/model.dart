
class Friend{

  int _id ;
  String _name ;

  Friend(this._name);
//  Friend.withId(this._id,this._name);
  /*a
  Friend(int id, String name){
  this.id = id,
  thid.name = name;
   */

  // getters....
int get getId {
  return this._id;
}
String get getName => this._name ;

// setters.....
//set setId(int id) {
//  this._id = id ;
//}
//set setName(String name) {
//  this._name = name;
//}

// convert friend's data into Map<String,dynamic>
Map<String,dynamic>convertToMap() {
     Map<String,dynamic> map = new Map();
     map['id'] = this._id;
     map['name'] = this._name;
     return map;
}

// convert map data to object form
Friend.toObject(Map<String,dynamic>map) {
  this._id = map['id'];
  this._name = map['name'];
}

}