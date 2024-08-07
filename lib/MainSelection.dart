import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:ocd_app/DailyRoutinePage.dart';
import 'ButtonStyles.dart';
import 'package:ocd_app/DailyTrackerPage.dart';
import 'package:ocd_app/main.dart';
import 'package:ocd_app/Profile.dart';
import 'package:ocd_app/social_selection.dart';
import 'Settings.dart';


// Define your IconData and Colors
IconData menuBtn = Icons.menu_rounded;

class MainSelection extends StatefulWidget {
  @override
  State<MainSelection> createState() => _MainSelection();
}





class _MainSelection extends State<MainSelection> with SingleTickerProviderStateMixin{
  int _selectedIndex = 0; // Track the selected index

  //Define global key to allow drawer to access Scaffold where its located in higher hirecary
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  late TabController _tabController;

  final List<Widget> _pageContents = [
    DailyTrackerPage(), // index = 0 for daily main page
    social_selection(), // index = 1 for social main page
    Settings(),
  ];
  @override
  void initState(){
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }
  @override
  void dispose(){
    _tabController.dispose();
    super.dispose();
  }


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
        title: SizedBox(
          height: 48,
          child: Column( // horizontal scrolllable bar setup
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Text(
            //   'Mindease',
            //   style:TextStyle(fontSize: 24),
            //   ),
              
              if(_selectedIndex == 0)
              TabBar(
                controller: _tabController,
                isScrollable: true,
                tabs: [Tab(text: 'Tracker'),
                   Tab(text: 'Routine Support'),
                   Tab(text: 'Progress Monitor'),
                   Tab(text: 'Entertainment and Relaxation'),
                       ],
                    )       
                ]
          ),
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
          body: _selectedIndex ==0
          ? TabBarView(
            controller: _tabController,
            children: [
              DailyTrackerPage(),
              Center(child: Text('Routine Support Page')),
              Center(child: Text('Progress Monitor Pagelsalsl')),
              Center(child: Text('Entertainment and Relaxation Page')),
                       ],
                    ) : _pageContents[_selectedIndex],
      bottomNavigationBar: Container( // bottom navigation bar setup
        color: Black,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GNav(
            backgroundColor: Black,
            color: Grey,
            activeColor: White,
            tabBackgroundColor: BlueGrey,
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
                
                backgroundImage: AssetImage('assets/profile_pictures.jpg'), // Only able to shuffle from exitsing pic assets now
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
                  // direct to 'MyBuddyPage'
                },
              ),
              ListTile(
                title: Text('Therapy Session'),
                onTap:() {
                  // Direct to therapyPage
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
}







    // Define your page contents for each index
    
class Social_main extends StatelessWidget{
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
                    MaterialPageRoute(builder: (context)=> social_selection(),
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





class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children:<Widget>[
          Builder(
            builder: (
              BuildContext context){
              return TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder:(context)=>Profile()
                    ),
                  );
                },
                child: Text('Profile'),
                );
            },
          ),
          Builder(
            builder: (
              BuildContext context){
              return TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder:(context)=>Settings()
                    ),
                  );
                },
                child: Text('Common Settings'),
                );
               },
            ),
            Builder(
            builder: (
              BuildContext context){
              return TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder:(context)=>NotificationSettings()
                    ),
                  );
                },
                child: Text('Notification Settings'),
                );
               },
            ),
            Builder(
            builder: (
              BuildContext context){
              return TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder:(context)=>SafetyPrivacySettings()
                    ),
                  );
                },
                child: Text('Safety & Privacy Settings'),
                );
               },
            ),
            Builder(
            builder: (
              BuildContext context){
              return TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder:(context)=>TechnicalSupport()
                    ),
                  );
                },
                child: Text('Technical Support'),
                );
               },
            ),
            Builder(
            builder: (
              BuildContext context){
              return TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder:(context)=>FAQ()
                    ),
                  );
                },
                child: Text('FAQ'),
                );
               },
            ),
            Builder(
            builder: (
              BuildContext context){
              return TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder:(context)=>ContactUs()
                    ),
                  );
                },
                child: Text('Contact Us'),
                );
               },
            ),
            
             
            
        ],   
            ),
    );
  }
}