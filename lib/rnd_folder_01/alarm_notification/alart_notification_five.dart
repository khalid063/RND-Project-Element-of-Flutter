import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'dart:async';
import 'package:audioplayers/audioplayers.dart';

class AlarmNotificationScreenFive extends StatefulWidget {
  const AlarmNotificationScreenFive({Key? key}) : super(key: key);

  @override
  State<AlarmNotificationScreenFive> createState() => _AlarmNotificationScreenFiveState();
}

class _AlarmNotificationScreenFiveState extends State<AlarmNotificationScreenFive> {

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

  void scheduleNotification() async {
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
    await flutterLocalNotificationsPlugin.showDailyAtTime(
      0,
      'Alarm',
      'Time\'s up!',
      time,
      platformChannelSpecifics,
    );
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
      initialTime: TimeOfDay.now(),
    ).then((value) {
      setState(() {
        _timeOfDay = value!;
      });
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
  //   await player.play(AssetSource.audioPath(audioPath));
  // }

  Future<void> playSound() async {
    dynamic audioPath = "audio/alart_sound_two.wav";
    await player.play(audioPath);
  }

  // Future<void> playSound() async {
  //   dynamic audioPath = "audio/alart_sound_two.wav";
  //   await player.play(audioPath, mode: PlayerMode.FILE);
  // }



  void stopAlarmSound() async {
    if (player != null) {
      await player.stop();
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
              _getTime();
              if(mounted) {
                setState(() {});
              }
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
