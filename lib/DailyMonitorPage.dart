import 'package:flutter/material.dart';
import 'package:mindease_app/main.dart';
import 'package:mindease_app/styles.dart';
import 'package:provider/provider.dart';

class DailyMonitorPage extends StatefulWidget {
  @override
  _DailyMonitorPageState createState() => _DailyMonitorPageState();
}

class _DailyMonitorPageState extends State<DailyMonitorPage> {
  String selectedHabit = 'Exercised'; // Default selected habit

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
                color: White,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),
            Container(
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.grey[800], // Dark grey background
                borderRadius: BorderRadius.circular(8.0),
              ),
              height: 200,
              child: CustomPaint(
                painter: GraphPainter(selectedHabit), // Pass the selected habit to the painter
                child: Container(),
              ),
            ),
            SizedBox(height: 16.0),
            // Row for Colored Dots Legends
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildLegendDot(Colors.red, 'Exercised'),
                SizedBox(height: 5),
                _buildLegendDot(Colors.blue, 'Drank 1L water'),
                SizedBox(height: 5),
                _buildLegendDot(Colors.green, 'Meditated'),
                SizedBox(height: 5),
                _buildLegendDot(Colors.white, 'Sleep before 12AM'),
                SizedBox(height: 5),
                _buildLegendDot(Colors.brown, 'Had a lovely day'),
              ],
            ),
            SizedBox(height: 20.0), // Space between dots and button
            // Dark blue button
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Deselect SocialInfoPage and reset the theme to dark
                     Provider.of<MyAppState>(context, listen: false).deselectSocialInfoPage();
                  // Button press action
                },
                style: ElevatedButton.styleFrom(
                 backgroundColor: BlueGrey, // Dark blue color
                  padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: Text(
                  'Record your data here !',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ), // Dark background for the page
    );
  }

  // Function to build the legend with colored dots and label
  Widget _buildLegendDot(Color color, String label) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedHabit = label; // Update the selected habit on tap
        });
      },
      child: Row(
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
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}

// Custom Painter to draw the graph based on selected habit
class GraphPainter extends CustomPainter {
  final String selectedHabit;

  GraphPainter(this.selectedHabit);

  @override
  void paint(Canvas canvas, Size size) {
    Paint linePaint = Paint()
      ..color = Colors.grey
      ..strokeWidth = 2;

    Paint dataPaint = Paint()
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke;

    // Set color based on selected habit
    if (selectedHabit == 'Exercised') {
      dataPaint.color = Colors.red;
    } else if (selectedHabit == 'Drank 1L water') {
      dataPaint.color = Colors.blue;
    } else if (selectedHabit == 'Meditated') {
      dataPaint.color = Colors.green;
    } else if (selectedHabit == 'Sleep before 12AM') {
      dataPaint.color = Colors.white;
    } else if (selectedHabit == 'Had a lovely day') {
      dataPaint.color = Colors.brown;
    }

    // Draw background grid lines (horizontal)
    for (int i = 0; i < 5; i++) {
      double dy = size.height * (i / 4);
      canvas.drawLine(Offset(0, dy), Offset(size.width, dy), linePaint);
    }

    // Placeholder data points for each habit
    Path dataPath = Path();
    if (selectedHabit == 'Exercised') {
      dataPath.moveTo(0, size.height * 0.8);
      dataPath.lineTo(size.width * 0.2, size.height * 0.6);
      dataPath.lineTo(size.width * 0.4, size.height * 0.4);
      dataPath.lineTo(size.width * 0.6, size.height * 0.5);
      dataPath.lineTo(size.width * 0.8, size.height * 0.3);
      dataPath.lineTo(size.width, size.height * 0.6);
    } else if (selectedHabit == 'Drank 1L water') {
      dataPath.moveTo(0, size.height * 0.6);
      dataPath.lineTo(size.width * 0.2, size.height * 0.5);
      dataPath.lineTo(size.width * 0.4, size.height * 0.7);
      dataPath.lineTo(size.width * 0.6, size.height * 0.4);
      dataPath.lineTo(size.width * 0.8, size.height * 0.2);
      dataPath.lineTo(size.width, size.height * 0.4);
    } else if (selectedHabit == 'Meditated') {
      dataPath.moveTo(0, size.height * 0.7);
      dataPath.lineTo(size.width * 0.2, size.height * 0.9);
      dataPath.lineTo(size.width * 0.4, size.height * 0.5);
      dataPath.lineTo(size.width * 0.6, size.height * 0.3);
      dataPath.lineTo(size.width * 0.8, size.height * 0.4);
      dataPath.lineTo(size.width, size.height * 0.6);
    } else if (selectedHabit == 'Sleep before 12AM') {
      dataPath.moveTo(0, size.height * 0.4);
      dataPath.lineTo(size.width * 0.2, size.height * 0.3);
      dataPath.lineTo(size.width * 0.4, size.height * 0.5);
      dataPath.lineTo(size.width * 0.6, size.height * 0.7);
      dataPath.lineTo(size.width * 0.8, size.height * 0.4);
      dataPath.lineTo(size.width, size.height * 0.6);
    } else if (selectedHabit == 'Had a lovely day') {
      dataPath.moveTo(0, size.height * 0.5);
      dataPath.lineTo(size.width * 0.2, size.height * 0.4);
      dataPath.lineTo(size.width * 0.4, size.height * 0.6);
      dataPath.lineTo(size.width * 0.6, size.height * 0.8);
      dataPath.lineTo(size.width * 0.8, size.height * 0.5);
      dataPath.lineTo(size.width, size.height * 0.3);
    }

    // Draw the data line for the selected habit
    canvas.drawPath(dataPath, dataPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true; // Repaint when the selected habit changes
  }
}
