import 'package:flutter/material.dart';
import 'dart:math';

// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Sales Volume App',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: SalesVolumePage(),
//     );
//   }
// }

class SalesVolumePage extends StatefulWidget {
  @override
  _SalesVolumePageState createState() => _SalesVolumePageState();
}

class _SalesVolumePageState extends State<SalesVolumePage> {
  double boxFluidValue = 50; // Change this value to adjust the filled percentage

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sales Volume'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Sales Volume',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey[200],
              ),
              child: Stack(
                children: [
                  Positioned.fill(
                    child: CustomPaint(
                      painter: CirclePainter(
                        percentageFilled: boxFluidValue / 100,
                        color: Colors.green,
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      '${boxFluidValue.toInt()}%',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Slider(
              value: boxFluidValue,
              min: 0,
              max: 100,
              onChanged: (newValue) {
                setState(() {
                  boxFluidValue = newValue;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

class CirclePainter extends CustomPainter {
  final double percentageFilled;
  final Color color;

  CirclePainter({required this.percentageFilled, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 0
      ..style = PaintingStyle.fill;

    canvas.drawArc(
      Rect.fromCircle(center: Offset(size.width / 2, size.height / 2), radius: size.width / 2),
      -1.5 * pi,
      2 * pi * percentageFilled,
      true,
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
