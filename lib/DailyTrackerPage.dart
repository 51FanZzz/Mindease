import 'package:flutter/material.dart';
import 'styles.dart';

class DailyTrackerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<String> moodImages = [
      'assets/images/Mood_normal.png',
      'assets/images/Mood_nervous.png',
      'assets/images/Mood_stress.png',
      'assets/images/Mood_cry.png',
    ];

    final List<String> weekDays = [
      'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'
    ];

    final List<String> dateNum = [
      '1', '2', '3', '4', '5', '6', '7'
    ];

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.01),
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.03,
                  vertical: screenHeight * 0.01,
                ), // Adjusted based on screen size
                decoration: BoxDecoration(
                  color: Grey,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Jan                             2024',
                      style: TextStyle(
                        color: BlueGrey,
                        fontSize: widgetTitleFontSize * 1.5,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: screenHeight * 0.02,
                      child: Text(
                        '--------------------------------------------------------------',
                        style: TextStyle(
                          color: White,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(weekDays.length, (index) {
                          return GestureDetector(
                            onTap: () {
                              // Handle the click interaction
                            },
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: screenWidth * 0.01),
                              child: Column(
                                children: [
                                  CircleAvatar(
                                    radius: screenWidth * 0.045,
                                    backgroundColor: Grey,
                                    child: Text(
                                      weekDays[index],
                                      style: TextStyle(
                                        color: Black,
                                        fontSize: screenWidth * 0.03,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  SizedBox(height: screenHeight * 0.005),
                                  Text(
                                    dateNum[index],
                                    style: TextStyle(
                                      color: White,
                                      fontSize: screenWidth * 0.045,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.01),
            Container(
              margin: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.01, vertical: screenHeight * 0.01),
              padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.03, vertical: screenHeight * 0.02),
              decoration: BoxDecoration(
                color: BlueGrey,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Mood',
                    style: TextStyle(
                      color: White,
                      fontSize: titleFontSize,
                    ),
                  ),
                  SizedBox(height: normalSizedGap),
                  Center(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(moodImages.length, (index) {
                          return Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: screenWidth * 0.02),
                            child: CircleAvatar(
                              radius: screenWidth * 0.09,
                              backgroundImage: AssetImage(moodImages[index]),
                            ),
                          );
                        }),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: screenHeight * 0.01),
            Container(
              margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.01),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.25,
                    vertical: screenHeight * 0.015,
                  ),
                  backgroundColor: Blue,
                ),
                child: Text(
                  'Log your mood here',
                  style: TextStyle(
                    fontSize: widgetTitleFontSize,
                    color: White,
                  ),
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.01),
            Container(
              margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.01),
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.3,
                vertical: screenHeight * 0.1,
              ),
              decoration: BoxDecoration(
                color: Orange,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Mood Chart',
                    style: TextStyle(
                      color: White,
                      fontSize: widgetTitleFontSize,
                    ),
                  ),
                  // Add more content for the Mood Chart here
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
