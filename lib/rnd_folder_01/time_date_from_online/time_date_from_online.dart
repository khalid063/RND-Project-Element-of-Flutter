import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;


class TimeDateScreen extends StatefulWidget {
  const TimeDateScreen({super.key});

  @override
  State<TimeDateScreen> createState() => _TimeDateScreenState();
}

class _TimeDateScreenState extends State<TimeDateScreen> {

  String currentDate = '';

  @override
  void initState() {
    super.initState();
    fetchDate();
  }

  Future<void> fetchDate() async {
    final response = await http.get(Uri.parse('http://worldtimeapi.org/api/ip'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      print(response.body);
      final String date = data['datetime'];
      setState(() {
        currentDate = date;
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
            SizedBox(height: 10),
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
