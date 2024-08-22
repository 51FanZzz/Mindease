
import 'dart:async'; // Fading animation

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'StarterPage_Login.dart';


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

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const title = 'Mindease';

    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: title,
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: LightBlue,
                                            brightness: Brightness.dark),
        ),
        home: MyHomePage(),
          ),
        );
  }
}

class MyAppState extends ChangeNotifier { // app state management class
    
}

class MyHomePage extends StatefulWidget { //Homepage
                                          // manage every interfaces, connect them
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}


class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin{
  double _opacity = 0.0;

  @override
  void initState(){  // it calls _startAnimation() to kick off the animation sequence as soon as the state is initialized
    super.initState();
    _startAnimation();
  }

  void _startAnimation(){
    Timer(Duration(seconds: 1), () { // a timer that waits for 1 second before executing the inner block of code
      setState(() { 
        _opacity = 1.0; } // making the first widget to fade in after 1s delay
      );
      Timer(Duration(seconds: 2), () {  //waiting for 2 seconds before the next block of code executes
        setState(() {
          _opacity = 0.0; // 1st widget fade out after 2s delay 
      });
      Timer(Duration(seconds: 1), (() {
        setState(() {
          _opacity = 1.0;
        });



          Timer(Duration(seconds: 1), () { 
            Navigator.push(
              context,
              MaterialPageRoute(builder:(context) => const starterPage_login()),
            );
          });



        })
       );
       });
     });

  }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        // TEXT SETUP
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
                      children:[
                        AnimatedOpacity(opacity: _opacity, 
                          duration: Duration(seconds:2),
                          child: Text('Welcome to MINDEASE !',
                                  textAlign: TextAlign.center,
                                  style:TextStyle( fontSize:45, color: White,),
                                   ),
                                  ),

                        SizedBox(height:middleSizedGap),

                        AnimatedOpacity(opacity: _opacity, 
                           duration: Duration(seconds: 1),
                           child:  Text('Let us become your support.', 
                                  style: TextStyle( fontSize:20, color: Colors.blueGrey,
                                                    fontStyle: FontStyle.italic, ),
                                  ),
                        )


                       ,
                      ],
        ),
      ),
    );
  }
}