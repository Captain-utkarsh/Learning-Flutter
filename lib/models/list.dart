class Lists
{
  late int id ;
  late String listname ;
  late String listtype ;
  late int totalItem ;
  late int totalAmount ;

  Lists({
    required this.id,
    required this.listname,
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

   if(id != null)
   {
     map['id'] = id;
   }
   map['listname'] = listname;
   map['listtype'] = listtype;
   map['totalitem'] = totalItem;
   map['totalamount'] = totalAmount;

   return map;
 }

 //For extracting the Original Object from Map Object
  Lists.fromMapObejct(Map<String, dynamic> map){
    this.id = map['id'];
    this.listname = map['listname'];
    this.listtype = map['listtype'];
    this.totalItem = map['totalitem'];
    this.totalAmount = map['totalamount'];
  }

}
