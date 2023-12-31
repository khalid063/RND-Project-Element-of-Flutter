import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SharedPreferenceEight(),
    );
  }
}

class SharedPreferenceEight extends StatefulWidget {
  @override
  _SharedPreferenceEightState createState() => _SharedPreferenceEightState();
}

class _SharedPreferenceEightState extends State<SharedPreferenceEight> {
  String textValue = "Item One";
  bool radioValue = true; // true for Yes, false for No
  String dropdownValue = 'cash'; // Default value
  TextEditingController textEditingController = TextEditingController();
  List<Map<String, dynamic>> dataList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Form Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Text Field: $textValue'),
            Row(
              children: [
                Text('Radio Button: '),
                Radio(
                  value: true,
                  groupValue: radioValue,
                  onChanged: (value) {
                    setState(() {
                      radioValue = value as bool;
                    });
                  },
                ),
                Text('Yes'),
                Radio(
                  value: false,
                  groupValue: radioValue,
                  onChanged: (value) {
                    setState(() {
                      radioValue = value as bool;
                    });
                  },
                ),
                Text('No'),
              ],
            ),
            DropdownButton<String>(
              value: dropdownValue,
              onChanged: (String? newValue) {
                setState(() {
                  dropdownValue = newValue!;
                });
              },
              items: ['cash', 'card', 'both']
                  .map<DropdownMenuItem<String>>(
                    (String value) => DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                ),
              )
                  .toList(),
              hint: Text('Sales Type'),
            ),
            TextFormField(
              controller: textEditingController,
              decoration: InputDecoration(labelText: 'Enter Text'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () async {
                // Handle save button press
                String enteredText = textEditingController.text;

                // Save to SharedPreferences
                SharedPreferences prefs = await SharedPreferences.getInstance();
                prefs.setString('textValue', enteredText);
                prefs.setBool('radioValue', radioValue);
                prefs.setString('dropdownValue', dropdownValue);

                // Add data to dataList
                dataList.add({
                  'item': enteredText,
                  'foc': radioValue ? 'Yes' : 'No',
                  'salesType': dropdownValue,
                  'totalPrice': '3', // You can set the actual total price here
                });

                // Update the UI
                setState(() {});

                print('Data saved: Text: $enteredText, Radio: $radioValue, Sales Type: $dropdownValue');
              },
              child: Text('Save'),
            ),
            SizedBox(height: 16.0),
            Text('Table', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            DataTable(
              columns: [
                DataColumn(label: Text('Item')),
                DataColumn(label: Text('FOC')),
                DataColumn(label: Text('Sales Type')),
                DataColumn(label: Text('Total Price')),
              ],
              rows: dataList
                  .map(
                    (data) => DataRow(
                  cells: [
                    DataCell(Text(data['item'])),
                    DataCell(Text(data['foc'])),
                    DataCell(Text(data['salesType'])),
                    DataCell(Text(data['totalPrice'])),
                  ],
                ),
              )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
