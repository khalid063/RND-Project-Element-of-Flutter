import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:rnd_project_element_of_flutter/rnd_folder_01/get_x/get_x_calculator/my_counter.dart';
import 'package:rnd_project_element_of_flutter/rnd_folder_01/get_x/get_x_calculator/my_counter_2.dart';



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
      //home: SharedPreferenceScreenTwo(),
      //home: AutoSerialNumberCreateTwo(),
      //home: TimeDateScreenThree(),
      home: MyCounterTwo(),
      //home: SharedPreferenceSix(),
      //home: OrderScVesibilityTable(),
      //home: CustomDataTableWithMapStaticHeader(),
      //home: ExpandableContainerScreen(),
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


