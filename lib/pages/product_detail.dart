import 'package:flutter/material.dart';

class ProductDetail extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String description;

  ProductDetail(
      {this.title = 'Product Details',
      this.imageUrl = 'assets/food.jpg',
      this.description = 'Dummy Data'});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
          appBar: AppBar(
            title: Text(title),
          ),
          body: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset(imageUrl),
              Container(
                padding: EdgeInsets.all(10.0),
                child: Text(description),
              ),
              RaisedButton(
                color: Theme.of(context).accentColor,
                child: Text('Back & Delete'),
                textColor: Colors.white,
                onPressed: () => Navigator.pop(context, true),
              )
            ],
          ),
        ),
        onWillPop: () {
          Navigator.pop(context, false);
          return Future.value(false);
        });
  }
}
