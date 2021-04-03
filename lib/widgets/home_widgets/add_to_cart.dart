import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_catalog/models/cart.dart';
import 'package:flutter_catalog/models/catalog.dart';

class AddToCart extends StatefulWidget {
  final Cart cart;
  final Item catalog;
  const AddToCart({
    Key key,
    this.catalog,
    this.cart,
  }) : super(key: key);

  @override
  __AddToCartState createState() => __AddToCartState();
}

class __AddToCartState extends State<AddToCart> {
  // final _cart = Cart();
  @override
  Widget build(BuildContext context) {
    bool isInCart = widget.cart.items.contains(widget.catalog) ?? false;
    return ElevatedButton(
      child: isInCart ? Icon(Icons.done) : Icon(CupertinoIcons.cart_badge_plus),
      onPressed: () {
        if (!isInCart) {
          isInCart = !isInCart;
          final _catalog = Catalog();
          widget.cart.catalog = _catalog;
          widget.cart.add(widget.catalog);
          setState(() {});
        }
      },
    );
  }
}
