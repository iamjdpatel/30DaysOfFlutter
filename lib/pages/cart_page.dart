import 'package:flutter/material.dart';
import 'package:flutter_catalog/models/cart.dart';

class CartPage extends StatefulWidget {
  final Cart cart;

  const CartPage({Key key, this.cart}) : super(key: key);
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: _CartList(cart: widget.cart),
            ),
          ),
          Divider(),
          _CartTotal(cart: widget.cart)
        ],
      ),
    );
  }
}

class _CartTotal extends StatefulWidget {
  final Cart cart;
  const _CartTotal({Key key, this.cart}) : super(key: key);
  @override
  __CartTotalState createState() => __CartTotalState();
}

class __CartTotalState extends State<_CartTotal> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(32, 0, 32, 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "\$${widget.cart.totalPrice}",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            ElevatedButton(
              child: Text('Buy'),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Buying not supported yet.")));
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _CartList extends StatefulWidget {
  final Cart cart;
  const _CartList({Key key, this.cart}) : super(key: key);
  @override
  __CartListState createState() => __CartListState();
}

class __CartListState extends State<_CartList> {
  @override
  Widget build(BuildContext context) {
    return widget.cart.items.isEmpty
        ? Text('No item added in Cart.')
        : ListView.builder(
            itemCount: widget.cart.items?.length,
            itemBuilder: (context, index) => ListTile(
              leading: Icon(Icons.done),
              trailing: IconButton(
                  icon: Icon(Icons.remove_circle_outline),
                  onPressed: () {
                    setState(() {
                      widget.cart.remove(widget.cart.items[index]);
                    });
                  }),
              title: Text(widget.cart.items[index].name),
            ),
          );
  }
}
