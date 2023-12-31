import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: MyHomePage(),
//     );
//   }
// }

class IndexWithSharedPreference2 extends StatefulWidget {
  @override
  _IndexWithSharedPreference2State createState() => _IndexWithSharedPreference2State();
}

class _IndexWithSharedPreference2State extends State<IndexWithSharedPreference2> {
  SharedPreferences? _prefs;
  List<Map<String, String>> items = [];

  final TextEditingController _productNameController = TextEditingController();
  final TextEditingController _productQuantityController = TextEditingController();
  final TextEditingController _productPriceController = TextEditingController();
  final TextEditingController _remarkController = TextEditingController();
  final TextEditingController _deleteIndexController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _initSharedPreferences();
  }

  _initSharedPreferences() async {
    _prefs = await SharedPreferences.getInstance();
    _loadData();
  }

  _loadData() {
    List<String>? loadedItems = _prefs?.getStringList('items');
    if (loadedItems != null) {
      setState(() {
        items = loadedItems.map((item) => Map<String, String>.from(jsonDecode(item))).toList();
        print('Massage Item 888 : ${items}');
      });
    }
  }

  _addItem() async {
    int index = items.length + 1;

    Map<String, String> newItem = {
      'index': index.toString(),
      'productName': _productNameController.text,
      'productQuantity': _productQuantityController.text,
      'productPrice': _productPriceController.text,
      'remark': _remarkController.text,
    };

    items.add(newItem);
    List<String> itemsAsString = items.map((item) => jsonEncode(item)).toList();
    await _prefs?.setStringList('items', itemsAsString);

    _productNameController.clear();
    _productQuantityController.clear();
    _productPriceController.clear();
    _remarkController.clear();

    _loadData();
    print('Massage 666 : ${itemsAsString}');
  }

  _deleteRow() async {
    String deleteIndexText = _deleteIndexController.text;
    if (deleteIndexText.isEmpty) {
      return;
    }

    int deleteIndex = int.tryParse(deleteIndexText) ?? -1;

    if (deleteIndex >= 1 && deleteIndex <= items.length) {
      items.removeAt(deleteIndex - 1);

      List<String> itemsAsString = items.map((item) => jsonEncode(item)).toList();
      await _prefs?.setStringList('items', itemsAsString);

      _loadData();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SharedPreferences Example'),
      ),
      body: Material(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextFormField(
                  controller: _productNameController,
                  decoration: InputDecoration(labelText: 'Product Name'),
                ),
                TextFormField(
                  controller: _productQuantityController,
                  decoration: InputDecoration(labelText: 'Product Quantity'),
                  keyboardType: TextInputType.number,
                ),
                TextFormField(
                  controller: _productPriceController,
                  decoration: InputDecoration(labelText: 'Product Price'),
                  keyboardType: TextInputType.number,
                ),
                TextFormField(
                  controller: _remarkController,
                  decoration: InputDecoration(labelText: 'Remark'),
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: _addItem,
                  child: Text('Add Item'),
                ),
                SizedBox(height: 16.0),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: _deleteIndexController,
                        decoration: InputDecoration(labelText: 'Delete Index'),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    SizedBox(width: 8.0),
                    ElevatedButton(
                      onPressed: _deleteRow,
                      child: Text('Delete Row'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
