import 'package:flutter/material.dart';
import 'package:ocd_app/main.dart';

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