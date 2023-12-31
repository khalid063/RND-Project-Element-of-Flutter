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

class IndexWithSharedPreference extends StatefulWidget {
  @override
  _IndexWithSharedPreferenceState createState() => _IndexWithSharedPreferenceState();
}

class _IndexWithSharedPreferenceState extends State<IndexWithSharedPreference> {
  SharedPreferences? _prefs;
  List<Map<String, String>> items = [];

  final TextEditingController _productNameController = TextEditingController();
  final TextEditingController _productQuantityController = TextEditingController();
  final TextEditingController _productPriceController = TextEditingController();
  final TextEditingController _remarkController = TextEditingController();

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
    // Generate an auto-incremented index
    int _index = items.length + 1;

    // Create a map with the entered data
    Map<String, String> newItem = {
      'index': _index.toString(),
      'productName': _productNameController.text,
      'productQuantity': _productQuantityController.text,
      'productPrice': _productPriceController.text,
      'remark': _remarkController.text,
    };

    // Save the map as a JSON string in SharedPreferences
    items.add(newItem);
    List<String> itemsAsString = items.map((item) => jsonEncode(item)).toList();
    await _prefs?.setStringList('items', itemsAsString);

    // Clear the text fields after adding an item
    _productNameController.clear();
    _productQuantityController.clear();
    _productPriceController.clear();
    _remarkController.clear();

    // Reload the data to reflect the changes
    _loadData();

    print('Massage 666 : ${itemsAsString}');

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SharedPreferences Example'),
      ),
      body: Padding(
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
          ],
        ),
      ),
    );
  }
}
