import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyCalculatorFive extends StatefulWidget {
  const MyCalculatorFive({super.key});

  @override
  State<MyCalculatorFive> createState() => _MyCalculatorFiveState();
}

class _MyCalculatorFiveState extends State<MyCalculatorFive> {

  final CalculationController _calculationController = Get.put(CalculationController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator Five'),
        centerTitle: true,
        backgroundColor: Colors.greenAccent,
      ),
      body: Column(
        //crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 150,),
          Center(child: Text('${_calculationController.numberCounter}', style: TextStyle(fontSize: 50, fontWeight: FontWeight.w900),),),
          SizedBox(height: 100,),
          Row(
            children: [
              SizedBox(width: 30,),
              ElevatedButton(onPressed: (){
                _calculationController.increment();
                // if(mounted){
                //   setState(() {});
                // }
              }, child: Text('Incrment'),),
              Spacer(),
              ElevatedButton(onPressed: (){
                _calculationController.decrement();
                // if(mounted){
                //   setState(() {});
                // }
              }, child: Text('Decrement'),),
              SizedBox(width: 30,),
            ],
          )
        ],
      )
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

// class IncrementAndDecrement extends GetxController {
//   int number = 0;
//
//   void increment () {
//     number++;
//     update();
//   }
//
//   void decrement() {
//     number--;
//     update();
//   }
//
// }
