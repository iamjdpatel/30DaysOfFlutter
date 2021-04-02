import 'package:flutter/material.dart';
import 'package:flutter_catalog/models/cart.dart';

class CartPage extends StatelessWidget {
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
              child: _CartList(),
            ),
          ),
          Divider(),
          _CartTotal()
        ],
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _cart = Cart();
    return SizedBox(
      height: 200,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(32, 0, 32, 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "\$${_cart.totalPrice}",
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
  @override
  __CartListState createState() => __CartListState();
}

class __CartListState extends State<_CartList> {
  final _cart = Cart();
  @override
  Widget build(BuildContext context) {
    return _cart.items.isEmpty
        ? Text('No item added in Cart.')
        : ListView.builder(
            itemCount: _cart.items?.length,
            itemBuilder: (context, index) => ListTile(
              leading: Icon(Icons.done),
              trailing: IconButton(
                  icon: Icon(Icons.remove_circle_outline),
                  onPressed: () {
                    _cart.remove(_cart.items[index]);
                    setState(() { });
                  }),
              title: Text(_cart.items[index].name),
            ),
          );
  }
}
