import 'package:flutter/material.dart';

class CustomSnakbar extends StatefulWidget {
  const CustomSnakbar({super.key});

  @override
  State<CustomSnakbar> createState() => _CustomSnakbarState();
}

class _CustomSnakbarState extends State<CustomSnakbar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      appBar: AppBar(
        title: Text('Custom Snakbar for Massage show'),
        centerTitle: true,
        backgroundColor: Colors.pinkAccent,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            _successMassage(context);
          },
          child: Text('Click to show Massage'),
        ),
      ),
    );
  }

  _successMassage(BuildContext context) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Container(
          padding: EdgeInsets.all(16),
          height: 80,
          decoration: BoxDecoration(
            color: Colors.cyanAccent,
            borderRadius: BorderRadius.all(Radius.circular(10),),
          ),
        )
      ),
    );
  }

}
