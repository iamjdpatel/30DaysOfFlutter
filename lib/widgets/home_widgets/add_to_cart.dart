import 'package:flutter/material.dart';
import 'package:flutter_catalog/models/cart.dart';
import 'package:flutter_catalog/models/catalog.dart';

class AddToCart extends StatefulWidget {
  final Item catalog;
  const AddToCart({
    Key key,
    this.catalog,
  }) : super(key: key);

  @override
  __AddToCartState createState() => __AddToCartState();
}

class __AddToCartState extends State<AddToCart> {
  final _cart = Cart();
  @override
  Widget build(BuildContext context) {
    bool isInCart = _cart.items.contains(widget.catalog) ?? false;
    return ElevatedButton(
      child: isInCart ? Icon(Icons.done) : Text('Add to Cart'),
      onPressed: () {
        if (!isInCart) {
          isInCart = !isInCart;
          final _catalog = CatalogModel();
          _cart.catalog = _catalog;
          _cart.add(widget.catalog);
          setState(() {});
        }
      },
    );
  }
}
