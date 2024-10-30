import 'package:flutter/material.dart';
import 'starterPage_login.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              CircleAvatar(
                radius: 50,
                child: RandomProfilePic(), // Use your asset image here
              ),
              SizedBox(height: 8),
              TextButton(
                onPressed: () {
                  // Add your edit profile image logic here
                },
                child: Text(
                  'Edit profile image',
                  style: TextStyle(color: Colors.blue),
                ),
              ),
              SizedBox(height: 16),
              _buildProfileItem('Name', 'UserName'),
              _buildProfileItem('Username', '@username'),
              _buildProfileItem('OCD Type', 'Contamination\nIntrusive Thoughts\n+ Choose here'),
              _buildProfileItem('Bio', 'A description of this user.'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileItem(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 4),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                value,
                style: TextStyle(color: Colors.white),
              ),
            ),
            Icon(Icons.chevron_right, color: Colors.grey),
          ],
        ),
        Divider(color: Colors.grey),
        SizedBox(height: 16),
      ],
    );
  }
}