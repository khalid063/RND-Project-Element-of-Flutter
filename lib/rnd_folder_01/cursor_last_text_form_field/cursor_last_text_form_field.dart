import 'package:flutter/material.dart';

void main() {
  runApp(CursorLastTextFormField());
}

class CursorLastTextFormField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyForm(),
    );
  }
}

class MyForm extends StatefulWidget {
  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.text = "6000";
    // Set the cursor to the end of the text
    _controller.selection = TextSelection.fromPosition(TextPosition(offset: _controller.text.length));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cursor Example'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              controller: _controller,
              decoration: InputDecoration(labelText: 'Enter value'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Move the cursor to the end of the text
                _controller.selection = TextSelection.fromPosition(TextPosition(offset: _controller.text.length));
              },
              child: Text('Move Cursor to End'),
            ),
          ],
        ),
      ),
    );
  }
}
