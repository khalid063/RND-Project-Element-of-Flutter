import 'package:flutter/material.dart';

class MyCalculatorFour extends StatefulWidget {
  const MyCalculatorFour({super.key});

  @override
  State<MyCalculatorFour> createState() => _MyCalculatorFourState();
}

class _MyCalculatorFourState extends State<MyCalculatorFour> {


  int number = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Calculator 4.0'),
        centerTitle: true,
        backgroundColor: Colors.pinkAccent,
      ),
      body: Center(
        child: Text('$number', style: TextStyle(fontSize: 50, fontWeight: FontWeight.w900),),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          number++;
          print('Number : $number');
          if(mounted) {
            setState(() {});
          }
        },child: const Icon(Icons.add),
      ),
    );
  }
}
