import 'package:flutter/material.dart';

class PreOrderList extends StatefulWidget {
  const PreOrderList({super.key});

  @override
  State<PreOrderList> createState() => _PreOrderListState();
}

class _PreOrderListState extends State<PreOrderList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Pre Order List Screen'),
      ),
    );
  }
}
