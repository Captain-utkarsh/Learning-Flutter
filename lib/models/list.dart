class Lists {
  int id;
  String listName;
  String listtype;
  int totalItem;
  int totalAmount;

  Lists({
    required this.id,
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
  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map['id'] = id;
    map['list_name'] = listName;
    map['list_type'] = listtype;
    map['total_item'] = totalItem;
    map['total_amount'] = totalAmount;

    return map;
  }

  //For extracting the Original Object from Map Object
  fromMapObject(Map<String, dynamic> map) {
    id = map['id'];
    listName = map['list_name'];
    listtype = map['list_type'];
    totalItem = map['total_item'];
    totalAmount = map['total_amount'];
  }
}
