import 'package:flutter/material.dart';
import 'dart:async';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:intl/intl.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

// Need to "pubSpace.Yaml"
//---------------------------------------
// intl: ^0.17.0
// timezone: ^0.7.0

// need Import
//---------------------------------------
// import 'package:flutter/material.dart';
// import 'dart:async';
// import 'package:intl/intl.dart';
// import 'package:timezone/timezone.dart' as tz;
// import 'package:timezone/data/latest.dart' as tz;


import 'package:flutter/material.dart';
import 'dart:async';
import 'package:intl/intl.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

// void main() {
//   runApp(MaterialApp(
//     home: DigitalClock(),
//   ));
// }

class DigitalClockWithMakkaTime extends StatefulWidget {
  @override
  _DigitalClockWithMakkaTimeState createState() => _DigitalClockWithMakkaTimeState();
}

class _DigitalClockWithMakkaTimeState extends State<DigitalClockWithMakkaTime> {
  ///--- Variables for Time Show ---///
  late String _dhakaTime;
  late String _meccaTime;

  @override
  void initState() {
    tz.initializeTimeZones();
    _updateTimes();
    Timer.periodic(Duration(seconds: 1), (Timer t) => _updateTimes());
    super.initState();
  }

  void _updateTimes() {
    setState(() {
      _dhakaTime = _formatDateTime(DateTime.now(), 'Asia/Dhaka');
      _meccaTime = _formatDateTime(DateTime.now(), 'Asia/Riyadh');
    });
  }

  String _formatDateTime(DateTime dateTime, String timeZone) {
    final tz.Location location = tz.getLocation(timeZone);
    final tz.TZDateTime now = tz.TZDateTime.from(dateTime, location);
    final DateFormat formatter = DateFormat('HH:mm:ss');
    return formatter.format(now);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Digital Clock'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              'Bangladesh Time',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 10),
            Text(
              _dhakaTime ?? 'Loading...',
              style: TextStyle(fontSize: 40),
            ),
            SizedBox(height: 30),
            Text(
              'Makkah Time',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 10),
            Text(
              _meccaTime ?? 'Loading...',
              style: TextStyle(fontSize: 40),
            ),
          ],
        ),
      ),
    );
  }
}



