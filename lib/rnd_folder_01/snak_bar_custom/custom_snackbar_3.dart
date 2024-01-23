import 'package:flutter/material.dart';

class CustomSnackbarThree extends StatefulWidget {
  @override
  State<CustomSnackbarThree> createState() => _CustomSnackbarThreeState();
}

class _CustomSnackbarThreeState extends State<CustomSnackbarThree> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your App'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            if (context != null) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: SuccessMessage(title: 'Success', details: 'Details message'),
                ),
              );
            }
          },
          child: Text('Show Success Message'),
        ),
      ),
    );
  }




}


class SuccessMessage extends StatelessWidget {
  final String title;
  final String details;

  const SuccessMessage({Key? key, required this.title, required this.details}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SnackBar(
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
    );
  }
}

// To use it in your code:
// SuccessMessage(title: 'Your Title', details: 'Your Details');

