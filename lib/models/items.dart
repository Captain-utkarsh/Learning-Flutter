class Items {
  int itemId;
  String itemName;
  int quantity;
  int price;
  String description;
  int tListId;

  Items(
      {required this.itemId,
      required this.itemName,
      required this.quantity,
      required this.price,
      required this.description,
      required this.tListId});

  void fromMap(Map map) {
    itemId = map['id'];
    itemName = map['item_name'];
    quantity = map['item_quantity'];
    price = map['item_price'];
    description = map['item_description'];
    tListId = map['item_listid'];
  }

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    //  if(id != null)
    //  {
    //    map['id'] = id;
    //  }
    map['item_name'] = itemName;
    map['item_quantity'] = quantity;
    map['item_price'] = price;
    map['item_description'] = description;
    //map['id'] = itemId;
    map['item_listid'] = tListId;
    return map;
  }

  @override
  String toString() {
    return '''Item{
      id: $itemId, 
      name: $itemName, 
      listId: $tListId
      quantity: $quantity, 
      price: $price, 
      description: $description, 
    }''';
  }
}
