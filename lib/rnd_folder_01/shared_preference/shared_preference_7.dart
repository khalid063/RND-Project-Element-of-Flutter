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
//       home: MyForm(),
//     );
//   }
// }

class SharedPreferenceSeven extends StatefulWidget {
  @override
  _SharedPreferenceSevenState createState() => _SharedPreferenceSevenState();
}

class _SharedPreferenceSevenState extends State<SharedPreferenceSeven> {
  TextEditingController textController = TextEditingController(text: "Item One");
  bool isYesSelected = false;
  TextEditingController textFormFieldController = TextEditingController();
  String selectedSalesType = "cash";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Form'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: textController,
              decoration: InputDecoration(labelText: 'Item'),
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Text('Yes'),
                Radio(
                  value: true,
                  groupValue: isYesSelected,
                  onChanged: (value) {
                    setState(() {
                      isYesSelected = value!;
                    });
                  },
                ),
                Text('No'),
                Radio(
                  value: false,
                  groupValue: isYesSelected,
                  onChanged: (value) {
                    setState(() {
                      isYesSelected = value!;
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 16),
            TextFormField(
              controller: textFormFieldController,
              decoration: InputDecoration(labelText: 'Total Price'),
            ),
            SizedBox(height: 16),
            DropdownButton<String>(
              value: selectedSalesType,
              onChanged: (String? value) {
                setState(() {
                  selectedSalesType = value!;
                });
              },
              items: <String>['cash', 'card', 'both']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              hint: Text('Sales Type'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Save data into SharedPreferences
                saveData();

                // Add your save logic here
                print('Item: ${textController.text}');
                print('Is Yes Selected: $isYesSelected');
                print('Total Price: ${textFormFieldController.text}');
                print('Selected Sales Type: $selectedSalesType');
              },
              child: Text('Save'),
            ),
            SizedBox(height: 16),
            Text(
              'Saved Data:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            FutureBuilder<List<String>>(
              future: getData(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Text('No saved data yet.');
                } else {
                  return DataTable(
                    columns: [
                      DataColumn(label: Text('Item')),
                      DataColumn(label: Text('FOC')),
                      DataColumn(label: Text('Total Price')),
                      DataColumn(label: Text('Pay Type')),
                    ],
                    rows: [
                      DataRow(cells: [
                        DataCell(Text(snapshot.data![0])),
                        DataCell(Text(snapshot.data![1])),
                        DataCell(Text(snapshot.data![2])),
                        DataCell(Text(snapshot.data![3])),
                      ]),
                    ],
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<void> saveData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList('formData', [
      textController.text,
      isYesSelected.toString(),
      textFormFieldController.text,
      selectedSalesType,
    ]);
  }

  Future<List<String>> getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? formData = prefs.getStringList('formData');
    return formData ?? [];
  }
}
