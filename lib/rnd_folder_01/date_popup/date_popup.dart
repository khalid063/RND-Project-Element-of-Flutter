

import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Date Picker Example'),
//         ),
//         body: MyWidget(),
//       ),
//     );
//   }
// }

class DatePopup extends StatefulWidget {
  @override
  _DatePopupState createState() => _DatePopupState();
}

class _DatePopupState extends State<DatePopup> {
  TextEditingController _remarkTEController = TextEditingController();
  DateTime? _selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
        _remarkTEController.text = _selectedDate.toString(); // Set the selected date to the text field
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Date Pick'),
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.only(left: 10, right: 10),
        margin: const EdgeInsets.only(left: 8, right: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          children: [
            SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  flex: 10,
                  child: Container(
                    child: Text(
                      'Customer Name',
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      'Date : ',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 8,
                  child: SizedBox(
                    height: 60,
                    child: TextFormField(
                      controller: _remarkTEController,
                      decoration: InputDecoration(
                        hintText: 'Pick A Date',
                        filled: true,
                        fillColor: Colors.cyanAccent,
                      ),
                      onTap: () {
                        _selectDate(context);
                      },
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
