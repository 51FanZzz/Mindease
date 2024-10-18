import 'package:flutter/material.dart';
import 'package:mindease_app/main.dart';
import 'package:provider/provider.dart';
import 'styles.dart';

class SocialInfoPage extends StatefulWidget{
  @override
  _SocialInfoPageState createState() => _SocialInfoPageState();
}


class _SocialInfoPageState extends State<SocialInfoPage> {
  int _selectedPage = 0;

   Widget _getPageIndex(){
    if(_selectedPage == 0 ){
      return SocialVideo();
    }else if(_selectedPage == 1){
      return SocialArticle();
    } else{
      return Center(
        child: Text('Select an option'),
        );
      }
    }

  @override
  Widget build(BuildContext context) {
    // Define a custom theme just for the SocialInfoPage
    final ThemeData socialTheme = ThemeData.light().copyWith(
      scaffoldBackgroundColor: LightBlue, // Light background
      textTheme: TextTheme(
        bodyLarge: TextStyle(color: Black), // Text color
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: DarkBlue, // Button background color
          foregroundColor: White, // Button text color
        ),
      ),
    );

    return Theme(
      data: socialTheme, // Apply the custom theme to the page
      child: Scaffold(

        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    

                    setState(() {
                      _selectedPage = 0; // ==> Videos page
                    });

                  },
                  child: Text(
                    'Videos',
                    style: TextStyle(color: White, fontSize: 16), // Ensure consistent font style
                  ),
                ),
                SizedBox(width: 8), // Add spacing between the buttons
                TextButton(
                  onPressed: () {
                   

                    setState(() {
                      _selectedPage = 1; // ==> Articles page
                    });

                  },
                  child: Text(
                    'Articles',
                    style: TextStyle(color: White, fontSize: 16), // Ensure consistent font style
                  ),
                ),
              ],
            ),
            SizedBox(height: 8), // Add spacing between the buttons and the content

            Expanded(
              child: Center(
                child: _getPageIndex(),
                ),
            ),
          ],
            )
      ),
        );
  }
}

class SocialVideo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Videos page'),
      ),
    );
  }
}

class SocialArticle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Articles page'),
      ),
    );
  }
}