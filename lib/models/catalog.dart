class Catalog {

  static final cat = Catalog._internal();
  Catalog._internal();
  factory Catalog() => cat;

  static List<Item> items;

  //Get Iteam by id
  Item getById(int id) =>
      items.firstWhere((element) => element.id == id, orElse: null);

  Item getByPosition(int i) => items[i];
}

class Item {
  final int id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String image;

  Item({this.id, this.name, this.desc, this.price, this.color, this.image});

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
        id: map["id"],
        name: map["name"],
        desc: map["desc"],
        price: map["price"],
        color: map["color"],
        image: map["image"]);
  }

  toMap() => {
        "id": id,
        "name": name,
        "desc": desc,
        "price": price,
        "color": color,
        "image": image
      };
}
