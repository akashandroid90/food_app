import 'package:flutter/material.dart';
import 'package:flutter_app/pages/product_detail.dart';

class Products extends StatelessWidget {
  final List<Map<String, String>> products;
   final Function deleteProduct;
  Products(this.products,this.deleteProduct);

  Widget _buildProductItem(context, index) {
    return Card(
      child: Column(
        children: <Widget>[
          Image.asset(products[index]['image']),
          Text(products[index]['product']),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                child: Text('Details'),
                onPressed: () => Navigator.push<bool>(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => ProductDetail(
                        title: products[index]['product'],
                        imageUrl: products[index]['image']),
                  ),
                ).then((bool value){
                  if(value)
                  deleteProduct(index);
                }),
              )
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return products.length > 0
        ? ListView.builder(
            itemBuilder: _buildProductItem,
            itemCount: products.length,
          )
        : Center(child: Text("No product found, please add"));
  }
}
