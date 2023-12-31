import 'package:flutter/material.dart';

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

class HintVariableValueShowScreen extends StatefulWidget {
  @override
  _HintVariableValueShowScreenState createState() => _HintVariableValueShowScreenState();
}

class _HintVariableValueShowScreenState extends State<HintVariableValueShowScreen> {
  // Variable to hold the hint text
  String hintText = 'Enter your text';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Variable Hint Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // TextFormField with a dynamic hint
            TextFormField(
              decoration: InputDecoration(
                hintText: hintText,
              ),
            ),
            SizedBox(height: 16.0),
            // Button to change the hint dynamically
            ElevatedButton(
              onPressed: () {
                // Change the hint text when the button is pressed
                setState(() {
                  hintText = 'New hint text';
                });
              },
              child: Text('Change Hint'),
            ),
          ],
        ),
      ),
    );
  }
}
