import 'package:flutter/material.dart';
import 'package:flutter_catalog/models/cart.dart';
import 'package:flutter_catalog/models/catalog.dart';
import 'package:flutter_catalog/pages/home_details_page.dart';
import 'add_to_cart.dart';
import 'catalog_image.dart';

class CatalogList extends StatefulWidget {
  final Cart cart;
  const CatalogList({Key key, this.cart}) : super(key: key);
  @override
  _CatalogListState createState() => _CatalogListState();
}

class _CatalogListState extends State<CatalogList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        final catalog = Catalog.items[index];
        return InkWell(
          child: CatalogItem(cart: widget.cart, catalog: catalog),
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => HomeDetailsPage(
                      cart: widget.cart,
                      catalog: catalog,
                    )),
          ),
        );
      },
      itemCount: Catalog.items.length,
    );
  }
}

class CatalogItem extends StatefulWidget {
  final Cart cart;
  final Item catalog;

  const CatalogItem({Key key, @required this.catalog, this.cart})
      : assert(catalog != null),
        super(key: key);

  @override
  _CatalogItemState createState() => _CatalogItemState();
}

class _CatalogItemState extends State<CatalogItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            leading: Hero(
              tag: Key(widget.catalog.id.toString()),
              child: CatalogImage(
                image: widget.catalog.image,
              ),
            ),
            title: Container(
                child: Text(
              widget.catalog.name,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            )),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.catalog.desc.toString(),
                  style: TextStyle(fontSize: 13),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "\$${widget.catalog.price.toString()}",
                      style:
                          TextStyle(fontWeight: FontWeight.w900, fontSize: 18),
                    ),
                    AddToCart(cart: widget.cart, catalog: widget.catalog),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
