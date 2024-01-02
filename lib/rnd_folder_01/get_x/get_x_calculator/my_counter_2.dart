

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyCounterTwo extends StatefulWidget {
  const MyCounterTwo({super.key});

  @override
  State<MyCounterTwo> createState() => _MyCounterTwoState();
}

class _MyCounterTwoState extends State<MyCounterTwo> {

  final CalculationController _calculationController = Get.put(CalculationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Counter 2.1'),
        backgroundColor: Colors.pink,
        centerTitle: true,
      ),
      body: Center(
        child: GetBuilder<CalculationController>(
          builder: (_) {
            return Text(
              '${_calculationController.numberCounter}',
              style: const TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.w900,
              ),
            );
          }
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          _calculationController.increment();
        },child: Icon(Icons.add),
      ),
    );
  }
}

class CalculationController extends GetxController {
  int numberCounter = 0;

  void increment() {
    numberCounter++;
    update();
  }

}
