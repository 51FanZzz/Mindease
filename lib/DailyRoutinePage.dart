import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'styles.dart';

class DailyRoutinePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Black,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Schedule Routines',
                      style: TextStyle(
                        color: White,
                        fontSize: titleFontSize,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    _buildRoutineTxt('35', 'minutes you have exercised this week'),
                    _buildRoutineTxt('2', 'weeks you have been exercising'),
                    SizedBox(height: 16),
                    SizedBox(
                      height: 200,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: List.generate(3, (index) {
                          String imagePath;
                          String title;

                          // Specify image path and title based on index
                          if (index == 0) {
                            imagePath = 'assets/images/RopeJumping.png';
                            title = 'Try 15 mins of rope jumping';
                          } else if (index == 1) {
                            imagePath = 'assets/images/Meditation.png';
                            title = 'Try 10 mins of focused meditation';
                          } else {
                            imagePath = 'assets/images/Yoga.png'; // Your third image path
                            title = 'Try 20 mins of yoga practice'; // Title for the third image
                          }

                          return Padding(
                            padding: EdgeInsets.only(right: 13.0),
                            child: _buildExerciseWidget(index, imagePath, title),
                          );
                        }),
                      ),
                    ),
                  ],
                ),
              ),

              // Task Planner Section
              SizedBox(height: 16), // Add spacing between sections
              Container(
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 75, 75, 75), // Dark grey background
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Task Planner',
                      style: TextStyle(
                        color: White,
                        fontSize: titleFontSize,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    // Add your task planner content here
                    _buildTaskItem('Not go on Social Media for 6 hours', true),
                    _buildTaskItem('Exercise for 30 minutes', false),
                    _buildTaskItem('Meditation session', false),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}






// Widget for Schedule Routines text modification
Widget _buildRoutineTxt(String number, String text) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.baseline,
    textBaseline: TextBaseline.alphabetic,
    children: [
      Text(
        number,
        style: TextStyle(
          color: Orange,
          fontSize: 48.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      SizedBox(width: 5),
      Expanded(
        child: Text(
          text,
          style: TextStyle(
            color: White,
            fontSize: 16,
          ),
        ),
      ),
    ],
  );
}

// Widget for routine exercises
Widget _buildExerciseWidget(int index, String imagePath, String title) {
  Color backgroundColor = index % 2 == 0 ? Colors.lightBlue : Colors.lightGreen;

  return Container(
    width: 150.0, // the width for the square widgets
    height: 170.0,
    decoration: BoxDecoration(
      color: backgroundColor,
      borderRadius: BorderRadius.circular(8.0),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          imagePath,
          width: 130.0,
          height: 140.0,
          fit: BoxFit.cover,
        ),
        SizedBox(height: 8),
        Text(
          title,
          style: TextStyle(color: White, fontSize: 12.0),
          textAlign: TextAlign.center,
        ),
      ],
    ),
  );
}

// Widget for Task Planner items
Widget _buildTaskItem(String taskName, bool isCompleted) {
  return Row(
    children: [
      Icon(
        isCompleted ? Icons.check_circle : Icons.radio_button_unchecked,
        color: isCompleted ? Colors.green : Colors.white,
      ),
      SizedBox(width: 8),
      Expanded(
        child: Text(
          taskName,
          style: TextStyle(
            color: White,
            fontSize: 16.0,
            decoration: isCompleted ? TextDecoration.lineThrough : TextDecoration.none,
          ),
        ),
      ),
    ],
  );
}
