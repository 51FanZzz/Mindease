
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ocd_app/main.dart';

class DailyTrackerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const double widgetTitleFontSize = 17;
    
    final List<String> moodImages = [
      'assets/images/Mood_normal.png',
      'assets/images/Mood_nervous.png',
      'assets/images/Mood_stress.png',
      'assets/images/Mood_cry.png',
    ];

    final List<String> weekDays = [
      'Mon','Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'
    ];

    final List<String> dateNum = [ 
      '1','2','3','4','5','6','7'
    ];
    

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
           Align(
            alignment: Alignment.topCenter,
            child: Container(
                margin: EdgeInsets.symmetric(horizontal: 4.0, vertical: 8.0), 
                padding: EdgeInsets.symmetric(horizontal:12.0,vertical: 12.0), // the smaller the number the thinner vertically
                decoration: BoxDecoration(
                  color: Grey,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(
                        'Calendar',
                        style: TextStyle(
                          color: White,
                          fontSize: widgetTitleFontSize,
                        ),
                      ),
                    ),
                    SizedBox(height: 4.0,),
                    Text(
                    'June',
                    style: TextStyle(
                      color: White,
                      fontSize: 14.0,
                    ),
                  ),
                  SizedBox(height: 8.0,),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(weekDays.length, (index) {
                        return GestureDetector(
                          onTap: () {
                            // Handle the click interaction of click

                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 4.0),
                            child: Column(
                              children: [
                                CircleAvatar(
                                  radius: 14.0,
                                  backgroundColor: Grey,
                                  child: Text(
                                    dateNum[index],
                                    style: TextStyle(
                                      color: Black,
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                SizedBox(height: 4.0),
                                Text(
                                  weekDays[index],
                                  style: TextStyle(
                                    color: White,
                                    fontSize: 12.0,
                                  ),
                                ),
                             ],
                            ),
                            ),
                        );
                       },
                      )
                     
                    ),
                  )
                  ],
                ),
              ),
             ), 
  
          SizedBox(height: normalSizedGap),
          Container(
            margin:EdgeInsets.symmetric(horizontal: 4.0, vertical: 8.0),
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 16.0),
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
                    fontSize: widgetTitleFontSize,
                  ),
                ),
                SizedBox(height: 10.0,),
                Center(
                  child: 
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(
                          moodImages.length, (index) {
                            return Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 6.0),
                                child: CircleAvatar(
                                  radius: 35.0,
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

    )
      
    );
      
  }
}