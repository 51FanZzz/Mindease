import 'dart:async';
import 'package:flutter/material.dart';

import 'SocialInfoPage.dart';
import 'styles.dart';

class MainSocial extends StatefulWidget {
  @override
  _MainSocialState createState() => _MainSocialState();
}

class _MainSocialState extends State<MainSocial> {
  int _selectedPageIndex = 1;

  final List<Widget> _pages = [
    SocialMyBuddyPage(),
    SocialInfoPage(),
    SocialCommunityPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 29,
            child: Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _selectedPageIndex = 0;
                      });
                    },
                    style: customButtonStyle(),
                    child: Text('My Buddy', style: TextStyle(fontSize: 17)),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _selectedPageIndex = 1;
                      });
                    },
                    style: customButtonStyle(),
                    child: Text('Info', style: TextStyle(fontSize: 17)),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _selectedPageIndex = 2;
                      });
                    },
                    style: customButtonStyle(),
                    child: Text('Community', style: TextStyle(fontSize: 17)),
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

class SocialMyBuddyPage extends StatefulWidget {
  @override
  _SocialMyBuddyPageState createState() => _SocialMyBuddyPageState();
}

class _SocialMyBuddyPageState extends State<SocialMyBuddyPage> {
  bool _isAvatarVisible = true;
  bool _chatInterfaceVisible = false;
  int _blinkCount = 0;
  final TextEditingController _messageController = TextEditingController();
  Timer? _timer;

  final List<Map<String, dynamic>> messages = [
    {'text': 'Hi, it is nice to meet you!', 'isSentByUser': true, 'timestamp': '9:35 AM'},
    {'text': 'Hi! Great to see you here. May I know your name?', 'isSentByUser': false, 'timestamp': '9:36 AM'},
  ];

  @override
  void initState() {
    super.initState();
    _startBlinking();
  }

  void _startBlinking() {
    _timer = Timer.periodic(Duration(milliseconds: 500), (timer) {
      setState(() {
        _isAvatarVisible = !_isAvatarVisible;
        _blinkCount++;
      });

      if (_blinkCount >= 6) {
        timer.cancel();
        setState(() {
          _chatInterfaceVisible = true;
        });
      }
    });
  }

  void _sendMessage() {
    if (_messageController.text.trim().isNotEmpty) {
      setState(() {
        messages.add({
          'text': _messageController.text,
          'isSentByUser': true,
          'timestamp': 'Now',
        });
        _messageController.clear();
      });
    }
  }


  @override
  void dispose() {
    _timer?.cancel(); // Cancel the timer when the i exit the page before the blink is completed
    _messageController.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: _chatInterfaceVisible ? _buildChatInterface() : _buildIntroSection(),
            ),
          ),
          _buildMessageInput(),
        ],
      ),
    );
  }

  Widget _buildIntroSection() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Mind Buddy',
          style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        SizedBox(height: 16),
        Text(
          'Get Started Today! Join the Mind Buddy program and take a step towards empowerment and mutual support in your journey.',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16, color: Colors.white),
        ),
        SizedBox(height: 32),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedOpacity(
              opacity: _isAvatarVisible ? 1.0 : 0.0,
              duration: Duration(milliseconds: 250),
              child: _buildAvatar(Colors.grey),
            ),
            SizedBox(width: 16),
            Text('...', style: TextStyle(fontSize: 24, color: Colors.white)),
            SizedBox(width: 16),
            AnimatedOpacity(
              opacity: _isAvatarVisible ? 1.0 : 0.0,
              duration: Duration(milliseconds: 250),
              child: _buildAvatar(Colors.grey),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildChatInterface() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Text(
            'Bonnie',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 1),
            itemCount: messages.length,
            itemBuilder: (context, index) {
              final message = messages[index];
              final isSentByUser = message['isSentByUser'];
              return Row(
                mainAxisAlignment: isSentByUser ? MainAxisAlignment.end : MainAxisAlignment.start,
                children: [
                  if (!isSentByUser) _buildAvatar(Colors.grey),
                  SizedBox(width: 8),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: isSentByUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.all(12),
                          margin: EdgeInsets.symmetric(vertical: 4),
                          decoration: BoxDecoration(
                            color: isSentByUser ? Colors.blue : Colors.grey[800],
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            message['text'],
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        Text(
                          message['timestamp'],
                          style: TextStyle(color: Colors.grey[400], fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                  if (isSentByUser) ...[
                    SizedBox(width: 8),
                    _buildAvatar(Colors.blue),
                  ],
                ],
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildAvatar(Color color) {
    return CircleAvatar(
      radius: 20,
      backgroundColor: color,
    );
  }

  Widget _buildMessageInput() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _messageController,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: 'Type a message',
                hintStyle: TextStyle(color: Colors.grey),
                filled: true,
                fillColor: Colors.grey[850],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.send, color: Colors.blue),
            onPressed: _sendMessage,
          ),
        ],
      ),
    );
  }
}



class SocialCommunityPage extends StatelessWidget {
  final List<Map<String, dynamic>> posts = [
    {
      'username': 'Helena',
      'profession': 'OCD specialized therapist',
      'avatarColor': Colors.grey,
      'time': '3 min ago',
      'content':
          'Who knows! The general public still has a lot to learn about OCD! Do you know that it’s not just...?',
      'likes': 21,
      'comments': 4,
      'imagePath': 'assets/images/Community1.png',
    },
    {
      'username': 'Jonny',
      'avatarColor': Colors.grey,
      'time': '1 day ago',
      'content':
          'Logging my daily habits really helps! By using this app and regular therapy sessions, I have been less stressed whenever thoughts w...',
      'likes': 15,
      'comments': 2,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1A1A2E),
      body: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        itemCount: posts.length,
        itemBuilder: (context, index) {
          final post = posts[index];
          return Card(
            color: Color(0xFF2A2A40),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            margin: EdgeInsets.only(bottom: 16.0),
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: post['avatarColor'],
                        radius: 20,
                      ),
                      SizedBox(width: 8),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(post['username'],
                              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
                          if (post['profession'] != null)
                            Text(post['profession'], style: TextStyle(fontSize: 16, color: Colors.grey)),
                        ],
                      ),
                      Spacer(),
                      Text(post['time'], style: TextStyle(fontSize: 16, color: Colors.grey)),
                    ],
                  ),
                  SizedBox(height: 8),
                  if (post['imagePath'] != null) // Display the image if path is not null
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Image.asset(
                        post['imagePath'],
                        fit: BoxFit.cover,
                      ),
                    ),
                  Text(post['content'], style: TextStyle(fontSize: 17, color: Colors.white)),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.thumb_up, color: Colors.blue, size: 16),
                      SizedBox(width: 4),
                      Text('${post['likes']} Likes', style: TextStyle(color: Colors.grey)),
                      SizedBox(width: 16),
                      Icon(Icons.comment, color: Colors.blue, size: 16),
                      SizedBox(width: 4),
                      Text('${post['comments']} Comments', style: TextStyle(color: Colors.grey)),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
