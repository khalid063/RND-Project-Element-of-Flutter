import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:rnd_project_element_of_flutter/rnd_folder_01/dropdown_button/dropdown_button_screen.dart';
import 'package:rnd_project_element_of_flutter/rnd_folder_01/get_x/get_x_calculator/my_calculator_4.dart';
import 'package:rnd_project_element_of_flutter/rnd_folder_01/print_pdf/pdf_example_2/print_pdf_2.dart';
import 'package:rnd_project_element_of_flutter/rnd_folder_01/print_pdf/pdf_example_3/print_pdf_3.dart';
import 'package:rnd_project_element_of_flutter/rnd_folder_01/salse_type_cradit_option_add/sales_type_cradit_option_add.dart';
import 'package:rnd_project_element_of_flutter/rnd_folder_01/salse_type_cradit_option_add/sales_type_cradit_option_add_2.dart';
import 'package:rnd_project_element_of_flutter/rnd_folder_01/shared_preference/list_as_shared_preference/list_as_shared_preference.dart';
import 'package:rnd_project_element_of_flutter/rnd_folder_01/shared_preference/list_as_shared_preference/list_as_shared_preference_2.dart';
import 'package:rnd_project_element_of_flutter/rnd_folder_01/shared_preference/list_as_shared_preference/list_as_shared_preference_3.dart';
import 'package:rnd_project_element_of_flutter/rnd_folder_01/shared_preference/shared_preference_5.dart';
import 'package:rnd_project_element_of_flutter/rnd_folder_01/shared_preference/shared_preference_6.dart';
import 'package:rnd_project_element_of_flutter/rnd_folder_01/shared_preference/shared_preference_7.dart';



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
      //home: SharedPreferenceScreenTwo(),
      //home: AutoSerialNumberCreateTwo(),
      //home: TimeDateScreenThree(),
      //home: PrintPdf(),
      home: ListAsSharedPreferenceThree(),
      //home: SalseTypeCraditOptionAdd2(),
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


