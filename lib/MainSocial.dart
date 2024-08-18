import 'package:flutter/material.dart';
import 'package:ocd_app/ButtonStyles.dart';
import 'package:ocd_app/main.dart';


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
            height:50,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                ElevatedButton(
                  onPressed: (){ 
                    setState(() {
                      _selectedPageIndex = 0;
                    });
                  }, 
                  style: customButtonStyle(),
                  child: Text('My Buddy'),
                  ),

                  SizedBox(width: normalSizedGap,),

                  ElevatedButton(
                  onPressed: (){
                    setState(() {
                      _selectedPageIndex = 1;
                    });
                  }, 
                  style: customButtonStyle(),
                  child: Text('Info'),
                  ),

                  SizedBox(width: normalSizedGap,),

                  ElevatedButton(
                  onPressed: (){
                    setState(() {
                      _selectedPageIndex = 2;
                    });
                  }, 
                  style: customButtonStyle(),
                  child: Text('Community'),
                  ),
               ],
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
      child: Text('My Buddy'),
    );
  }
  
}

class SocialInfoPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Info'),
    );
  }
  
}

class SocialCommunityPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('My Buddy'),
    );
  }
  
}
