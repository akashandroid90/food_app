import 'package:flutter/material.dart';
import 'package:flutter_course/pages/product_create_edit.dart';

class ProductListPage extends StatelessWidget {
  final List<Map<String, dynamic>> _products;
  final Function updateProduct;
  ProductListPage(this._products, this.updateProduct);
  @override
  Widget build(BuildContext context) {
    return _products.length > 0
        ? ListView.builder(
            itemBuilder: (BuildContext context, int index) => ListTile(
              leading: Image.asset(_products[index]["image"]),
              title: Text(
                _products[index]["title"],
              ),
              trailing: IconButton(
                icon: Icon(Icons.edit),
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (BuildContext context) {
                    return ProductCreateEditPage(
                      product: _products[index],
                      updateProduct: updateProduct,
                      index: index,
                    );
                  }));
                },
              ),
            ),
            itemCount: _products.length,
          )
        : Center(
            child: Text('All Products'),
          );
  }
}
