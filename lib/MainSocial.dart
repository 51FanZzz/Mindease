import 'package:flutter/material.dart';
import 'package:ocd_app/ButtonStyles.dart';
import 'package:ocd_app/main.dart';

class MainSocial extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return  Center(
      child:Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height:50,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                ElevatedButton(
                  onPressed: (){ 
                    MaterialPageRoute(builder: (context)=> MainSocial(),
                   );
                  }, 
                  style: customButtonStyle(),
                  child: Text('My Buddy'),
                  ),
                  SizedBox(width: normalSizedGap,),
                  ElevatedButton(
                  onPressed: (){
                    // Add Actions
                  }, 
                  style: customButtonStyle(),
                  child: Text('Info'),
                  ),
                  SizedBox(width: normalSizedGap,),
                  ElevatedButton(
                  onPressed: (){
                    // Add Action
                  }, 
                  style: customButtonStyle(),
                  child: Text('Community'),
                  ),
                  SizedBox(width: normalSizedGap,),
                  ElevatedButton(
                  onPressed: (){
                    //Add Action
                  }, 
                  style: customButtonStyle(),
                  child: Text('Mail'), // TODO: Change this main next to the profile pic
                  ),
               ],
            ),
          ),
        ],
       ),
    );

  }
}

class SocialMyBuddyPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Center(
      text(Text('My Buddy')),
    );
  }
  
}
