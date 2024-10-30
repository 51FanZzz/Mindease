import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'DailyMonitorPage.dart';
import 'DailyRoutinePage.dart';
import 'MainSocial.dart';
import 'DailyTrackerPage.dart';
import 'main.dart';
import 'package:provider/provider.dart';
import 'styles.dart';
import 'Profile.dart';
import 'starterPage_login.dart';
import 'Settings.dart';

IconData menuBtn = Icons.menu_rounded;

class MainSelection extends StatefulWidget {
  @override
  State<MainSelection> createState() => _MainSelection();
}

class _MainSelection extends State<MainSelection>
    with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  late TabController _tabController;

  final List<Widget> _pageContents = [
    DailyTrackerPage(),
    MainSocial(),
    Settings(),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _updateThemeBasedOnPage(int index) {
    final appState = Provider.of<MyAppState>(context, listen: false);
    if (index == 1) {
      appState.selectSocialInfoPage();
    } else {
      appState.deselectSocialInfoPage();
    }
  }

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<MyAppState>(context);

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: appState.isSocialInfoPageSelected ? DarkBlue : Black,
      appBar: AppBar(
        backgroundColor: appState.isSocialInfoPageSelected ? DarkBlue : Black,
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(menuBtn),
            color: White,
            onPressed: () {
              _scaffoldKey.currentState?.openDrawer();
            },
          ),
        ),
        title: Text(
          'Mindease',
          style: TextStyle(fontSize: 24, color: White),
        ),
        actions: [
          IconButton(
            onPressed: () async {
              appState.deselectSocialInfoPage();
              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Profile()
                  ),
              );
              // Update the theme based on the current page when returning
              _updateThemeBasedOnPage(_selectedIndex);
            },
            icon: Icon(Icons.person),
            color: White,
          ),
        ],
        bottom: _selectedIndex == 0
            ? PreferredSize(
                preferredSize: Size.fromHeight(24.0),
                child: TabBar(
                  controller: _tabController,
                  isScrollable: true,
                  tabs: [
                    Tab(text: 'Tracker'),
                    Tab(text: 'Routine Support'),
                    Tab(text: 'Progress Monitor'),
                  ],
                ),
              )
            : null,
      ),
      body: _selectedIndex == 0
          ? TabBarView(
              controller: _tabController,
              children: [
                DailyTrackerPage(),
                DailyRoutinePage(),
                DailyMonitorPage(),
              ],
            )
          : _pageContents[_selectedIndex],
      bottomNavigationBar: Container(
        color: appState.isSocialInfoPageSelected ? DarkBlue : Black,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GNav(
            backgroundColor: appState.isSocialInfoPageSelected ? DarkBlue : Black,
            color: Grey,
            activeColor: White,
            tabBackgroundColor: BlueGrey,
            gap: 30,
            onTabChange: (index) {
              setState(() {
                _selectedIndex = index;
                _updateThemeBasedOnPage(index);
              });
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
          child: Column(
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountName: Text(
                  'User Name',
                  style: TextStyle(
                    color: White,
                    fontSize: widgetTitleFontSize,
                  ),
                ),
                accountEmail: Text(''),
                currentAccountPicture: CircleAvatar(
                  child: RandomProfilePic(),
                ),
                decoration: BoxDecoration(
                  color: Black,
                ),
              ),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: <Widget>[
                    ListTile(
                      title: Text('Profile Settings'),
                      onTap: () {
                        appState.deselectSocialInfoPage();
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Profile()),
                        ).then((value) => _updateThemeBasedOnPage(_selectedIndex));
                      },
                    ),
                    SizedBox(height: largeSizedGap),
                    ListTile(
                      title: Text('Notification'),
                      onTap: () {
                        // Direct to Settings?
                      },
                    ),
                    ListTile(
                      title: Text('Favourite'),
                      onTap: () {
                        // Direct to Favourite
                      },
                    ),
                    ListTile(
                      title: Text('My Buddy'),
                      onTap: () {
                        // Direct to 'MyBuddyPage'
                      },
                    ),
                    ListTile(
                      title: Text('Therapy Session'),
                      onTap: () {
                        // Direct to therapyPage
                      },
                    ),
                    SizedBox(height: largeSizedGap),
                    ListTile(
                      title: Text('Contact us!'),
                      onTap: () {
                        // Direct to Contact page?
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      onDrawerChanged: (isOpen) {
        if (!isOpen) {
          _updateThemeBasedOnPage(_selectedIndex);
        }
      },
    );
  }
}