// import 'package:english_words/english_words.dart';
// import 'package:flutter/gestures.dart';

// ignore_for_file: unused_import

import 'package:flutter/material.dart';

import 'package:ocd_app/starterPage_login.dart';
import 'package:ocd_app/introduction_page.dart';
import 'package:ocd_app/main.dart';


class StarterPage_Selection extends StatelessWidget { //Handle mainly for the starterpage setup
  const StarterPage_Selection({super.key});

  @override
  Widget build(BuildContext context){
    return  Scaffold(
      appBar: AppBar(
        title: const Text ('Back to Login'),
        leading: IconButton(
                icon: Icon(backbtn),
                onPressed: (){ 
                  Navigator.pop(context);
                 },
             ),
      ),
      body: Center(
        // TEXT SETUP
        child:Column(mainAxisAlignment: MainAxisAlignment.center,
                      children:[
                        Stack(
                          children: <Widget> [
                              Text(' Are you currently experiencing Obsessive-Compulsive Disorder(OCD) sympotoms?' ,
                              textAlign: TextAlign.center,
                                 style:TextStyle( fontSize:27,
                                                  color: Colors.white,
                                 ),
                            ),
                          ],
                       ),  

                        SizedBox(height:largeSizedGap),

        //BUTTON SETUP
        Row(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed:(){ 
                Navigator.push( context, 
                                MaterialPageRoute(builder: (context) => const IntroductionPage() 
                                ), 
                                ); 
                                },  
                child: Text('YES', style: buttonStyle), 
                             ),
            SizedBox(height:normalSizedGap),
            ElevatedButton(onPressed:(){
              Navigator.push(context, 
                           MaterialPageRoute(builder: (context)=> const IntroductionPage() 
                           ),
                          ); 
                        },
            child: Text('NOT SURE', style: buttonStyle),
           ),
          ],
        ),
                      ]
     )
     )
    );
  }
}
