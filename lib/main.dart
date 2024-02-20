import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:rnd_project_element_of_flutter/rnd_folder_01/castom_data_table_source/data_table_of_make_payment.dart';
import 'package:rnd_project_element_of_flutter/rnd_folder_01/circle_with_fluid/circle_with_fluid_2.dart';
import 'package:rnd_project_element_of_flutter/rnd_folder_01/circle_with_fluid/circle_with_fluid_3.dart';
import 'package:rnd_project_element_of_flutter/rnd_folder_01/cursor_last_text_form_field/corsor_last_text_form_field_2.dart';
import 'package:rnd_project_element_of_flutter/rnd_folder_01/cursor_last_text_form_field/corsor_last_text_form_field_3.dart';
import 'package:rnd_project_element_of_flutter/rnd_folder_01/cursor_last_text_form_field/corsor_last_text_form_field_4.dart';
import 'package:rnd_project_element_of_flutter/rnd_folder_01/cursor_last_text_form_field/cursor_last_text_form_field.dart';
import 'package:rnd_project_element_of_flutter/rnd_folder_01/date_popup/date_popup.dart';
import 'package:rnd_project_element_of_flutter/rnd_folder_01/date_popup/date_popup_2.dart';
import 'package:rnd_project_element_of_flutter/rnd_folder_01/date_popup/date_popup_3.dart';
import 'package:rnd_project_element_of_flutter/rnd_folder_01/dropdown_space_problem/dropdown_space_problem.dart';
import 'package:rnd_project_element_of_flutter/rnd_folder_01/dropdown_space_problem/dropdown_space_problem_2.dart';
import 'package:rnd_project_element_of_flutter/rnd_folder_01/form_validation/form_validation_screen.dart';
import 'package:rnd_project_element_of_flutter/rnd_folder_01/get_x/get_x_3rd_class/get_x_3rd_class.dart';
import 'package:rnd_project_element_of_flutter/rnd_folder_01/get_x/get_x_calculator/my_calculator.dart';
import 'package:rnd_project_element_of_flutter/rnd_folder_01/get_x/get_x_calculator/my_calculator_4.dart';
import 'package:rnd_project_element_of_flutter/rnd_folder_01/get_x/get_x_calculator/my_calculator_5.dart';
import 'package:rnd_project_element_of_flutter/rnd_folder_01/get_x/get_x_calculator/my_counter_3.dart';
import 'package:rnd_project_element_of_flutter/rnd_folder_01/list_as_shared_preference_with_data_table/list_as_shared_preference_4.dart';
import 'package:rnd_project_element_of_flutter/rnd_folder_01/order_sc_visibility_table/order_sc_visibility_table.dart';
import 'package:rnd_project_element_of_flutter/rnd_folder_01/order_sc_visibility_table/order_screen_visibility_container_screen.dart';
import 'package:rnd_project_element_of_flutter/rnd_folder_01/snak_bar_custom/custom_scakbar.dart';
import 'package:rnd_project_element_of_flutter/rnd_folder_01/snak_bar_custom/custom_snackbar_2.dart';
import 'package:rnd_project_element_of_flutter/rnd_folder_01/snak_bar_custom/custom_snackbar_3.dart';
import 'package:rnd_project_element_of_flutter/rnd_folder_01/snak_bar_custom/custom_snackbar_4.dart';
import 'package:rnd_project_element_of_flutter/rnd_folder_01/spacer_use/spacer_use.dart';




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
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'RND Project Element of Flutter - Programming Ninja',
      //home: MyCalculatorFive(),
      home: ListAsSharedPreferenceFour(),
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


