import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
//           title: Text('Decimal TextFormField Example'),
//         ),
//         body: OrderPlacementScreenNew(),
//       ),
//     );
//   }
// }

class HintStringTwoDigit extends StatefulWidget {
  @override
  _HintStringTwoDigitState createState() => _HintStringTwoDigitState();
}

class _HintStringTwoDigitState extends State<HintStringTwoDigit> {
  TextEditingController _pcsPerUnitTEController = TextEditingController();
  String _selectedItemPecPerUnit = '';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: TextFormField(
          controller: _pcsPerUnitTEController,
          keyboardType: TextInputType.numberWithOptions(decimal: true),
          inputFormatters: [DecimalTextInputFormatter(decimalRange: 2)],
          decoration: InputDecoration(
            hintText: formatHintText(_selectedItemPecPerUnit),
            hintStyle: const TextStyle(color: Colors.black),
          ),
          onChanged: (value) {
            setState(() {
              _selectedItemPecPerUnit = value;
            });
            ratePerUnitCalculation();
          },
        ),
      ),
    );
  }

  String formatHintText(String text) {
    if (text.isEmpty) {
      return '0.00';
    } else {
      double? value = double.tryParse(text);
      if (value != null) {
        return value.toStringAsFixed(2);
      } else {
        return text;
      }
    }
  }

  void ratePerUnitCalculation() {
    // Your rate per unit calculation logic goes here
  }
}

class DecimalTextInputFormatter extends TextInputFormatter {
  DecimalTextInputFormatter({required this.decimalRange}) : assert(decimalRange == null || decimalRange > 0);

  final int decimalRange;

  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.isEmpty) {
      return newValue.copyWith(text: '0.00');
    } else if (decimalRange != null) {
      final RegExp regExp = RegExp(r'^\d{1,8}(\.\d{0,$decimalRange})?');
      String newText = regExp.stringMatch(newValue.text) ?? '0.00';
      return TextEditingValue(
        text: newText,
        selection: TextSelection.collapsed(offset: newText.length),
      );
    }
    return newValue;
  }
}
