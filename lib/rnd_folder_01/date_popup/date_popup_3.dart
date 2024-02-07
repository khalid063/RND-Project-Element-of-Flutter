

import 'package:flutter/material.dart';


import 'package:flutter/material.dart';


class DatePopupThree extends StatefulWidget {
  @override
  _DatePopupThreeState createState() => _DatePopupThreeState();
}

class _DatePopupThreeState extends State<DatePopupThree> {
  TextEditingController _dateController = TextEditingController();
  DateTime? _selectedDate;
  String testDate = '';

  Future<void> _selectDate() async {
    DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2100)
    );

    if (picked != null) {
      setState(() {
        _selectedDate = picked;
        print('Picked Data : $_selectedDate');
        _dateController.text = _selectedDate!.toString().split(" ")[0];
        testDate = _selectedDate!.toString().split(" ")[0];
        print('Picked Data 001 : $testDate');
      });
    }

  }

  void _showSelectedDate() {
    if (_selectedDate != null) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Selected Date'),
            content: Text(_selectedDate!.toString().split(" ")[0]),
            actions: <Widget>[
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _dateController.clear();
                    _selectedDate = null;
                  });
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Date Picker Example'),
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
                  flex: 8,
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
                  flex: 10,
                  child: SizedBox(
                    height: 45,
                    child: TextFormField(
                      controller: _dateController,
                      readOnly: true,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.cyanAccent,
                        prefixIcon: Icon(Icons.calendar_today),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue),
                        ),
                      ),
                      onTap: () {
                        _selectDate();
                      },
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: _showSelectedDate,
              child: Text('Show Date'),
            ),
          ],
        ),
      ),
    );
  }
}


