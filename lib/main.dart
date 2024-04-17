import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:rnd_project_element_of_flutter/rnd_folder_01/Digital%20Clock/digital_clock.dart';
import 'package:rnd_project_element_of_flutter/rnd_folder_01/Digital%20Clock/digital_clock_dhaka_and_makka.dart';
import 'package:rnd_project_element_of_flutter/rnd_folder_01/Digital%20Clock/hour_and_minute_makka_time.dart';
import 'package:rnd_project_element_of_flutter/rnd_folder_01/alarm_notification/alarm_nitification.dart';
import 'package:rnd_project_element_of_flutter/rnd_folder_01/alarm_notification/alarm_notification_three.dart';
import 'package:rnd_project_element_of_flutter/rnd_folder_01/alarm_notification/alart_notification_two.dart';
import 'package:rnd_project_element_of_flutter/rnd_folder_01/print_pdf/pdf_design_for_report/print_pdf_4.dart';
import 'package:rnd_project_element_of_flutter/rnd_folder_01/print_pdf/pdf_example_1/print_pdf.dart';
import 'package:rnd_project_element_of_flutter/rnd_folder_01/print_pdf/pdf_example_3/print_pdf_3.dart';




void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const MyApp());
  FlutterNativeSplash.remove();
}

// void main() async {
//   await Future.delayed(const Duration(milliseconds: 500)); // Changed from seconds to milliseconds
//   runApp(const MyApp());
// }

//
// void main() {
//   runApp(const MyApp());
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'RND Project Element of Flutter - Programming Ninja',
      //home: MyCalculatorFive(),
      //home: AlarmNotificationScreen(),
      //home: AlarmNotificationScreenThree(),
      home: AlarmNotificationScreenTwo(),
    );
  }
}







// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});
//
//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(
//       body: Center(
//         child: Text('Home Screen'),
//       ),
//     );
//   }
// }


