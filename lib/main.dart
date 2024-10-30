
import 'dart:async'; // Fading animation

import 'package:flutter/material.dart';
import 'styles.dart';
import 'package:provider/provider.dart';
import 'StarterPage_Login.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const title = 'Mindease';

    return ChangeNotifierProvider(
      create: (_) => MyAppState(),
      child: Consumer<MyAppState>( // Consumer is for dynamically change of theme
        builder: (context, appState, child) {
          return MaterialApp(
            title: title,


        theme: appState.isSocialInfoPageSelected
        ? ThemeData.light().copyWith(
          scaffoldBackgroundColor: DarkBlue, // light theme on SocialInfoPage
          appBarTheme: AppBarTheme(
            foregroundColor: White,
            backgroundColor: DarkBlue, // App Bar color for socialInfoPage
          ),
          textTheme: TextTheme(
                      bodyLarge: TextStyle(color: Black), // Set text color 
                      bodyMedium: TextStyle(color: Black), 
                    ),
           elevatedButtonTheme: ElevatedButtonThemeData(
                      style: ElevatedButton.styleFrom(
                        // foregroundColor: White, // Set button text color
                        backgroundColor: DarkBlue, // Set button background color
                      ),
                    ),
                  )

            // When isSocialInfoPage is not selected
                : ThemeData.dark().copyWith(
                  scaffoldBackgroundColor: Black,  // default dark bg color
                  appBarTheme: AppBarTheme(
                    backgroundColor: Black, // AppBar color for other pages other than SocialInfoPage
                  ),
                  textTheme: TextTheme(
                     bodyLarge: TextStyle(color: LightBlue), // Set text color to white in dark mode
                     bodyMedium: TextStyle(color: LightBlue), 
                  ),
                  elevatedButtonTheme: ElevatedButtonThemeData(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: LightBlue,
                        backgroundColor: DarkBlue,
                      ),
                    ),
                ), // <-- Default dark theme for other pages
            home: MyHomePage(),
          );
        },
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
  bool isSocialInfoPageSelected = false;

  void selectSocialInfoPage() {
    isSocialInfoPageSelected = true;
    notifyListeners();
  }

  void deselectSocialInfoPage() {
    isSocialInfoPageSelected = false;
    notifyListeners();
  }
}


class MyHomePage extends StatefulWidget { //Homepage
                                          // manage every interfaces, connect them
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}


class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin{
  late AnimationController _controller;
  late Animation<double> _animation;


  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 5), // Total duration of the animation
      vsync: this,
    );

    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Timer(Duration(seconds: 1), () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const starterPage_login()),
          );
        });
      }
    });

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        // TEXT SETUP
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
                      children:[
                        AnimatedBuilder(
                          animation: _animation, 
                          builder:(context, child){
                            return Opacity(
                              opacity: _animation.value,
                              child: Text('Welcome to MINDEASE !',
                                  textAlign: TextAlign.center,
                                  style:TextStyle( fontSize:45, color: White,),
                                   ),
                              );
                          },
                          
                                  ),

                        SizedBox(height:middleSizedGap),

                        AnimatedBuilder(
                          animation: _animation, 
                          builder:(context, child){
                            return Opacity(
                              opacity: _animation.value,
                              child:  Text('Let us become your support.', 
                                  style: TextStyle( fontSize:20, color: Colors.blueGrey,
                                                    fontStyle: FontStyle.italic, ),
                                  ),
                              );
                          },
                          
                                  ),
                      ],
        ),
      ),
    );
  }
}