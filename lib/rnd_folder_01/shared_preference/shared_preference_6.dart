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

class SharedPreferenceSix extends StatefulWidget {
  @override
  _SharedPreferenceSixState createState() => _SharedPreferenceSixState();
}

class _SharedPreferenceSixState extends State<SharedPreferenceSix> {
  TextEditingController customerNameController = TextEditingController();
  TextEditingController itemNameController = TextEditingController();
  TextEditingController itemPriceController = TextEditingController();

  List<Map<String, dynamic>> savedDataList = [];
  bool isEditing = false; // Flag to track if in edit mode
  int editingIndex = -1; // Index of the data being edited

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
            isEditing
                ? _buildButton('Save Changes', _saveChanges)
                : _buildButton('Save Data', _saveData),
            SizedBox(height: 20),
            _buildButton('Read Data', _readData),
            SizedBox(height: 20),
            _buildButton('Clear Data', _clearData),
            SizedBox(height: 20),
            Expanded(
              child:  SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Container(
                    child: _buildDataTable(),
                  ),
                ),
              ),
            ),
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

  Widget _buildDataTable() {
    return DataTable(
      columns: [
        DataColumn(label: Text('Customer Name')),
        DataColumn(label: Text('Item Name')),
        DataColumn(label: Text('Item Price')),
        DataColumn(label: Text('Edit')),
        DataColumn(label: Text('Delete')),
      ],
      rows: savedDataList.asMap().entries.map((entry) {
        int index = entry.key;
        Map<String, dynamic> data = entry.value;
        return DataRow(
          cells: [
            DataCell(Text(data['customerName'])),
            DataCell(Text(data['itemName'])),
            DataCell(Text(data['itemPrice'].toString())),
            DataCell(
              IconButton(
                icon: Icon(Icons.edit),
                onPressed: () => _editData(index),
              ),
            ),
            DataCell(
              IconButton(
                icon: Icon(Icons.delete),
                onPressed: () => _deleteData(index),
              ),
            ),
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
    _readData(); // Refresh the displayed data after saving
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
    setState(() {
      isEditing = false; // Reset the editing mode
      editingIndex = -1;
    });
  }

  void _editData(int index) {
    Map<String, dynamic> data = savedDataList[index];

    setState(() {
      isEditing = true;
      editingIndex = index;

      customerNameController.text = data['customerName'];
      itemNameController.text = data['itemName'];
      itemPriceController.text = data['itemPrice'].toString();
    });
  }

  void _saveChanges() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String customerName = customerNameController.text;
    String itemName = itemNameController.text;
    double itemPrice = double.parse(itemPriceController.text);

    Map<String, dynamic> data = {
      'customerName': customerName,
      'itemName': itemName,
      'itemPrice': itemPrice,
    };

    // Update the existing data at the specified index
    savedDataList[editingIndex] = data;

    // Save the updated data to SharedPreferences
    String dataKey = prefs.getKeys().elementAt(editingIndex);
    prefs.setString(dataKey, jsonEncode(data));

    _clearTextFields();
    _readData(); // Refresh the displayed data after saving changes
  }

  void _deleteData(int index) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // Remove the data from SharedPreferences
    String dataKey = prefs.getKeys().elementAt(index);
    prefs.remove(dataKey);

    // Refresh the displayed data after deleting
    _readData();
  }

  void _clearData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();

    setState(() {
      savedDataList.clear();
      isEditing = false; // Reset the editing mode
      editingIndex = -1;
    });

    _clearTextFields();
  }

  void _clearTextFields() {
    customerNameController.clear();
    itemNameController.clear();
    itemPriceController.clear();
  }
}
