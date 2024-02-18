import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'DropDownButton Example',
//       home: DropDownButtonExample(),
//     );
//   }
// }

class DropDownButtonExampleTwo extends StatefulWidget {
  @override
  _DropDownButtonExampleTwoState createState() => _DropDownButtonExampleTwoState();
}

class _DropDownButtonExampleTwoState extends State<DropDownButtonExampleTwo> {
  String? _selectedCity;
  List<String> _cities = ['Chittogong City', 'Rajshahi City', 'Borishal Big City'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DropDownButton Example'),
      ),
      body: Center(
        child: Container(
          width: _selectedCity == null ? 100 : null, // Set width for the dropdown button
          child: DropdownButton<String>(
            isExpanded: true, // Take full width when expanded
            hint: Text('Select City'), // Hint text
            value: _selectedCity,
            onChanged: (String? newValue) {
              setState(() {
                _selectedCity = newValue;
              });
            },
            items: _cities.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
