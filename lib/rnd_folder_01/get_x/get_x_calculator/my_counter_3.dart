import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyCounterThree extends StatefulWidget {
  const MyCounterThree({super.key});

  @override
  State<MyCounterThree> createState() => _MyCounterThreeState();
}

class _MyCounterThreeState extends State<MyCounterThree> {

  final CalculationController _calculationController = Get.put(CalculationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Counter 3'),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GetBuilder<CalculationController>(
              builder: (_) {
                return Text(
                  '${_calculationController.numberCounter}',
                  style: const TextStyle(fontSize: 50, fontWeight: FontWeight.w900),
                );
              }
            ),
            const SizedBox(height: 50,),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      _calculationController.increment();
                    },
                    child: const Text('Increment One'),
                  ),
                  const Spacer(),
                  ElevatedButton(
                    onPressed: () {
                      _calculationController.decrement();
                    },
                    child: const Text('Decrement One'),
                  ),
                ],
              ),
            )
          ],
        ),
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

  void decrement() {
    numberCounter--;
    update();
  }

}
