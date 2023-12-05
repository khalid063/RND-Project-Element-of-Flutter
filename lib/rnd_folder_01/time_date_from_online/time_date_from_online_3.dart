import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;


class TimeDateScreenThree extends StatefulWidget {
  const TimeDateScreenThree({super.key});

  @override
  State<TimeDateScreenThree> createState() => _TimeDateScreenThreeState();
}

class _TimeDateScreenThreeState extends State<TimeDateScreenThree> {

  String currentDate = '';
  String currentTime = '';
  String formattedDate = '';

  @override
  void initState() {
    super.initState();
    fetchDate();
  }

  Future<void> fetchDate() async {
    final response = await http.get(Uri.parse('http://worldtimeapi.org/api/ip'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      final String datetime = data['datetime'];

      // Parse the datetime string into a DateTime object
      final DateTime dateTime = DateTime.parse(datetime);

      // Format date as "dd-MM-yyyy"
      formattedDate = "${dateTime.day.toString().padLeft(2, '0')}-${dateTime.month.toString().padLeft(2, '0')}-${dateTime.year}";

      setState(() {
        currentDate = formattedDate;
      });
    } else {
      print('Failed to load date: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Auto Date Fetch Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Date:',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              currentDate,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              'Time:',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              currentTime,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              'Formatted Date:',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              currentDate,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
