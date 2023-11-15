import 'package:flutter/material.dart';
import 'package:rnd_project_element_of_flutter/rnd_folder_01/castom_data_table_source/custom_data_table.dart';
import 'package:rnd_project_element_of_flutter/rnd_folder_01/castom_data_table_source/custom_data_table_map_static_header.dart';
import 'package:rnd_project_element_of_flutter/rnd_folder_01/castom_data_table_source/custom_data_table_with_map.dart';
import 'package:rnd_project_element_of_flutter/rnd_folder_01/expendable_container/expandable_container.dart';
import 'package:rnd_project_element_of_flutter/rnd_folder_01/order_sc_visibility_table/order_sc_visibility_table.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'RND Project Element of Flutter - Programming Ninja',
      home: OrderScVesibilityTable(),
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


