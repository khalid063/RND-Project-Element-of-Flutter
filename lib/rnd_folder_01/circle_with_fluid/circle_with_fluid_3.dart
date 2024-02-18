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
//       home: SalesVolumePageTwo(),
//     );
//   }
// }

class SalesVolumePageThree extends StatefulWidget {
  @override
  _SalesVolumePageThreeState createState() => _SalesVolumePageThreeState();
}

class _SalesVolumePageThreeState extends State<SalesVolumePageThree> {
  double boxFluidValue = 30; // Change this value to adjust the filled percentage
  Color circleColor = Colors.green; // Static initial color

  @override
  Widget build(BuildContext context) {
    // Move boxFluidValue inside the build method or use setState
    double boxFluidValueLocal = boxFluidValue;

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
                        percentageFilled: boxFluidValueLocal / 100,
                        color: circleColor,
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      '${boxFluidValueLocal.toInt()}%',
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
            ElevatedButton(
              onPressed: () {
                // Simulate fetching data from API
                // Replace this with actual API call in your implementation
                // For demonstration, we are just changing the color
                setState(() {
                  circleColor = Colors.blue; // Update circle color
                });
              },
              child: Text('Fetch Data from API'),
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
