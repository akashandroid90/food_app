import 'dart:async';

import 'package:flutter/material.dart';

class ProductPage extends StatelessWidget {
  final String title;
  final String imageUrl;

  ProductPage(this.title, this.imageUrl);

_showConfirmationDialog(BuildContext context){
  showDialog(context:context,builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Are you sure?'),
                    content: Text('This action can not undone'),
                    actions: <Widget>[
                      FlatButton(onPressed: () {
                        Navigator.pop(context);
                      }, child: Text('Disacard')),
                      FlatButton(onPressed: () {
                        Navigator.pop(context);
                        Navigator.pop(context,true);
                      }, child: Text('Continue'))
                    ],
                  );
                });
}

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        print('Back button pressed!');
        Navigator.pop(context, false);
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset(imageUrl),
            Container(
              padding: EdgeInsets.all(10.0),
              child: Text(title),
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              child: RaisedButton(
                color: Theme.of(context).accentColor,
                child: Text('DELETE'),
                onPressed: () => _showConfirmationDialog(context),
              ),
            )
          ],
        ),
      ),
    );
  }
}
