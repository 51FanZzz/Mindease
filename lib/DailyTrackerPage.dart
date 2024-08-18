import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ocd_app/main.dart';

class DailyTrackerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<String> moodImages = [
      'assets/Mood_normal.png',
      'assets/Mood_nervous.png',
      'assets/Mood_stress.png',
      'assets/Mood_cry.png',
    ];

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(8.0), 
            padding: EdgeInsets.symmetric(vertical: 20.0), // the smaller the number the thinner vertically
            decoration: BoxDecoration(
              color: BlueGrey,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Text(
              'Calendar',
              style: TextStyle(
                color: White,
                fontSize: 30.0,
              ),
            ),
          ),
          Container(
            margin:EdgeInsets.symmetric(horizontal: 16.0),
            padding: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: BlueGrey,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Mood',
                style: 
                  TextStyle(
                    color: White,
                    fontSize: 16.0,
                  ),
                ),
                SizedBox(height: normalSizedGap,),
                Center(
                  child: 
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(
                          moodImages.length, (index) {
                            return Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 4.0),
                                child: CircleAvatar(
                                  radius: 30.0,
                                  backgroundImage: AssetImage(moodImages[index]),
                                ),
                              );
                          },),
                      ),
                    ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}