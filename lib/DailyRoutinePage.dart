import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ocd_app/DailyEntertainmentPage.dart';
import 'main.dart';

class DailyRoutinePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: 
        Container(
          padding: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Black,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max, // Minimize the size of the container to its elements
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Schedule Routines', style: TextStyle(color: White, fontSize: titleFontSize, fontWeight: FontWeight.bold),
                 ),

              SizedBox(height: 8,),

              _buildRoutineTxt('35', 'minutes you have exercised this week'),
              _buildRoutineTxt('2', '      weeks you have been exercising'),

              SizedBox(height: 16,),

              // ignore: sized_box_for_whitespace
              Container(
                height: 140,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: 
                  List.generate(2, (index) {
                    return Padding(
                      padding: EdgeInsets.only(right: 8.0),
                      child: _buildExerciseWidget(
                        index, 
                        index == 0 
                        ? 'assets/images/RopeJumping.png' 
                        :'assets/images/Meditation.png',
                        index == 1 
                        ? 'Try 15 mins of rope jumping' 
                        :'Try 10 mins of focused meditation',
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
          
      ),
        
    ),
  );
}

}








// Convinent widget class for Schedule Routines text modifying
Widget _buildRoutineTxt(String number, String text){
  return Row(
    crossAxisAlignment: CrossAxisAlignment.baseline,
    textBaseline: TextBaseline.alphabetic,
    children: [
      Text(
        number,
          style: TextStyle(color: Orange, fontSize: 48.0, fontWeight: FontWeight.bold),
          ),
          SizedBox(width: 5,),
      Expanded(
        child:
          Text(text,style: 
           TextStyle(color: White, fontSize: 16,),
            ),
       ),
    ],
  );
}

// Convinent widget class for routine exercises
Widget _buildExerciseWidget(int index, String imagePath, String title){
  Color backgroundColor = index % 2 == 0 ? Colors.lightBlue : Colors.lightGreen;

  return Container(
    width: 120.0, // the width for the square widgets
    decoration: BoxDecoration(
      color: backgroundColor,
      borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center ,
        children: [
          Image.asset(
            imagePath,
            width: 70.0,
            height: 70.0,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 8,),
          Text(
            title,
            style: TextStyle(
              color:White, fontSize: 5.0
            ),
            textAlign: TextAlign.center,

          ),
        ],
        ),
  );
}
