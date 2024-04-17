import 'package:flutter/material.dart';
import 'dart:async';
import 'package:audioplayers/audioplayers.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_svg/flutter_svg.dart';



class AlarmNotificationScreenTwo extends StatefulWidget {
  const AlarmNotificationScreenTwo({Key? key}) : super(key: key);

  @override
  State<AlarmNotificationScreenTwo> createState() => _AlarmNotificationScreenTwoState();
}

class _AlarmNotificationScreenTwoState extends State<AlarmNotificationScreenTwo> {

  //final audioPlayer = AudioPlayer();
  String alarmSoundPath = 'assets/alarms/your_alarm_sound.mp3'; // Replace with your actual path

  final DateTime now = DateTime.now();

  // AudioCache audioCache = AudioCache();
  // AudioPlayer audioPlayer = AudioPlayer();

  final audioCache = AudioCache(); // For loading and caching
  final player = AudioPlayer(); // For playing

  // final PlayAudio = AudioCache();


  late String _timeString;
  TimeOfDay _timeOfDay = TimeOfDay(hour: 0, minute: 0);

  @override
  void initState() {
    super.initState();
    _timeString = _formatDateTime(DateTime.now());
    Timer.periodic(Duration(seconds: 1), (Timer t) => _getTime());
  }

  // void playAlarmSound() async {
  //   await audioPlayer.play(assets/alarm_bell.mp3);
  // }
  // void playAlarmSound() async {
  //   await audioCache.play('assets/alarm_bell.mp3'); // Use string literal for path
  // }


  // void playAlarmSound() async {
  //   // Construct the correct asset path
  //   String alarmSoundPath = 'assets/alarm_bell.mp3'; // Replace with your actual filename
  //
  //   await audioPlayer.play(alarmSoundPath);
  // }

  // void playAlarmSound() {
  //   // Construct the correct asset path
  //   String alarmSoundPath = 'alarm_bell.mp3'; // Replace with your actual filename
  //
  //   audioCache.play(alarmSoundPath);
  // }

  // void playAlarmSound() {
  //   // Construct the correct asset path
  //   String alarmSoundPath = 'assets/alarm_bell.mp3'; // Replace with your actual filename
  //
  //   // Create an instance of UriAudioSource
  //   Uri uri = Uri.parse(alarmSoundPath);
  //   UriAudioSource uriAudioSource = UriAudioSource(uri: uri);
  //
  //   // Use play method of AudioPlayer
  //   audioPlayer.play(uriAudioSource);
  // }



  void scheduleAlarm(DateTime alarmTime) async {
    // Your logic to schedule the alarm (using a Timer, Alarm Service, etc.)
    await Future.delayed(Duration(seconds: alarmTime.difference(DateTime.now()).inSeconds));
    //playAlarmSound();
  }





  // void _getTime() {
  //   final DateTime now = DateTime.now();
  //   final String formattedTime = _formatDateTime(now);
  //   setState(() {
  //     _timeString = formattedTime;
  //   });
  //
  //   // Check if the current time matches the picked time
  //   if (_timeString == _timeOfDay.format(context)) {
  //     _showAlarmPopup();
  //     playAlarmSound();
  //   }
  // }

  // void _getTime() {
  //   print('getTime method is called');
  //   final DateTime now = DateTime.now();
  //   final formattedTime = _formatDateTime(now);
  //   setState(() {
  //     _timeString = formattedTime;
  //   });
  //
  //   // Check if the current time (now) matches the picked time (_timeOfDay)
  //   if (now.hour == _timeOfDay.hour && now.minute == _timeOfDay.minute) {
  //     print('if condition getTime method is called');
  //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Alarm is ringing')));
  //     //_showAlarmPopup();
  //     //playAlarmSound();
  //   }
  // }

  // void _getTime() {
  //   print('getTime method is called');
  //   final DateTime now = DateTime.now();
  //   final formattedTime = _formatDateTime(now);
  //   setState(() {
  //     _timeString = formattedTime;
  //   });
  //
  //   // Check if the current time (now) matches the picked time (_timeOfDay)
  //   if (now.hour == _timeOfDay.hour && now.minute == _timeOfDay.minute) {
  //     print('massage 0091 :if condition getTime method is called');
  //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Alarm is ringing')));
  //     //_showAlarmPopup();
  //     //playAlarmSound();
  //   }
  //   else if (now.hour != _timeOfDay.hour && now.minute != _timeOfDay.minute) {
  //     print('massage 0092 : if condition getTime method is called ');
  //     return;
  //     //ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Alarm is ringing')));
  //     //_showAlarmPopup();
  //     //playAlarmSound();
  //   }
  //
  //
  // }

  // void _getTime() {
  //   print('getTime method is called');
  //   final DateTime now = DateTime.now();
  //
  //   // Check if the second is 01
  //   if (now.second == 1) {
  //     final formattedTime = _formatDateTime(now);
  //     setState(() {
  //       _timeString = formattedTime;
  //     });
  //
  //     // Check if the current time (now) matches the picked time (_timeOfDay)
  //     if (now.hour == _timeOfDay.hour && now.minute == _timeOfDay.minute) {
  //       print('massage 0091 :if condition getTime method is called');
  //       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Alarm is ringing')));
  //       //_showAlarmPopup();
  //       //playAlarmSound();
  //     }
  //   }
  //
  // }

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




  String _formatDateTime(DateTime dateTime) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    String period = (dateTime.hour < 12) ? 'AM' : 'PM';
    int hour = (dateTime.hour > 12) ? dateTime.hour - 12 : dateTime.hour;
    hour = (hour == 0) ? 12 : hour; // Convert 0 to 12 for 12-hour format
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
          title: Text("Alarm"),
          content: Text("Time's up!"),
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
              child: Text("Close"),
            ),
          ],
        );
      },
    );
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
              style: TextStyle(
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
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
            ),
          ),
          SizedBox(height: 50),



          // ElevatedButton(
          //   onPressed: () async {
          //     _showTimePicker();
          //     _getTime();
          //     final PlayerAudio = AudioCache();
          //     await PlayerAudio.play("assets/images/alarm_bell.mp3");
          //     if(mounted) {
          //       setState(() {});
          //     }
          //   },
          //   child: Text('Pick Time'),
          // )


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
            child: Text('Pick Alarm Time'),
          ),
          SizedBox(height: 30,),
          ElevatedButton(onPressed: (){
            playSound();
          }, child: Text('Sound'))

        ],
      ),
    );
  }

  Future<void> playSound() async {
    //String audioPath = "audio/alart_sound_two.wav";
    //String audioPath = "assets/audio/alart_sound_two.wav";
    String audioPath = "audio/alart_sound_two.wav";
    await player.play(AssetSource(audioPath));
  }

  void stopAlarmSound() async {
    if (player != null) {
      await player.stop();
    }
  }

  //
  // void stopAlarmSound() async {
  //   String audioPath = "audio/alart_sound_two.wav";
  //   if (audioPlayer != null) {
  //     await audioPlayer.stop();
  //   }
  //   // await player.stop(AssetSource(audioPath));
  //   //await audioPlayer.stop();
  // }


}

// class Sound {
//   static final AudioPlayer player = AudioPlayer();
//
//   static void playSound(int option){
//     player.audioCache.prefix = 'lib/assets/audio/';
//     player.setPlayerMode(PlayerMode.mediaPlayer);
//     player.play(AssetSource('note$option.wav'), mode: PlayerMode.lowLatency);
//     player.audioCache.clearAll();
//   }
// }

