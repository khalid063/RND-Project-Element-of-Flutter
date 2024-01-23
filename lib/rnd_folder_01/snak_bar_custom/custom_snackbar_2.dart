import 'package:flutter/material.dart';

class CustomSnackbarTwo extends StatefulWidget {
  @override
  State<CustomSnackbarTwo> createState() => _CustomSnackbarTwoState();
}

class _CustomSnackbarTwoState extends State<CustomSnackbarTwo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your App'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            _successMessage(context, 'Success', 'Flutter Custom Appbar Massage...');
          },
          child: Text('Show Success Message'),
        ),
      ),
    );
  }

  void _successMessage(BuildContext context, String title, String details) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Container(
          padding: EdgeInsets.all(16),
          height: 70,
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: Row(
            children: [
              Icon(Icons.check_circle, color: Colors.white, size: 40),
              SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold)),
                    Spacer(),
                    Text(
                      details,
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
