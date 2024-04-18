import 'package:flutter/material.dart';
import 'dart:async';
import 'package:audioplayers/audioplayers.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_svg/flutter_svg.dart';

///--- packeg should be used into pubSpace.yaml---///
// timezone: ^0.7.0
// alarm: ^3.0.14 // not need into hare
// audioplayers: ^1.2.0



class AlarmNotificationScreenFour extends StatefulWidget {
  const AlarmNotificationScreenFour({Key? key}) : super(key: key);

  @override
  State<AlarmNotificationScreenFour> createState() => _AlarmNotificationScreenFourState();
}

class _AlarmNotificationScreenFourState extends State<AlarmNotificationScreenFour> {

  ///=============================== all variables =============================///

  ///--- Object of AudioPlayer ---///
  final player = AudioPlayer(); // For playing

  ///--- Today time ---///
  late String _timeString;
  TimeOfDay _timeOfDay = TimeOfDay(hour: 0, minute: 0);


  ///=============================== initState =================================///
  @override
  void initState() {
    super.initState();
    _timeString = _formatDateTime(DateTime.now());
    Timer.periodic(Duration(seconds: 1), (Timer t) => _getTime());
  }

  ///=============================== Function Write Area =======================///

  ///--- get time for pick time for Alarm ---///
  void _getTime() {
    final DateTime now = DateTime.now();
    final formattedTime = _formatDateTime(now);
    setState(() {
      _timeString = formattedTime;
    });

    // Check if the current time (now) matches the picked time (_timeOfDay)
    if (now.hour == _timeOfDay.hour && now.minute == _timeOfDay.minute && now.second == 1) {
      print('massage 0091 :if condition getTime method is called');
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Alarm is ringing')));
      _showAlarmPopup();
      playSound();
      //playAlarmSound();
    }
  }

  ///--- Formated Time for Alarm ---///
  String _formatDateTime(DateTime dateTime) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    String period = (dateTime.hour < 12) ? 'AM' : 'PM';
    int hour = (dateTime.hour > 12) ? dateTime.hour - 12 : dateTime.hour;
    hour = (hour == 0) ? 12 : hour; // Convert 0 to 12 for 12-hour format
    return '${twoDigits(hour)}:${twoDigits(dateTime.minute)}:${twoDigits(dateTime.second)} $period';
  }


  ///--- Pick time for alarm ---///
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

  ///--- popup for alarm off ---///
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
                //stopAlarmSound();
                // Close the popup
                // Navigator.of(context).pop();
                // You can implement your alarm off logic here
              },
              child: const Text("Close"),
            ),
          ],
        );
      },
    );
  }

  ///--- Player Sound Start Function ---///
  Future<void> playSound() async {
    //String audioPath = "audio/alart_sound_two.wav";
    //String audioPath = "assets/audio/alart_sound_two.wav";
    String audioPath = "audio/alart_sound_two.wav";
    await player.play(AssetSource(audioPath));
  }

  ///--- Player Sound Off Function ---///
  void stopAlarmSound() async {
    if (player != null) {
      await player.stop();
    }
  }

  ///=============================== Scaffold Area =============================///
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

          ///============================== Pick Time ==========================///
          ElevatedButton(
            onPressed: () async {
              // ...
              _showTimePicker();
              _getTime();
              if(mounted) {
                setState(() {});
              }
            },
            //child: SvgPicture.asset('assets/images/eye_hide_icon.svg'),
            //child: SvgPicture.asset('assets/images/eye_hide_icon.svg'),
            child: const Text('Pick Alarm Time'),
          ),
          const SizedBox(height: 30,),

          ///============================= sound Start Button ==================///
          ElevatedButton(onPressed: (){
            playSound();
          }, child: const Text('Sound Start'),),
          SizedBox(height: 30,),

          ///============================= sound Off Button ==================///
          ElevatedButton(onPressed: (){
            stopAlarmSound();
          }, child: const Text('Sound Off'),),

        ],
      ),
    );
  }

}


