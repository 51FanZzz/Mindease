import 'dart:js';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:ocd_app/daily_tracker.dart';
import 'package:ocd_app/main.dart';
import 'package:ocd_app/profile.dart';
import 'package:ocd_app/social_info.dart';


// Define your IconData and Colors
IconData menuBtn = Icons.menu_rounded;

class DailySection extends StatefulWidget {
  @override
  State<DailySection> createState() => _DailySectionState();
}

class _DailySectionState extends State<DailySection> {
  int _selectedIndex = 0; // Track the selected index

  //Define global key to allow drawer to access Scaffold where its located in higher hirecary
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(menuBtn),
          onPressed: () {
           _scaffoldKey.currentState?.openDrawer();
          },
        ),
        title: Column( // horizontal scrolllable bar setup
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Mindease',
              style:TextStyle(fontSize: 24),
              ),
            ],
          ),
        actions: [ // top title content setup
          IconButton(
            onPressed: (){
               Navigator.push( 
                context, 
                MaterialPageRoute(
                  builder: (context) => Profile() 
                 ), 
              ); 
            }, 
            icon: Icon(Icons.account_circle),
            ),
        ],
      ),
       // Show the content based on selected index
      body: _pageContents[_selectedIndex],

      bottomNavigationBar: Container( // bottom navigation bar setup
        color: Black,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GNav(
            backgroundColor: Black,
            color: Grey,
            activeColor: White,
            tabBackgroundColor: Colors.blueGrey.shade900,
            gap: 30, // the gap between the icon and the text
            onTabChange: (index) {
              setState(() {
                _selectedIndex = index; // Update the selected index
              }
             );
            },
            padding: EdgeInsets.all(16),
            tabs: const [
              GButton(
                icon: Icons.sunny,
                text: 'Daily',
              ),
              GButton(
                icon: Icons.mail_rounded,
                text: 'Social',
              ),
              GButton(
                icon: Icons.settings_applications_rounded,
                text: 'Settings',
              ),
            ],
          ),
        ),
      ),
      drawer: Drawer(
        child: SafeArea(
          child:Column(
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountName: Text('User Name'), // TODO: should be able to change as user change their profile on another page
                accountEmail: Text(' '),
              currentAccountPicture: CircleAvatar(
                
                backgroundImage: AssetImage('assets/profile_pictures.jpg'),
              ),
             ),
              Expanded(
              child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              ListTile(
                title: Text('Profile Settings'),
                onTap:() {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                  builder: (context) => Profile(),
                   ),
                  );
                },
              ),
              SizedBox(height: largeSizedGap),
              ListTile(
                title: Text('Notification'),
                onTap:() {
                  // Direct to Settings?
                },
              ),
              ListTile(
                title: Text('Favourite'),
                onTap:() {
                  // Direct to 
                },
              ),
              ListTile(
                title: Text('My Buddy'),
                onTap:() {
                  // direct to 'SocialPage_myBuddy'
                },
              ),
              ListTile(
                title: Text('Therapy Session'),
                onTap:() {
                  // Direct to therapy page
                },
              ),
              SizedBox(height: largeSizedGap),
              ListTile(
                title: Text('Contact us !'),
                onTap:() {
                  // Direct to Contact page?
                },
              ),

            // Add more lists of items here
             ],
            ),
           ),
          ],
        ),
       ),
      ),
    );
  }




    // Define your page contents for each index
  final List<Widget> _pageContents = [
    // Widgets for index 0 (Daily)
    Center(
      child:Column(
        children: [
          SizedBox(
            height:30,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                ElevatedButton(
                  onPressed: (){
                    MaterialPageRoute(builder: (context)=> daily_tracker(),
                   );
                  }, 
                  child: Text('Tracker'),
                  ),
                  ElevatedButton(
                  onPressed: (){}, 
                  child: Text('Routine Support'),
                  ),
                  ElevatedButton(
                  onPressed: (){}, 
                  child: Text('Progress Monitor'),
                  ),
                  ElevatedButton(
                  onPressed: (){}, 
                  child: Text('Entertainment and Relaxation'),
                  ),
               ],
            ),
          ),
        ],
       ),
    ),
    // Widgets for Social
    Center(
      child:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height:30,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                TextButton(
                  onPressed: (){ 
                    MaterialPageRoute(builder: (context)=> social_info(),
                   );
                  }, 
                  child: Text('Info'),
                  ),
                  SizedBox(width: normalSizedGap,),
                  TextButton(
                  onPressed: (){

                  }, 
                  child: Text('My Buddy'),
                  ),
                  SizedBox(width: normalSizedGap,),
                  TextButton(
                  onPressed: (){

                  }, 
                  child: Text('Community'),
                  ),
                  SizedBox(width: normalSizedGap,),
                  TextButton(
                  onPressed: (){

                  }, 
                  child: Text('Mail'), // TODO: Change this main next to the profile pic
                  ),
               ],
            ),
          ),
        ],
       ),
    ),

    // Widgets for Settings tab
    Center(
      child: Column(
        children:<Widget>[
         TextButton(
          onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(
              builder: (context)=> Profile(), // TODO: navigate to profile page( dont work??)
            ),
            );
            
          },
          child: Text('Profile'),
         ),
         SizedBox(height: middleSizedGap,),

         TextButton(
          onPressed: (){
            
          },
          child: Text('Common Settings'),
         ),
         SizedBox(height: normalSizedGap,),

         TextButton(
          onPressed:(){
            MaterialPageRoute(
              
              );
          },
           child: Text('Notifications'),
           ),
           SizedBox(height: normalSizedGap,),


        ],
      ),
    ),
  ];


  

}
