import 'package:flutter/material.dart';
import 'dart:async';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

class AlarmNotificationScreen extends StatefulWidget {
  const AlarmNotificationScreen({super.key});

  @override
  State<AlarmNotificationScreen> createState() => _AlarmNotificationScreenState();
}

class _AlarmNotificationScreenState extends State<AlarmNotificationScreen> {

  ///---------------------------- All Variables ----------///
  /// show current time variables
  late String _timeString;
  /// Time Picker Variables
  TimeOfDay _timeOfDay = TimeOfDay(hour:00, minute: 00);

  ///---------------------------- initState --------------///
  @override
  void initState() {
    // TODO: implement initState
    _timeString = _formatDateTime(DateTime.now());
    Timer.periodic(Duration(seconds: 1), (Timer t) => _getTime());
    super.initState();
    _getTime(); // Call _getTime() method to initialize _timeString
  }

  ///---------------------------- Function Write area ----///

  ///--- time picker ---///
  void _showTimePicker() {
    showTimePicker(
        context: context,
        initialTime: TimeOfDay.now()
    ).then((value) {
      setState(() {
        _timeOfDay = value!;
      });
    });
  }

  ///--- Digital Local Time Function ---///
  // it will show into the header top part
  void _getTime() {
    final DateTime now = DateTime.now();
    final String formattedTime = _formatDateTime(now);
    setState(() {
      _timeString = formattedTime;
    });
  }

  // String _formatDateTime(DateTime dateTime) {
  //   return '${dateTime.hour}:${dateTime.minute}:${dateTime.second}';
  // }

  String _formatDateTime(DateTime dateTime) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    return '${twoDigits(dateTime.hour)}:${twoDigits(dateTime.minute)}:${twoDigits(dateTime.second)}';
  }



  ///============================ Scaffold Area ==========///
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alarm Notification'),
        centerTitle: true,
        backgroundColor: Colors.cyanAccent,
      ),
      body: Column(
        children: [
          ///--------------- Current Time ---------------///
          Center(
            child: Text(
              _timeString,
              style: TextStyle(
                fontSize: 40,
                color: Colors.pink,
                fontWeight: FontWeight.w600
              ),
            ),
          ),
          ///--------------- Show Picked Time ---------------///
          Container(
            height: 150,
            color: Colors.cyanAccent,
            child: Center(
              child: Text(
                  //'08:12',
                  _timeOfDay.format(context).toString(),
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
            ),
          ),
          ///--------------- Pick Time ---------------///
          const SizedBox(height: 50,),
          ElevatedButton(onPressed: (){
            _showTimePicker();
          }, child: Text('Pick Time'))
        ],
      ),
    );
  }
}

