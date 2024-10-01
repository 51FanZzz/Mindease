import 'package:flutter/material.dart';
import 'package:ocd_app/styles.dart';

class DailyMonitorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Habit Tracker',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),
            Container(
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.grey[800], // Dark grey background like in the image
                borderRadius: BorderRadius.circular(8.0),
              ),
              height: 200,
              child: CustomPaint(
                painter: GraphPainter(), // This will draw the graph
                child: Container(),
              ),
            ),
            SizedBox(height: 16.0),
            // Row for Colored Dots Legends
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildLegendDot(Colors.red, 'Exercised'),
                SizedBox(height: 5,),
                _buildLegendDot(Colors.blue, 'Drank 1L water'),
                SizedBox(height: 5,),
                _buildLegendDot(Colors.green, 'Meditated'),
              ],
            ),
          ],
        ),
      ),
      backgroundColor: Colors.transparent, // Dark background for the page
    );
  }

  // Function to build the legend with colored dots and label
  Widget _buildLegendDot(Color color, String label) {
    return Row(
      children: [
        Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
        SizedBox(width: 12),
        Text(
          label,
          style: TextStyle(color: White),
        ),
      ],
    );
  }
}

// Custom Painter to draw the graph
class GraphPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint linePaint = Paint()
      ..color = Colors.grey
      ..strokeWidth = 2;

    Paint dataPaint1 = Paint()
      ..color = Colors.red
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke;

    Paint dataPaint2 = Paint()
      ..color = Colors.blue
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke;

    Paint dataPaint3 = Paint()
      ..color = Colors.green
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke;

    // Draw background grid lines (horizontal)
    for (int i = 0; i < 5; i++) {
      double dy = size.height * (i / 4);
      canvas.drawLine(Offset(0, dy), Offset(size.width, dy), linePaint);
    }

    // Placeholder data points (just for illustration)
    Path dataPath1 = Path();
    dataPath1.moveTo(0, size.height * 0.8);
    dataPath1.lineTo(size.width * 0.2, size.height * 0.6);
    dataPath1.lineTo(size.width * 0.4, size.height * 0.4);
    dataPath1.lineTo(size.width * 0.6, size.height * 0.5);
    dataPath1.lineTo(size.width * 0.8, size.height * 0.3);
    dataPath1.lineTo(size.width, size.height * 0.6);

    Path dataPath2 = Path();
    dataPath2.moveTo(0, size.height * 0.6);
    dataPath2.lineTo(size.width * 0.2, size.height * 0.5);
    dataPath2.lineTo(size.width * 0.4, size.height * 0.7);
    dataPath2.lineTo(size.width * 0.6, size.height * 0.4);
    dataPath2.lineTo(size.width * 0.8, size.height * 0.2);
    dataPath2.lineTo(size.width, size.height * 0.4);

    Path dataPath3 = Path();
    dataPath3.moveTo(0, size.height * 0.7);
    dataPath3.lineTo(size.width * 0.2, size.height * 0.9);
    dataPath3.lineTo(size.width * 0.4, size.height * 0.5);
    dataPath3.lineTo(size.width * 0.6, size.height * 0.3);
    dataPath3.lineTo(size.width * 0.8, size.height * 0.4);
    dataPath3.lineTo(size.width, size.height * 0.6);

    // Draw the data lines
    canvas.drawPath(dataPath1, dataPaint1);
    canvas.drawPath(dataPath2, dataPaint2);
    canvas.drawPath(dataPath3, dataPaint3);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
