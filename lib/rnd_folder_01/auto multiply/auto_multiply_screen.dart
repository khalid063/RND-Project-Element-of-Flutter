import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Quantity Calculator'),
//         ),
//         body: QuantityCalculator(),
//       ),
//     );
//   }
// }

class QuantityCalculator extends StatefulWidget {
  @override
  _QuantityCalculatorState createState() => _QuantityCalculatorState();
}

class _QuantityCalculatorState extends State<QuantityCalculator> {
  TextEditingController quantityController = TextEditingController();
  double pcsPerUnit = 2;
  double ratePerPcs = 0;
  double totalPrice = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: quantityController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Quantity'),
              onChanged: (value) {
                calculateValues();
              },
            ),
            SizedBox(height: 16),
            Text('Pcs Per Unit: $pcsPerUnit'),
            SizedBox(height: 8),
            Text('Rate per pcs: $ratePerPcs'),
            SizedBox(height: 8),
            Text('Total Price: $totalPrice'),
          ],
        ),
      ),
    );
  }

  void calculateValues() {
    setState(() {
      int quantity = int.tryParse(quantityController.text) ?? 0;
      ratePerPcs = pcsPerUnit * quantity;
      totalPrice = ratePerPcs * quantity;
    });
  }


}
