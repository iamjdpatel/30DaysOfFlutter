import 'catalog.dart';

class Cart {
  static final cart = Cart._internal();
  Cart._internal();
  factory Cart() => cart;

  CatalogModel catalog;
  set setCatalog(CatalogModel newCatalog) {
    assert(newCatalog != null);
    catalog = newCatalog;
  }

  final List<int> _itemIds = [];

  List<Item> get items => _itemIds.map((id) => catalog.getById(id)).toList();

  num get totalPrice =>
      items.fold(0, (total, current) => total += current.price);

  void add(Item item) {
    _itemIds.add(item.id);
  }

  void remove(Item item) {
    _itemIds.remove(item.id);
  }
}
