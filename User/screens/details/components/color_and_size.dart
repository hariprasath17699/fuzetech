import 'package:cake_app/User/models/Product.dart';
import 'package:flutter/material.dart';
class ColorAndSize extends StatelessWidget {
  const ColorAndSize({
    Key key,
    @required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextField(
          decoration:new InputDecoration(
            labelText: "Occasion:",
            hintText: "Notes to be written on cake.",
          ),
          keyboardType: TextInputType.text,
        )

      ],
    );
  }
}

