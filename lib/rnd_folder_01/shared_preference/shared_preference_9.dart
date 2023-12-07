import 'package:flutter/material.dart';



class SharedPreferenceNine extends StatelessWidget {
  // Define a variable to store the text value
  final String itemText = "Item One";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Item Display App'),
        ),
        body: Center(
          child: Text(
            'Item: $itemText',
            style: TextStyle(fontSize: 24),
          ),
        ),
      ),
    );
  }
}
