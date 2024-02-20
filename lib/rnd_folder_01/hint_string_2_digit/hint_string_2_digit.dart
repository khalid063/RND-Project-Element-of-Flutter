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


///--- *** (Very Important) Function of Rate Per Unit Calculation (  SetupRate() function value * user given Pcs Per Unit Value ) ---///
// double ratePerUnitCalculationValeAfterUserInput = 0.0;
// void ratePerUnitCalculation() {
//   // Calculate setup rate
//   //double setupRate = SetupRate();
//   // Convert string value to double for _selectedItemPecPerUnit
//   double selectedItemPecPerUnit = double.tryParse(_selectedItemPecPerUnit) ?? 0.0;
//
//   // Perform the multiplication
//   //double result = selectedItemPecPerUnit * returnSetupResult;
//   //ratePerUnitCalculationValeAfterUserInput = selectedItemPecPerUnit * returnSetupResult;
//
///   double _temporaryPrice = selectedItemPecPerUnit * returnSetupResult;
///   ratePerUnitCalculationValeAfterUserInput = double.parse(_temporaryPrice.toStringAsFixed(2)); // For only show 2 digit after ( . )
//
//
//   // Update the TextEditingController with the calculated value
//   _ratePerPcsTEController.text = ratePerUnitCalculationValeAfterUserInput.toString();
//   _selectedItemRatePerPcs = ratePerUnitCalculationValeAfterUserInput.toString(); // Adding for make Calculation Of "calculateValuesOfPrice()" Function
//   // Show into Select Item Form "Price" Field
//
//   _selectedItemRatePerPcsDoubleValue = double.parse(_selectedItemRatePerPcs);  // For add data into "Custome Data Table"
//
//
//   print('Setup Rate: $returnSetupResult');
//   print('Selected Item Pcs Per Unit by User : $selectedItemPecPerUnit');
//   print('Final calculation result: $ratePerUnitCalculationValeAfterUserInput');
//
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
