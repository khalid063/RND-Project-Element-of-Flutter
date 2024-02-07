import 'package:flutter/material.dart';
//
// void main() {
//   runApp(MyApp());
// }

class SpacerUseScreen extends StatelessWidget {
  const SpacerUseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Spacer Example'),
        ),
        body: MyStatefulWidget(),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          height: 50,
          width: double.infinity,
          color: Colors.blue,
        ),
        const Spacer(), // This creates a flexible space vertically
        Container(
          height: 500,
          width: double.infinity,
          color: Colors.green,
        ),
        const Spacer(), // Another flexible space
        Container(
          height: 50,
          width: double.infinity,
          color: Colors.red,
        ),
      ],
    );
  }
}
