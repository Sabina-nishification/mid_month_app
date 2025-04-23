import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final List<Map<String, String>> newsData = [
    {'headline': 'Breaking News: World Leader Announces New Policies', 'image': 'assets/news1.jpg'},
    {'headline': 'Sports Update: The Big Game Highlights', 'image': 'assets/news2.jpg'},
    {'headline': 'Entertainment Buzz: New Movie Releases This Week', 'image': 'assets/news3.jpg'},
    {'headline': 'Tech Talk: The Latest Gadgets Revealed at Tech Conference', 'image': 'assets/news4.jpg'},
    {'headline': 'Health News: Experts Discuss Mental Health Awareness', 'image': 'assets/news5.jpg'},
    {'headline': 'Business Insights: Stock Market Hits Record High', 'image': 'assets/news6.jpg'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Breaking News'),
        backgroundColor: Colors.black,
        elevation: 4.0,
        iconTheme: IconThemeData(color: Colors.white),
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 24.0,
          fontStyle: FontStyle.italic,
        ),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(8.0),
        itemCount: newsData.length,
        itemBuilder: (context, index) {
          return _buildNewsCard(context, newsData[index]);
        },
      ),
    );
  }

  Widget _buildNewsCard(BuildContext context, Map<String, String> newsItem) {
    return Card(
      elevation: 2.0,
      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.zero,
        side: BorderSide(color: Colors.black, width: 1),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.all(15.0),
        title: Text(
          newsItem['headline']!,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0, color: Colors.black),
        ),
        subtitle: Text('Tap to read more...'),
        leading: Image.asset(
          newsItem['image']!,
          width: 60.0,
          height: 60.0,
          fit: BoxFit.cover,
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ArticleDetailScreen(
                headline: newsItem['headline']!,
                image: newsItem['image']!,
              ),
            ),
          );
        },
      ),
    );
  }
}

class ArticleDetailScreen extends StatelessWidget {
  final String headline;
  final String image;

  ArticleDetailScreen({required this.headline, required this.image});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Article Detail'),
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.white),
        elevation: 4.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(image),
            SizedBox(height: 20.0),
            Text(
              headline,
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold, color: Colors.black),
            ),
            SizedBox(height: 20.0),
            Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque vestibulum nisl at nisi tempus volutpat.',
              style: TextStyle(fontSize: 16.0, color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
