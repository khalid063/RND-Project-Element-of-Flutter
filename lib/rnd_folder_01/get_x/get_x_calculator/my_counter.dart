import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyCounter extends StatefulWidget {
  const MyCounter({super.key});

  @override
  State<MyCounter> createState() => _MyCounterState();
}

class _MyCounterState extends State<MyCounter> {

  ///======================================== All Variables ============================================================///
  RxInt countNumber = 0.obs;

  ///======================================== Scaffold Part ============================================================///
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Counter'),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 150,),

            Obx(() =>
                Text(
                  '$countNumber',
                  style: const TextStyle(
                    fontSize: 40,
                    color: Colors.green,
                  ),
                ),
            ),


          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          countNumber++;
          //setState(() {});
        },child: const Icon(Icons.add),
      ),
    );
  }
}
