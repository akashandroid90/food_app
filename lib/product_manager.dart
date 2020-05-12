import 'package:flutter/material.dart';
import 'package:flutter_app/product_control.dart';

import './products.dart';

class ProductManager extends StatefulWidget {
  final Map<String,String> startingProduct;

  ProductManager({this.startingProduct});

  @override
  State<StatefulWidget> createState() {
    return _ProductManagerState();
  }
}

class _ProductManagerState extends State<ProductManager> {
  List<Map<String,String>> _products = [];

@override
  void initState() {
    if(widget.startingProduct!=null)
    _products.add(widget.startingProduct);
    super.initState();
  }

  void _addProduct(Map<String,String> product) {
    setState(() {
      _products.add(product);
    });
  }

  void _deleteProduct(int position) {
    setState(() {
      _products.removeAt(position);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.all(10.0),
          child: ProductControl(_addProduct),
        ),
        Expanded(
          child: Products(_products,_deleteProduct),
        ),
      ],
    );
  }
}
