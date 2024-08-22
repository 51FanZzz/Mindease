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
              
              _buildRoutineTxt('35', 'minutes you have exercised this week'),
              _buildRoutineTxt('2', '      weeks you have been exercising'),
              SizedBox(height: 16,),
             
          ],
            
          ),
        ),
        ),
    );
  }

}

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
