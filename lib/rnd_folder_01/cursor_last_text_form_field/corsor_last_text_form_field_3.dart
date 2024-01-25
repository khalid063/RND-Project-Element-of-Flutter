import 'package:flutter/material.dart';

// void main() {
//   runApp(CursorLastTextFormFieldThree());
// }

// class CursorLastTextFormFieldThree extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       home: MyForm(),
//     );
//   }
// }

class CursorLastTextFormFieldThree extends StatefulWidget {
  const CursorLastTextFormFieldThree({super.key});

  @override
  _CursorLastTextFormFieldThreeState createState() => _CursorLastTextFormFieldThreeState();
}

class _CursorLastTextFormFieldThreeState extends State<CursorLastTextFormFieldThree> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.text = '9000'; // Set the initial value
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   moveCursorToEnd(); // Move cursor to the end after the widget is built
    // });
  }

  // Function to move cursor to the end of the TextFormField
  // void moveCursorToEnd() {
  //   _controller.selection = TextSelection.fromPosition(TextPosition(offset: _controller.text.length));
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
              controller: _controller,
              decoration: InputDecoration(labelText: 'Enter value'),
              textAlignVertical: TextAlignVertical.bottom, // Set this property
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
