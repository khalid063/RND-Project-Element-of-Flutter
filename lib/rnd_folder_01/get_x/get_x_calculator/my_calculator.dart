import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyCalculator extends StatefulWidget {
  const MyCalculator({super.key});

  @override
  State<MyCalculator> createState() => _MyCalculatorState();
}

class _MyCalculatorState extends State<MyCalculator> {


  final TextEditingController _inputNumber1TEController = TextEditingController();
  final TextEditingController _inputNumber2TEController = TextEditingController();

  final CalculatonController _calculatonController = Get.put(CalculatonController());

  double firstNumber = 0.0;
  double secondNumber = 0.0;

  @override
  Widget build(BuildContext context) {

    ///---------- Not working ----------///
    // firstNumber = double.parse(_inputNumber1TEController.text.toString());
    // print('First Number : $firstNumber');
    // secondNumber = double.parse(_inputNumber1TEController.text.toString());
    // print('Second Number : $secondNumber');


    // Validate and set firstNumber
    // try {
    //   firstNumber = double.parse(_inputNumber1TEController.text);
    // } catch (e) {
    //   // Handle invalid input (e.g., show an error message)
    //   print("Invalid input for firstNumber");
    //   // You might want to set a default value or show an error to the user
    // }
    //
    // // Validate and set secondNumber
    // try {
    //   secondNumber = double.parse(_inputNumber2TEController.text);
    // } catch (e) {
    //   // Handle invalid input (e.g., show an error message)
    //   print("Invalid input for secondNumber");
    //   // You might want to set a default value or show an error to the user
    // }

    ///---------------------------------------- Data insert Function into variables ----------------------------------------------------------------------///
    void dataInsert() {
      try {
        firstNumber = double.parse(_inputNumber1TEController.text);
      } catch (e) {
        // Handle invalid input (e.g., show an error message)
        print("Invalid input for firstNumber");
        // You might want to set a default value or show an error to the user
      }

      // Validate and set secondNumber
      try {
        secondNumber = double.parse(_inputNumber2TEController.text);
      } catch (e) {
        // Handle invalid input (e.g., show an error message)
        print("Invalid input for secondNumber");
        // You might want to set a default value or show an error to the user
      }
    }


    return Scaffold(
      appBar: AppBar(
        title: const Text('My Calculator'),
        centerTitle: true,
        backgroundColor: Colors.pinkAccent,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 20,),
              GetBuilder<CalculatonController>(
                builder: (_) {
                  return Text(
                    '${_calculatonController.result}',
                    style: TextStyle(fontSize: 50, fontWeight: FontWeight.w900),
                  );
                }
              ),
              const SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  controller:  _inputNumber1TEController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'Enter One Ingeger'
                  ),
                ),
              ),
              const SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  controller: _inputNumber2TEController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      hintText: 'Enter One Ingeger'
                  ),
                ),
              ),
              const SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(onPressed: (){
                      dataInsert();
                      _calculatonController.addition(firstNumber, secondNumber);
                      print('Add button is Clicked');
                      setState(() {});
                      // _inputNumber1TEController.clear();
                      // _inputNumber2TEController.clear();
                    }, child: const Text('+'),),
                    const SizedBox(width: 10,),
                    ElevatedButton(onPressed: (){
                      dataInsert();
                      _calculatonController.subtraction(firstNumber, secondNumber);
                      print('Add button is Clicked');
                      setState(() {});
                      // _inputNumber1TEController.clear();
                      // _inputNumber2TEController.clear();
                    }, child: const Text('-'),),
                    const SizedBox(width: 10,),
                    ElevatedButton(onPressed: (){
                      dataInsert();
                      _calculatonController.multiplication(firstNumber, secondNumber);
                      print('Add button is Clicked');
                      setState(() {});
                      // _inputNumber1TEController.clear();
                      // _inputNumber2TEController.clear();
                    }, child: const Text('*'),),
                    const SizedBox(width: 10,),
                    ElevatedButton(onPressed: (){
                      dataInsert();
                      _calculatonController.division(firstNumber, secondNumber);
                      print('Add button is Clicked');
                      setState(() {});
                      // _inputNumber1TEController.clear();
                      // _inputNumber2TEController.clear();
                    }, child: const Text('/'),),
                  ],
                ),
              ),
              SizedBox(height: 30,),
            ],
          ),
        ),
      ),
    );
  }
}

class CalculatonController extends GetxController {
  double numberOne = 0;
  double numberTwo = 0;
  double result = 0;

  double addition(double a, double b) {
    result = a + b;
    return result;
  }

  double subtraction(double a, double b) {
    result = a - b;
    return result;
  }

  double multiplication(double a, double b) {
    result = a * b;
    return result;
  }

  double division(double a, double b) {
    result = a / b;
    return result;
  }

}
