import 'package:flutter/material.dart';
import 'package:rnd_project_element_of_flutter/rnd_folder_01/animate_page_route_transition/animate_page_route_transition.dart';
import 'package:rnd_project_element_of_flutter/rnd_folder_01/castom_data_table_source/custom_data_table.dart';
import 'package:rnd_project_element_of_flutter/rnd_folder_01/castom_data_table_source/custom_data_table_map_static_header.dart';
import 'package:rnd_project_element_of_flutter/rnd_folder_01/castom_data_table_source/custom_data_table_with_map.dart';
import 'package:rnd_project_element_of_flutter/rnd_folder_01/castom_data_table_source/data_table_of_make_payment.dart';
import 'package:rnd_project_element_of_flutter/rnd_folder_01/expendable_container/expandable_container.dart';
import 'package:rnd_project_element_of_flutter/rnd_folder_01/order_sc_visibility_table/order_sc_visibility_table.dart';


import 'package:flutter/material.dart';


import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:rnd_project_element_of_flutter/rnd_folder_01/order_sc_visibility_table/order_screen_visibility_container_screen.dart';
import 'package:rnd_project_element_of_flutter/rnd_folder_01/search/search_by_customer_name.dart';
import 'package:rnd_project_element_of_flutter/rnd_folder_01/text_form_field_only_bottom_line/text_form_field_only_bottom_line.dart';

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
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'RND Project Element of Flutter - Programming Ninja',
      home: SearchByCustomerName(),
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


