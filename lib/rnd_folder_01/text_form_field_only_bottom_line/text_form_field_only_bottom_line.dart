import 'package:flutter/material.dart';

class TextFormFieldOnlyBottomLine extends StatefulWidget {
  const TextFormFieldOnlyBottomLine({super.key});

  @override
  State<TextFormFieldOnlyBottomLine> createState() => _TextFormFieldOnlyBottomLineState();
}

class _TextFormFieldOnlyBottomLineState extends State<TextFormFieldOnlyBottomLine> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
          child: TextFormField(
            textAlign: TextAlign.end, // Align the cursor to the right
            decoration: InputDecoration(
              //labelText: 'Enter text',
              contentPadding: EdgeInsets.only(right: 10),
              hintText: 'Enter Bank Name',
              labelStyle: TextStyle(color: Colors.red), // Optional: Customize label color
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.red, width: 0.3),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.red, width: 0.3),
              ),
            ),
          ),
        ),
      ),
    );
  }
}



