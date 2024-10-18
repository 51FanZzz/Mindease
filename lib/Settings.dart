import 'package:flutter/material.dart';
import 'package:mindease_app/Profile.dart';
import 'package:mindease_app/main.dart';
import 'package:mindease_app/styles.dart';
import 'package:provider/provider.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<MyAppState>(context);

    return Scaffold(
      backgroundColor: appState.isSocialInfoPageSelected ? LightBlue : Black,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 30),
          _buildTextButton(context, 'Profile', Profile()),
          _buildTextButton(context, 'Common Settings', CommonSettings()),
          _buildTextButton(context, 'Notification Settings', NotificationSettings()),
          _buildTextButton(context, 'Safety & Privacy Settings', SafetyPrivacySettings()),
          _buildTextButton(context, 'Technical Support', TechnicalSupport()),
          _buildTextButton(context, 'FAQ', FAQ()),
          _buildTextButton(context, 'Contact Us', ContactUs()),
        ],
      ),
    );
  }

  Widget _buildTextButton(BuildContext context, String text, Widget page) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextButton(
          onPressed: () {
            Provider.of<MyAppState>(context, listen: false).deselectSocialInfoPage();
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => page),
            );
          },
          child: Text(
            text,
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
        Divider(color: Colors.white),
      ],
    );
  }
}

class CommonSettings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Common Settings'),
      ),
      body: Center(
        child: Text('Common settings page.'),
      ),
    );
  }
}

class NotificationSettings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notification Settings'),
      ),
      body: Center(
        child: Text('Notification settings page.'),
      ),
    );
  }
}

class SafetyPrivacySettings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Safety & Privacy Settings'),
      ),
      body: Center(
        child: Text('Safety & Privacy settings page.'),
      ),
    );
  }
}

class TechnicalSupport extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Technical Support'),
      ),
      body: Center(
        child: Text('Technical support page.'),
      ),
    );
  }
}

class FAQ extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FAQ'),
      ),
      body: Center(
        child: Text('FAQ page.'),
      ),
    );
  }
}

class ContactUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact Us'),
      ),
      body: Center(
        child: Text('Contact Us page.'),
      ),
    );
  }
}