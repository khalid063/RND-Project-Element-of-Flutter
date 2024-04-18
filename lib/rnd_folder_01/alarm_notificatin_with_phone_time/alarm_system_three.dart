import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'dart:async';
import 'package:audioplayers/audioplayers.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timezone/browser.dart';
import 'package:timezone/timezone.dart';

class AlarmNotificationScreenThree extends StatefulWidget {
  const AlarmNotificationScreenThree({Key? key}) : super(key: key);

  @override
  State<AlarmNotificationScreenThree> createState() => _AlarmNotificationScreenThreeState();
}

class _AlarmNotificationScreenThreeState extends State<AlarmNotificationScreenThree> {

  final player = AudioPlayer();
  late String _timeString;
  TimeOfDay _timeOfDay = TimeOfDay(hour: 0, minute: 0);
  late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  @override
  void initState() {
    super.initState();
    _timeString = _formatDateTime(DateTime.now());
    Timer.periodic(Duration(seconds: 1), (Timer t) => _getTime());
    initializeNotifications();
    loadAlarmTime(); // Load saved alarm time
  }

  void initializeNotifications() async {
    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    const AndroidInitializationSettings initializationSettingsAndroid =
    AndroidInitializationSettings('app_icon');
    final InitializationSettings initializationSettings =
    InitializationSettings(android: initializationSettingsAndroid);
    await flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: onSelectNotification);
  }

  Future<void> onSelectNotification(String? payload) async {
    if (payload != null) {
      debugPrint('notification payload: $payload');
    }
  }

  Future<void> scheduleNotification() async {
    var time = Time(_timeOfDay.hour, _timeOfDay.minute, 0);
    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
        'alarm_notification_1', 'Alarm', 'Channel for Alarm notifications',
        icon: 'app_icon',
        sound: RawResourceAndroidNotificationSound('alart_sound_two'),
        importance: Importance.max,
        priority: Priority.high,
        playSound: true,
        styleInformation: DefaultStyleInformation(true, true));
    var platformChannelSpecifics = NotificationDetails(android: androidPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.zonedSchedule(
      0,
      'Alarm',
      'Time\'s up!',
      _nextInstanceOfTime(time),
      platformChannelSpecifics,
      androidAllowWhileIdle: true,
      uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
    );
  }

  TZDateTime _nextInstanceOfTime(Time time) {
    final now = TZDateTime.now(local); // Timezone package should be added and configured
    TZDateTime scheduledDate =
    TZDateTime(local, now.year, now.month, now.day, time.hour, time.minute);
    if (scheduledDate.isBefore(now)) {
      scheduledDate = scheduledDate.add(const Duration(days: 1));
    }
    return scheduledDate;
  }

  void _getTime() {
    final DateTime now = DateTime.now();
    final formattedTime = _formatDateTime(now);
    setState(() {
      _timeString = formattedTime;
    });

    if (now.hour == _timeOfDay.hour && now.minute == _timeOfDay.minute && now.second == 1) {
      print('message 0091: if condition getTime method is called');
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Alarm is ringing')));
      playSound();
      scheduleNotification(); // Schedule notification when alarm time matches
    }
  }

  String _formatDateTime(DateTime dateTime) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    String period = (dateTime.hour < 12) ? 'AM' : 'PM';
    int hour = (dateTime.hour > 12) ? dateTime.hour - 12 : dateTime.hour;
    hour = (hour == 0) ? 12 : hour;
    return '${twoDigits(hour)}:${twoDigits(dateTime.minute)}:${twoDigits(dateTime.second)} $period';
  }

  void _showTimePicker() {
    showTimePicker(
      context: context,
      initialTime: _timeOfDay,
    ).then((value) {
      if (value != null) {
        setState(() {
          _timeOfDay = value;
          saveAlarmTime(); // Save the selected alarm time
          scheduleNotification(); // Reschedule notification when alarm time is changed
        });
      }
    });
  }

  void _showAlarmPopup() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Alarm"),
          content: const Text("Time's up!"),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () {
                print("Close button pressed");
                Navigator.of(context).pop();
                stopAlarmSound();
              },
              child: const Text("Close"),
            ),
          ],
        );
      },
    );
  }

  // Future<void> playSound() async {
  //   String audioPath = "audio/alart_sound_two.wav";
  //   Uri uri = Uri.parse(audioPath);
  //   await player.play(uri.toString(), isLocal: true);
  // }

  Future<void> playSound() async {
    String audioPath = "audio/alart_sound_two.wav";
    //await player.play(AssetSource.audioPath(audioPath));
    await player.play(AssetSource(audioPath));
  }

  void stopAlarmSound() async {
    if (player != null) {
      await player.stop();
    }
  }

  Future<void> saveAlarmTime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('alarm_hour', _timeOfDay.hour);
    await prefs.setInt('alarm_minute', _timeOfDay.minute);
  }

  Future<void> loadAlarmTime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? hour = prefs.getInt('alarm_hour');
    int? minute = prefs.getInt('alarm_minute');
    if (hour != null && minute != null) {
      setState(() {
        _timeOfDay = TimeOfDay(hour: hour, minute: minute);
        scheduleNotification(); // Reschedule notification upon app startup
      });
    }
  }

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
          Center(
            child: Text(
              _timeString,
              style: const TextStyle(
                fontSize: 40,
                color: Colors.pink,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Container(
            height: 150,
            color: Colors.cyanAccent,
            child: Center(
              child: Text(
                _timeOfDay.format(context),
                style: const TextStyle(
                  fontSize: 25,
                ),
              ),
            ),
          ),
          const SizedBox(height: 50),
          ElevatedButton(
            onPressed: () async {
              _showTimePicker();
            },
            child: const Text('Pick Alarm Time'),
          ),
          const SizedBox(height: 30,),
          ElevatedButton(onPressed: (){
            playSound();
          }, child: const Text('Sound Start'),),
          SizedBox(height: 30,),
          ElevatedButton(onPressed: (){
            stopAlarmSound();
          }, child: const Text('Sound Off'),),
        ],
      ),
    );
  }
}
