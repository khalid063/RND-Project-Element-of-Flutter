import 'package:flutter/material.dart';
import 'package:flutter/material.dart';


import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:rnd_project_element_of_flutter/rnd_folder_01/auto_serial_number_create/auto_serial_number_create.dart';
import 'package:rnd_project_element_of_flutter/rnd_folder_01/auto_serial_number_create/auto_serial_number_create_2.dart';
import 'package:rnd_project_element_of_flutter/rnd_folder_01/auto_serial_number_create/auto_serial_number_created_3.dart';
import 'package:rnd_project_element_of_flutter/rnd_folder_01/order_sc_visibility_table/order_screen_visibility_container_screen.dart';
import 'package:rnd_project_element_of_flutter/rnd_folder_01/search/search_by_customer_name.dart';
import 'package:rnd_project_element_of_flutter/rnd_folder_01/search_of_product/product_list.dart';
import 'package:rnd_project_element_of_flutter/rnd_folder_01/search_of_product/product_list_2.dart';
import 'package:rnd_project_element_of_flutter/rnd_folder_01/search_of_product/product_list_3.dart';
import 'package:rnd_project_element_of_flutter/rnd_folder_01/search_of_product/product_list_4.dart';
import 'package:rnd_project_element_of_flutter/rnd_folder_01/search_of_product/product_list_5.dart';


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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'RND Project Element of Flutter - Programming Ninja',
      //home: SharedPreferenceScreenTwo(),
      //home: AutoSerialNumberCreateTwo(),
      //home: TimeDateScreenThree(),
      home: ProductListScreenFive(),
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


