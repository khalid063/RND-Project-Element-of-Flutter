import 'package:flutter/material.dart';
import 'dart:async';
import 'package:intl/intl.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Digital Clock Example',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: DigitalClockWithMakkaTimeThree(),
//     );
//   }
// }

class DigitalClockWithMakkaTimeThree extends StatefulWidget {
  @override
  _DigitalClockWithMakkaTimeThreeState createState() =>
      _DigitalClockWithMakkaTimeThreeState();
}

class _DigitalClockWithMakkaTimeThreeState extends State<DigitalClockWithMakkaTimeThree> {


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
      _dhakaTime = _formatDateTimeHourMinute(DateTime.now(), 'Asia/Dhaka');
      _meccaTime = _formatDateTimeHourMinute(DateTime.now(), 'Asia/Riyadh');
    });
  }

  String _formatDateTimeHourMinute(DateTime dateTime, String timeZone) {
    final tz.Location location = tz.getLocation(timeZone);
    final tz.TZDateTime now = tz.TZDateTime.from(dateTime, location);
    final DateFormat formatter = DateFormat('hh:mm a');
    return formatter.format(now);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Digital Clock Example'),
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
