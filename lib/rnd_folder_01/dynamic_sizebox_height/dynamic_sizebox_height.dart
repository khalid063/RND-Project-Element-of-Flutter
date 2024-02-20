import 'package:flutter/material.dart';

class YourWidget extends StatefulWidget {
  @override
  _YourWidgetState createState() => _YourWidgetState();
}

class _YourWidgetState extends State<YourWidget> {
  // Variable to hold the selected option
  String selectedOption = "Bank";

  @override
  Widget build(BuildContext context) {
    // Determine the height based on the selected option
    double height = selectedOption == "Cash" ? 340 : 240;

    return Scaffold(
      appBar: AppBar(
        title: Text('Your App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Dropdown to select the option
            DropdownButton<String>(
              value: selectedOption,
              onChanged: (String? newValue) {
                setState(() {
                  selectedOption = newValue!;
                });
              },
              items: <String>['Cash', 'Bank']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            SizedBox(
              height: height,
              child: Container(
                color: Colors.blue, // Just for visualization
                child: Center(
                  child: Text('Your Content Here'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: YourWidget(),
  ));
}




