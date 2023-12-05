import 'package:flutter/material.dart';

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

class AutoSerialNumberCreateScreen extends StatefulWidget {
  @override
  _AutoSerialNumberCreateScreenState createState() => _AutoSerialNumberCreateScreenState();
}

class _AutoSerialNumberCreateScreenState extends State<AutoSerialNumberCreateScreen> {
  String serialNumber = "Auto Number Generate";

  String generateSerialNumber() {
    // Get current year and month
    DateTime now = DateTime.now();
    String year = now.year.toString();
    String month = now.month.toString().padLeft(2, '0');

    // Generate a serial number (increment it each time)
    int serialNumberValue = 1; // You might want to retrieve the last serial number from a storage or database
    String formattedSerialNumber = serialNumberValue.toString().padLeft(6, '0');

    // Concatenate the components to form the final serial number
    String finalSerialNumber = '$year$month$formattedSerialNumber';

    return finalSerialNumber;
  }

  void updateSerialNumber() {
    // Your logic for generating the serial number
    // For now, using the simple function from the previous example
    String newSerialNumber = generateSerialNumber();

    // Update the UI with the new serial number
    setState(() {
      serialNumber = newSerialNumber;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Serial Number Generator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              serialNumber,
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: updateSerialNumber,
              child: Text('Generate Serial Number'),
            ),
          ],
        ),
      ),
    );
  }
}
