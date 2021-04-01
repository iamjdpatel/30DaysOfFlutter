import 'package:flutter/material.dart';

class CatalogImage extends StatelessWidget {
  final String image;
  const CatalogImage({Key key, @required this.image})
      : assert(image != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.network(
        image,
        fit: BoxFit.scaleDown,
      ),
      width: 100,
    );
  }
}
