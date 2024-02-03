

import 'package:flutter/material.dart';


import 'package:flutter/material.dart';


class DatePopupTwo extends StatefulWidget {
  @override
  _DatePopupTwoState createState() => _DatePopupTwoState();
}

class _DatePopupTwoState extends State<DatePopupTwo> {
  TextEditingController _dateContorller = TextEditingController();
  DateTime? _selectedDate;
  
  
  Future<void> _selectDate() async {
    DateTime? _picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2100)
    );

    if (_picked != null){
      setState(() {
        _dateContorller.text = _picked.toString().split(" ")[0];
      });
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
                      controller: _dateContorller,
                      readOnly: true,
                      decoration: InputDecoration(
                        //hintText: 'Pick A Date',
                        //labelText: 'DATE',
                        filled: true,
                        fillColor: Colors.cyanAccent,
                        prefixIcon: Icon(Icons.calendar_today),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue)
                        )
                      ),
                      onTap: () {
                        //_selectDate(context);
                        _selectDate();
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

