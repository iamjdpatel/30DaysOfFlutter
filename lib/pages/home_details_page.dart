import 'package:flutter/material.dart';
import 'package:flutter_catalog/models/catalog.dart';
import 'package:flutter_catalog/widgets/home_widgets/add_to_cart.dart';

class HomeDetailsPage extends StatelessWidget {
  final Item catalog;

  const HomeDetailsPage({Key key, @required this.catalog})
      : assert(catalog != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Item Details'),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(
                tag: Key(catalog.id.toString()),
                child: Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Image.network(catalog.image),
                )),
            Expanded(
                child: Container(
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text(
                      catalog.name,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                    ),
                    Text(
                      catalog.desc,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "\$${catalog.price.toString()}",
                      style:
                          TextStyle(fontWeight: FontWeight.w900, fontSize: 24),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    AddToCart(catalog: catalog)
                  ],
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
