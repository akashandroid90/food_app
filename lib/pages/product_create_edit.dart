import 'package:flutter/material.dart';

class ProductCreateEditPage extends StatefulWidget {
  final Function addProduct;
  final Function updateProduct;
  final Map<String, dynamic> product;
  final int index;

  ProductCreateEditPage({this.addProduct, this.updateProduct, this.product,this.index});

  @override
  State<StatefulWidget> createState() {
    return _ProductCreateEditPageState();
  }
}

class _ProductCreateEditPageState extends State<ProductCreateEditPage> {
  final Map<String, dynamic> _formData = {
    "title": null,
    "description": null,
    "image": "assets/food.jpg",
    "price": 0
  };
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildTitleTextField() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Product Title'),
      initialValue: widget.product == null ? '' : widget.product["title"],
      validator: (String value) {
        if (value.isEmpty || value.length < 5)
          return "Title is required and should be 5+ character long";
        else
          return null;
      },
      onSaved: (String value) {
        _formData["title"] = value;
      },
    );
  }

  Widget _buildDescriptionTextField() {
    return TextFormField(
      maxLines: 4,
      decoration: InputDecoration(labelText: 'Product Description'),
      initialValue: widget.product == null ? '' : widget.product["description"],
      validator: (String value) {
        if (value.isEmpty || value.length < 10)
          return "Description is required and should be 10+ character long";
        else
          return null;
      },
      onSaved: (String value) {
        _formData["description"] = value;
      },
    );
  }

  Widget _buildPriceTextField() {
    return TextFormField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(labelText: 'Product Price'),
      initialValue:
          widget.product == null ? '' : widget.product["price"].toString(),
      validator: (String value) {
        if (value.isEmpty ||
            !RegExp(r'^(?:[1-9]\d*|0)?(?:\.\d)?$').hasMatch(value))
          return "Price is required and should be number";
        else
          return null;
      },
      onSaved: (String value) {
        _formData["price"] = double.parse(value);
      },
    );
  }

  void _submitForm() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      widget.product == null
          ? widget.addProduct(_formData)
          : widget.updateProduct(widget.index,_formData);
      Navigator.pushReplacementNamed(context, '/products');
    }
  }

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double targetWidth = deviceWidth > 550.0 ? 500.0 : deviceWidth * 0.95;
    final double targetPadding = deviceWidth - targetWidth;
    final Widget pageContent = GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Container(
        margin: EdgeInsets.all(10.0),
        child: Form(
          key: _formKey,
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: targetPadding / 2),
            children: <Widget>[
              _buildTitleTextField(),
              _buildDescriptionTextField(),
              _buildPriceTextField(),
              SizedBox(
                height: 10.0,
              ),
              RaisedButton(
                child: Text('Save'),
                textColor: Colors.white,
                onPressed: _submitForm,
              )
              // GestureDetector(
              //   onTap: _submitForm,
              //   child: Container(
              //     color: Colors.green,
              //     padding: EdgeInsets.all(5.0),
              //     child: Text('My Button'),
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
    return widget.product == null
        ? pageContent
        : Scaffold(
            appBar: AppBar(title: Text("Edit Product")),
            body: pageContent,
          );
  }
}
