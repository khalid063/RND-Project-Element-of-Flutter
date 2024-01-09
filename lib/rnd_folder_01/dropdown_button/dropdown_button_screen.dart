import 'package:flutter/material.dart';

class DropdownButtonScreen extends StatefulWidget {
  const DropdownButtonScreen({super.key});

  @override
  State<DropdownButtonScreen> createState() => _DropdownButtonScreenState();
}

class _DropdownButtonScreenState extends State<DropdownButtonScreen> {

  String areaSelectedValue = 'Area 1'; // Default selected value
  List<String> areas = ['Area 1', 'Area 2', 'Area 3', 'Area 4'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dropdown Button Two'),
        centerTitle: true,
        backgroundColor: Colors.greenAccent,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //Text('Selected Value: $areaSelectedValue'),
          SizedBox(height: 20),
          DropdownButton<String>(
            value: areaSelectedValue,
            onChanged: (String? newValue) {
              setState(() {
                areaSelectedValue = newValue!;

              });
            },
            items: areas.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
