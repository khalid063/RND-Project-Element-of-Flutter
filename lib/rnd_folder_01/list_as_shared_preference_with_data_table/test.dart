import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Hallow World two"),
          backgroundColor: Colors.deepOrange, // Add a spooky color
        ),
        body: Center(
          child: Text(
            "Hallow World!",
            style: TextStyle(
              fontSize: 30.0,
              color: Colors.purple, // Another spooky color
            ),
          ),
        ),
      ),
    );
  }
}
