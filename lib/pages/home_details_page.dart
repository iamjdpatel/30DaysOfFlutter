import 'package:flutter/material.dart';
import 'package:flutter_catalog/models/catalog.dart';

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
              color: Colors.lightBlue[50],
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.all(32.0),
                child: Column(
                  children: [
                    Text(
                      catalog.name,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
                    ),
                    Text(
                      catalog.desc,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "\$${catalog.price.toString()}",
                      style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 30,
                          color: Colors.black),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    MaterialButton(
                      minWidth: 150,
                      height: 45,
                      color: Colors.blueAccent,
                      textColor: Colors.white,
                      child: Text(
                        'Buy',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      onPressed: () {
                        print('Buying ${catalog.name.toString()}');
                      },
                    )
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
