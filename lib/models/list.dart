class Lists
{
  // int id = 0 ;
  late String listName ;
  late String listtype ;
  late int totalItem ;
  late int totalAmount ;

  Lists({
    // required this.id,
    required this.listName,
    required this.listtype,
    required this.totalItem,
    required this.totalAmount,
  });


//  int get id => this._id;

//  set id(int value) => this._id = value;

//   get listname => this._listname;

//  set listname( value) => this._listname = value;

//   get listtype => this._listtype;

//  set listtype( value) => this._listtype = value;

//   get totalItem => this._totalItem;

//  set totalItem( value) => this._totalItem = value;

//   get totalAmount => this._totalAmount;

//  set totalAmount( value) => this._totalAmount = value;

 //converting Object to map object
 Map<String, dynamic> toMap(){
   var map = Map<String, dynamic>();

  //  if(id != null)
  //  {
  //    map['id'] = id;
  //  }
   map['list_name'] = listName;
   map['list_type'] = listtype;
   map['total_item'] = totalItem;
   map['total_amount'] = totalAmount;

   return map;
 }

 //For extracting the Original Object from Map Object
  fromMapObject(Map<String, dynamic> map){
    // this.id = map['id'];
    this.listName = map['list_name'];
    this.listtype = map['list_type'];
    this.totalItem = map['total_item'];
    this.totalAmount = map['total_amount'];
  }

}
