import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: MyHomePage(),
//     );
//   }
// }

class TwoSharedPreferenceScreen extends StatefulWidget {
  @override
  _TwoSharedPreferenceScreenState createState() => _TwoSharedPreferenceScreenState();
}

class _TwoSharedPreferenceScreenState extends State<TwoSharedPreferenceScreen> {
  final TextEditingController loginDataController = TextEditingController();
  final TextEditingController productOrderDataController = TextEditingController();

  final String spLoginDataKey = "SPLoginData";
  final String spProductOrderDataKey = "SPProductOrderData";

  Future<void> saveToSharedPreferences(String key, String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

  Future<void> clearSharedPreferences(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SharedPreferences Example'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                controller: loginDataController,
                decoration: InputDecoration(labelText: 'Login Data'),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  saveToSharedPreferences(spLoginDataKey, loginDataController.text);
                  // Optionally, clear the text field after saving
                  loginDataController.clear();
                },
                child: Text('Save to SPLoginData'),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  clearSharedPreferences(spLoginDataKey);
                },
                child: Text('Clear SPLoginData'),
              ),
              SizedBox(height: 32),
              TextFormField(
                controller: productOrderDataController,
                decoration: InputDecoration(labelText: 'Product Order Data'),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  saveToSharedPreferences(
                      spProductOrderDataKey, productOrderDataController.text);
                  // Optionally, clear the text field after saving
                  productOrderDataController.clear();
                },
                child: Text('Save to SPProductOrderData'),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  clearSharedPreferences(spProductOrderDataKey);
                },
                child: Text('Clear SPProductOrderData'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
