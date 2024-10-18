import 'package:flutter/material.dart';
import 'package:mindease_app/SocialInfoPage.dart';
import 'package:mindease_app/main.dart';
import 'package:mindease_app/styles.dart';
import 'package:provider/provider.dart';



class MainSocial extends StatefulWidget{
  @override
  _MainSocialState createState() => _MainSocialState();
}

class _MainSocialState extends State<MainSocial>{
 int _selectedPageIndex = 1; // Info page become the initial page

 final List<Widget> _pages = [
    SocialMyBuddyPage(),
    SocialInfoPage(),
    SocialCommunityPage(),
 ];

  @override
  Widget build(BuildContext context){
    return  Scaffold(
      body:Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height:29,
            child: Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton(
                  onPressed: (){ 
                    setState(() {
                      _selectedPageIndex = 0;
                    });
                  }, 
                  style: customButtonStyle(),
                  child: Text('My Buddy', 
                            style: TextStyle(fontSize: 17),),
                  ),

                  SizedBox(width: 10,),

                  ElevatedButton(
                  onPressed: (){
                    setState(() {
                      _selectedPageIndex = 1;
                    });
                  }, 
                  style: customButtonStyle(),
                  child: Text('Info',
                      style: TextStyle(fontSize: 17),),
                  ),

                  SizedBox(width: 10,),

                  ElevatedButton(
                  onPressed: (){
                    setState(() {
                      _selectedPageIndex = 2;
                    });
                  }, 
                  style: customButtonStyle(),
                  child: Text('Community',
                      style: TextStyle(fontSize: 17),),
                  ),
                 ],
               ), 
              ),
            ),
           Expanded(
              child: _pages[_selectedPageIndex],
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
      child: Text('My Buddy', 
      style: TextStyle( color: White)
      ),
    );
  }
  
}

class SocialCommunityPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Community Page',
      style: TextStyle( color: White)
      ),
    );
  }
  
}