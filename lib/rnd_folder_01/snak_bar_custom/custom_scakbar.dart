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
      backgroundColor: Colors.white70,
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
          height: 70,
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.all(Radius.circular(10),),
          ),
          child: const Row(
            children: [
              Icon(Icons.check_circle, color: Colors.white, size: 40,),
              SizedBox(width: 20,),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Success', style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),),
                    Spacer(),
                    Text(
                      'Flutter Custom Appbar Massage...',
                      style: TextStyle(fontSize: 15, color: Colors.white),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        elevation: 3,
      ),
    );
  }



}
