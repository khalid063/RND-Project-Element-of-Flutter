import 'package:flutter/material.dart';

class MyCalculatorFour extends StatefulWidget {
  const MyCalculatorFour({super.key});

  @override
  State<MyCalculatorFour> createState() => _MyCalculatorFourState();
}

class _MyCalculatorFourState extends State<MyCalculatorFour> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MyCalculator 4'),
        centerTitle: true,
        backgroundColor: Colors.greenAccent
      ),
    );
  }
}
