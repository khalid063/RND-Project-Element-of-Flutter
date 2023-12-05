import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;


class TimeDateScreenTwo extends StatefulWidget {
  const TimeDateScreenTwo({super.key});

  @override
  State<TimeDateScreenTwo> createState() => _TimeDateScreenTwoState();
}

class _TimeDateScreenTwoState extends State<TimeDateScreenTwo> {

  String currentDate = '';
  String currentTime = '';

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

      // Format date and time separately
      final String formattedDate = "${dateTime.year}-${dateTime.month.toString().padLeft(2, '0')}-${dateTime.day.toString().padLeft(2, '0')}";
      final String formattedTime = "${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}:${dateTime.second.toString().padLeft(2, '0')}";

      setState(() {
        currentDate = formattedDate;
        currentTime = formattedTime;
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
          ],
        ),
      ),
    );
  }
}
