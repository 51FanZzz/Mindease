import 'package:flutter/material.dart';

class Settings extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Settings page.'),
      ),
    );
  }}



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