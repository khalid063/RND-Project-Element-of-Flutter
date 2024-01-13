import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyCalculatorFour extends StatefulWidget {
  const MyCalculatorFour({super.key});

  @override
  State<MyCalculatorFour> createState() => _MyCalculatorFourState();
}

class _MyCalculatorFourState extends State<MyCalculatorFour> {

  //int countNumber = 0;
  final CalculationController _calculationController = Get.put(CalculationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Calculator Four'),
        centerTitle: true,
        backgroundColor: Colors.pinkAccent,
      ),
      body: Center(
        child: Column(
          children: [
            GetBuilder<CalculationController>(
                builder: (_) {
                  return Text('${_calculationController.countNumber}', style: TextStyle(fontSize: 50, fontWeight: FontWeight.w900),);
                }
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                  onPressed: () {
                    _calculationController.increment();
                  },
                  child: Text('Increment'),
                ),
              ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                  onPressed: () {
                    _calculationController.decrment();
                  },
                  child: Text('Drecrement'),
                ),
              ),
              ],
            )
          ],
        )
      ),
    );
  }
}

class CalculationController extends GetxController {
  int countNumber = 0;

  void increment() {
    countNumber++;
    update();
  }

  void decrment() {
    countNumber--;
    update();
  }

}

