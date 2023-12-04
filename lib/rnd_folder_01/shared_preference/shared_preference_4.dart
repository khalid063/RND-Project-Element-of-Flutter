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

class SharedPreferenceFour extends StatefulWidget {
  @override
  _SharedPreferenceFourState createState() => _SharedPreferenceFourState();
}

class _SharedPreferenceFourState extends State<SharedPreferenceFour> {
  TextEditingController customerNameController = TextEditingController();
  TextEditingController itemNameController = TextEditingController();
  TextEditingController itemPriceController = TextEditingController();

  List<Map<String, dynamic>> savedDataList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SharedPreferences CRUD Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
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
              _buildDataTable(),
            ],
          ),
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

  Widget _buildDataTable() {
    return DataTable(
      columns: [
        DataColumn(label: Text('Customer Name')),
        DataColumn(label: Text('Item Name')),
        DataColumn(label: Text('Item Price')),
      ],
      rows: savedDataList.map((data) {
        return DataRow(
          cells: [
            DataCell(Text(data['customerName'])),
            DataCell(Text(data['itemName'])),
            DataCell(Text(data['itemPrice'].toString())),
          ],
        );
      }).toList(),
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

    // Use a unique key for each set of data
    String dataKey = 'data_${DateTime.now().millisecondsSinceEpoch}';
    prefs.setString(dataKey, jsonEncode(data));

    _clearTextFields();
  }

  void _readData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // Clear the previous list
    savedDataList.clear();

    // Get all keys from SharedPreferences
    Set<String> keys = prefs.getKeys();

    // Iterate through keys and add data to the list
    for (String key in keys) {
      String? dataJson = prefs.getString(key);

      if (dataJson != null) {
        Map<String, dynamic> data = jsonDecode(dataJson);
        savedDataList.add(data);
      }
    }

    // Update the UI
    setState(() {});
  }

  void _clearData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();

    setState(() {
      savedDataList.clear();
    });

    _clearTextFields();
  }

  void _clearTextFields() {
    customerNameController.clear();
    itemNameController.clear();
    itemPriceController.clear();
  }
}
