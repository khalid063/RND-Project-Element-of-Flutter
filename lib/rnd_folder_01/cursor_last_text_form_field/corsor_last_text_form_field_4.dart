import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: MyForm(),
//     );
//   }
// }

class CursorLastTextFormFieldFour extends StatefulWidget {
  @override
  _CursorLastTextFormFieldFourState createState() => _CursorLastTextFormFieldFourState();
}

class _CursorLastTextFormFieldFourState extends State<CursorLastTextFormFieldFour> {
  ///---------- Step 1
  late TextEditingController _controller;
  String totalAmount = "9000";

  ///---------- Step 2
  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: totalAmount);
    /// or use this -> _paidAmountTEController.text = _totalAmount.toString();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      moveCursorToEnd();
    });
  }

  ///---------- Step 2
  void moveCursorToEnd() {
    _controller.selection = TextSelection.fromPosition(TextPosition(offset: _controller.text.length));
  }

  // _paidAmountTEController.text = _totalAmount.toString();
  //
  // as like example :
  //
  // void calculateTotalAmount(){
  //   // Total Price Calculation of Header Information of Order Placement
  //   _totalAmount = 0.0;
  //
  //   for (var order in SavedOrderListOfConfirmOrder) {
  //     if (order['totalPrice'] != null) {
  //       _totalAmount += order['totalPrice'];
  //     }
  //   }
  //   if (salseTypeselectedItem == 'Cash') {
  //     paidAmount = _totalAmount;
  //     //_paidAmountTEController = TextEditingController(text: _totalAmount.toString());
  ///     _paidAmountTEController.text = _totalAmount.toString();
  //   }
  //   print('Calculation Total Acount Function is Called');
  //   print('Saved order List Data 303 : $SavedOrderListOfConfirmOrder');
  //   print('Total Amount After Calculation 8734 : $_totalAmount');
  //   // Update the UI
  //   setState(() {});
  // }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cursor Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              controller: _controller,      ///---------- Step 2
              decoration: InputDecoration(labelText: 'Enter value'),
              textAlignVertical: TextAlignVertical.bottom,
            ),
            SizedBox(height: 20),
            // ElevatedButton(
            //   onPressed: moveCursorToEnd,
            //   child: Text('Move Cursor to End'),
            // ),
          ],
        ),
      ),
    );
  }
}


