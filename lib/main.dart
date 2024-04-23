// import 'package:english_words/english_words.dart';
// import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'StarterPage_Login.dart';
//import 'package:google_fonts/google_fonts.dart';


TextStyle buttonStyle = TextStyle(fontSize:25, fontWeight:FontWeight.bold);
IconData backbtn = Icons.arrow_back_rounded;

Color Black = Colors.black;
Color White = Colors.white;
Color LightBlue = Colors.lightBlue;
Color Grey = Colors.grey;



const double normalSizedGap = 20;
const double middleSizedGap = 25;
const double largeSizedGap = 35;

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

class _MyHomePageState extends State<MyHomePage> {

  // var selectedIndex = 0; // use this to switch between pages

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        // TEXT SETUP
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
                      children:[
                        Stack(
                          children: <Widget> [
                            Text('Welcome to MINDEASE !' ,
                                textAlign: TextAlign.center,
                                 style:TextStyle( fontSize:45, color: White, ),
                                   ),
                          ],
                       ),  

                        SizedBox(height:middleSizedGap),
                        Text('Let us become your support.', 
                                  style: TextStyle( fontSize:20, color: Colors.blueGrey,
                                                    fontStyle: FontStyle.italic, ),
                                  ),
        //BUTTON SETUP
          ElevatedButton(onPressed:(){
                                   Navigator.push(context, 
                                                          MaterialPageRoute(builder: (context) => const StarterPage_Login()),
                                                          );
                                          },
          child: Text('START', style:buttonStyle), 
                         )
                      ]
     )
     )
    );
  }
}
