import 'package:flutter/material.dart';
import 'styles.dart';

class SocialInfoPage extends StatefulWidget {
  @override
  _SocialInfoPageState createState() => _SocialInfoPageState();
}

class _SocialInfoPageState extends State<SocialInfoPage> {
  int _selectedPage = 0;

  Widget _getPageIndex() {
    if (_selectedPage == 0) {
      return SocialVideo();
    } else if (_selectedPage == 1) {
      return SocialArticle();
    } else {
      return Center(
        child: Text('Select an option'),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData socialTheme = ThemeData.light().copyWith(
      scaffoldBackgroundColor: LightBlue,
      textTheme: TextTheme(
        bodyLarge: TextStyle(color: Black),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: DarkBlue,
          foregroundColor: White,
        ),
      ),
    );

    return Theme(
      data: socialTheme,
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildTabButton('Videos', 0),
                SizedBox(width: 8),
                _buildTabButton('Articles', 1),
              ],
            ),
            Expanded(
              child: Center(
                child: _getPageIndex(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTabButton(String title, int index) {
    bool isSelected = _selectedPage == index;

    return Column(
      children: [
        TextButton(
          onPressed: () {
            setState(() {
              _selectedPage = index;
            });
          },
          child: Text(
            title,
            style: TextStyle(
              color: White,
              fontSize: isSelected ? 18 : 16,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ),
      ],
    );
  }
}

class SocialVideo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _opacity = 1.0;

    return NotificationListener<ScrollNotification>(
      onNotification: (scrollNotification) {
        if (scrollNotification is ScrollUpdateNotification) {
          _opacity = (1 - scrollNotification.metrics.pixels / 100).clamp(0.0, 1.0);
        }
        return true;
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Opacity(
            opacity: _opacity,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.9,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Anything Interesting?',
                    prefixIcon: Icon(Icons.search, color: White),
                    filled: true,
                    fillColor: DarkBlue.withOpacity(0.8),
                    contentPadding: EdgeInsets.symmetric(vertical: 10.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: BorderSide.none,
                    ),
                    hintStyle: TextStyle(color: Colors.white70),
                  ),
                  style: TextStyle(color: White),
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 1,
                children: [
                  _buildNewsCard(
                    title: 'OCD Misconceptions',
                    description: 'Obsession-Compulsive Disorder is not like what you might think it is...',
                    author: 'Mindease Official',
                    isFollowed: true,
                    backgroundColor: LightBlueGrey,
                  ),
                  _buildNewsCard(
                    title: 'Most people are not aware that they have OCD...',
                    author: 'Jeremy talks',
                    isFollowed: true,
                    backgroundColor: LightBlueGrey,
                  ),
                  _buildNewsCard(
                    title: 'First-person view of talking to a Psychiatrist!',
                    author: 'Yuna Leung',
                    backgroundColor: LightBlueGrey,
                  ),
                  _buildNewsCard(
                    title: 'Some useful tools that might suit you for coping OCD',
                    author: 'Sheela Typrasakul',
                    backgroundColor: LightBlueGrey,
                  ),
                  _buildNewsCard(
                    title: 'What do I usually do while having Panic Attacks?',
                    author: 'Garry Hamilton',
                    isFollowed: true,
                    backgroundColor: LightBlueGrey,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNewsCard({
    required String title,
    String? description,
    required String author,
    bool isFollowed = false,
    required Color backgroundColor,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 80,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            SizedBox(height: 8),
            Text(
              title,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Black),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            if (description != null)
              Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: Text(
                  description,
                  style: TextStyle(fontSize: 12, color: Colors.black87),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            Spacer(),
            Row(
              children: [
                Text(
                  author,
                  style: TextStyle(fontSize: 12, color: Colors.grey[700]),
                ),
                Spacer(),
                if (isFollowed)
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      'Followed',
                      style: TextStyle(fontSize: 10, color: Colors.white),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class SocialArticle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _opacity = 1.0;

    return NotificationListener<ScrollNotification>(
      onNotification: (scrollNotification) {
        if (scrollNotification is ScrollUpdateNotification) {
          _opacity = (1 - scrollNotification.metrics.pixels / 100).clamp(0.0, 1.0);
        }
        return true;
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Opacity(
            opacity: _opacity,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.9,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Anything Interesting ?',
                    prefixIcon: Icon(Icons.search, color: White),
                    filled: true,
                    fillColor: DarkBlue.withOpacity(0.8),
                    contentPadding: EdgeInsets.symmetric(vertical: 10.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: BorderSide.none,
                    ),
                    hintStyle: TextStyle(color: Colors.white70),
                  ),
                  style: TextStyle(color: White),
                ),
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(16.0),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                mainAxisSpacing: 16,
                childAspectRatio: 3 / 2,
              ),
              itemCount: 3,
              itemBuilder: (context, index) {
                var articles = [
                  {
                    'title': 'Understanding OCD: Myths vs. Facts',
                    'description': 'This article discusses common myths about OCD...',
                    'author': 'Mindease Official',
                  },
                  {
                    'title': 'Coping Strategies for OCD',
                    'description': 'Explore effective strategies for managing OCD symptoms...',
                    'author': 'Garry Hamilton',
                  },
                  {
                    'title': 'The Role of Therapy in OCD Treatment',
                    'description': 'Learn about different therapy approaches...',
                    'author': 'Dr. Jane Doe',
                  },
                ];

                return _buildArticleCard(
                  title: articles[index]['title']!,
                  description: articles[index]['description']!,
                  author: articles[index]['author']!,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildArticleCard({
    required String title,
    required String description,
    required String author,
  }) {
    return Card(
      color: LightBlueGrey,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 120,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            SizedBox(height: 8),
            Text(
              title,
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Black),
            ),
            SizedBox(height: 8),
            Text(
              description,
              style: TextStyle(fontSize: 14, color: Colors.black87),
            ),
            SizedBox(height: 8),
            Text(
              author,
              style: TextStyle(fontSize: 12, color: Colors.grey[700]),
            ),
          ],
        ),
      ),
    );
  }
}