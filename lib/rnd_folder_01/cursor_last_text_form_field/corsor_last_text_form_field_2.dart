import 'package:flutter/material.dart';

void main() {
  runApp(CursorLastTextFormFieldTwo());
}

class CursorLastTextFormFieldTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyForm(),
    );
  }
}

class MyForm extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  // Function to move cursor to the end of the TextFormField
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
              textAlignVertical: TextAlignVertical.bottom, // Set this property
            ),
            SizedBox(height: 20),
            // ElevatedButton(
            //   onPressed: moveCursorToEnd, // Call the function when the button is pressed
            //   child: Text('Move Cursor to End'),
            // ),
          ],
        ),
      ),
    );
  }
}
