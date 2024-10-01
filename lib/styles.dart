// ignore_for_file: non_constant_identifier_names
import 'package:flutter/material.dart';
import 'package:ocd_app/main.dart';

TextStyle buttonStyle = TextStyle(fontSize:25, fontWeight:FontWeight.bold);
IconData backbtn = Icons.arrow_back_rounded;

Color Black = Colors.black;
Color White = Colors.white;
Color Blue = const Color.fromARGB(255, 49, 149, 196);
Color LightBlue = Colors.lightBlue;
Color Grey = Colors.grey;
Color BlueGrey = Colors.blueGrey.shade900;
Color Orange = Color.fromARGB(255, 184, 113, 90);


const double normalSizedGap = 20;
const double middleSizedGap = 25;
const double largeSizedGap = 35;
const double widgetTitleFontSize = 17;
const double titleFontSize = 25;


ButtonStyle customButtonStyle(){
  return ElevatedButton.styleFrom(
    foregroundColor: LightBlue, 
    backgroundColor: Colors.transparent, // text color
    elevation: 0,             // no shadow
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(5), // rounded corners
    ),
    padding: EdgeInsets.symmetric(vertical: 4, horizontal: 16),
  );
}



class TextStyles{
  static const TextStyle ralewayRegular = TextStyle(
    fontFamily: 'Raleway',
    fontWeight: FontWeight.w300,
  );
  static const TextStyle ralewayBold = TextStyle(
    fontFamily: 'Raleway',
    fontWeight: FontWeight.bold,
  );
  static const TextStyle ralewayItalic = TextStyle(
    fontFamily: 'Raleway',
    fontStyle: FontStyle.italic,
  );

  static const TextStyle robotoMonoRegular = TextStyle(
    fontFamily: 'RobotoMono',
    fontWeight: FontWeight.normal,
  );
  static const TextStyle robotoMonoBold = TextStyle(
    fontFamily: 'RobotoMono',
    fontWeight: FontWeight.bold,
  );
    static const TextStyle robotoMonoItalic = TextStyle(
    fontFamily: 'RobotoMono',
    fontStyle: FontStyle.italic,
  );
}

