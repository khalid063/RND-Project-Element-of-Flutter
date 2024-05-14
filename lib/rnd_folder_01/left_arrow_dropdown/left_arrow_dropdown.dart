import 'package:flutter/material.dart';

// void main() {
//   runApp(LeftArrowDropDownScreen());
// }

class LeftArrowDropDownScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Dropdown Button Example'),
        ),
        body: Center(
          child: DropdownButton<String>(
            icon: Icon(Icons.arrow_drop_down), // Icon on the left side
            iconSize: 24,
            elevation: 16,
            style: const TextStyle(color: Colors.deepPurple),
            underline: null, // Removes the underline
            onChanged: (String? newValue) {
              // Add your onChanged logic here
            },
            items: <String>['Item 1', 'Item 2', 'Item 3', 'Item 4']
                .map<DropdownMenuItem<String>>((String value) {
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
