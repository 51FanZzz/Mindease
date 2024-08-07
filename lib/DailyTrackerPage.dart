import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DailyTrackerPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tracker'),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Text('Tracker page'),
      ),
    );
  }

}