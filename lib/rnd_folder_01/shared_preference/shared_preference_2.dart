import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: HomeScreen(),
//     );
//   }
// }

class SharedPreferenceScreenTwo extends StatefulWidget {
  @override
  _SharedPreferenceScreenTwoState createState() => _SharedPreferenceScreenTwoState();
}

class _SharedPreferenceScreenTwoState extends State<SharedPreferenceScreenTwo> {
  TextEditingController customerNameController = TextEditingController();
  TextEditingController itemNameController = TextEditingController();
  TextEditingController itemPriceController = TextEditingController();

  String savedCustomerName = '';
  String savedItemName = '';
  String savedItemPrice = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SharedPreferences CRUD Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildTextField('Customer Name', customerNameController),
            _buildTextField('Item Name', itemNameController),
            _buildTextField('Item Price', itemPriceController),
            SizedBox(height: 20),
            _buildButton('Save Data', _saveData),
            SizedBox(height: 20),
            _buildButton('Read Data', _readData),
            SizedBox(height: 20),
            _buildButton('Clear Data', _clearData),
            SizedBox(height: 20),
            _buildSavedDataText('Saved Customer Name: $savedCustomerName'),
            _buildSavedDataText('Saved Item Name: $savedItemName'),
            _buildSavedDataText('Saved Item Price: $savedItemPrice'),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(labelText: label),
    );
  }

  Widget _buildButton(String label, Function() onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(label),
    );
  }

  Widget _buildSavedDataText(String text) {
    return Text(
      text,
      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    );
  }

  void _saveData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String customerName = customerNameController.text;
    String itemName = itemNameController.text;
    double itemPrice = double.parse(itemPriceController.text);

    Map<String, dynamic> data = {
      'customerName': customerName,
      'itemName': itemName,
      'itemPrice': itemPrice,
    };

    String dataJson = jsonEncode(data);
    prefs.setString('customerData', dataJson);

    _clearTextFields();
  }

  void _readData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? dataJson = prefs.getString('customerData');

    if (dataJson != null) {
      Map<String, dynamic> data = jsonDecode(dataJson);

      setState(() {
        savedCustomerName = data['customerName'];
        savedItemName = data['itemName'];
        savedItemPrice = data['itemPrice'].toString();
      });
    } else {
      print('No data saved.');
    }
  }

  void _clearData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();

    setState(() {
      savedCustomerName = '';
      savedItemName = '';
      savedItemPrice = '';
    });

    _clearTextFields();
  }

  void _clearTextFields() {
    customerNameController.clear();
    itemNameController.clear();
    itemPriceController.clear();
  }
}
