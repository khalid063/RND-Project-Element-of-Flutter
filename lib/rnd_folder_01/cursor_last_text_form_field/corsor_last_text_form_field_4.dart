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
  late TextEditingController _controller;
  String totalAmount = "9000";

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: totalAmount);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      moveCursorToEnd();
    });
  }

  void moveCursorToEnd() {
    _controller.selection = TextSelection.fromPosition(TextPosition(offset: _controller.text.length));
  }

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
              controller: _controller,
              decoration: InputDecoration(labelText: 'Enter value'),
              textAlignVertical: TextAlignVertical.bottom,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: moveCursorToEnd,
              child: Text('Move Cursor to End'),
            ),
          ],
        ),
      ),
    );
  }
}
