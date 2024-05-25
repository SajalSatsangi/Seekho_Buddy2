import 'package:flutter/material.dart';
import 'footer.dart';
import 'Chat/ChatPage-home.dart';
import 'Profile.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Explorer App',
      theme: ThemeData(
        brightness: Brightness.dark, // Set the brightness to dark
        primarySwatch: Colors.purple,
        scaffoldBackgroundColor:
            Color(0xFF161616), // Set scaffold background color to grey.shade800
        textTheme: TextTheme(
          bodyText1:
              TextStyle(color: Colors.white), // Set default text color to white
          bodyText2:
              TextStyle(color: Colors.white), // Set default text color to white
        ),
      ),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _buildContent() {
    switch (_selectedIndex) {
      case 0:
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false, // Remove the back button
            title: Text(
              'Seekho Buddy',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
            ),
            backgroundColor: Color(
                0xFF161616), // Set AppBar background color to grey.shade800
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  color: Colors.grey.shade800,
                  padding: EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Explore now!',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white, // Set text color to white
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            'Discover Resources',
                            style: TextStyle(
                                color: Colors.white), // Set text color to white
                          ),
                          Icon(Icons.insights, color: Colors.white),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Event highlights',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white, // Set text color to white
                        ),
                      ),
                      SizedBox(height: 8),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.grey.shade800,
                        ),
                        padding: EdgeInsets.all(16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment
                                      .start, // Align text to the left
                                  children: [
                                    Text(
                                      'Career',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 28,
                                      ),
                                    ),
                                    Text(
                                      'Connect with professionals',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                    Text(
                                      'View',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                    width:
                                        42), // Add some space between text and image
                                Image.asset(
                                  'assets/career.png', // Replace 'your_image.png' with your image asset path
                                  height: 100, // Adjust height as needed
                                  width: 100, // Adjust width as needed
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 22),
                      Text(
                        'Browse categories',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white, // Set text color to white
                        ),
                      ),
                      SizedBox(height: 12),
                      GridView.count(
                        shrinkWrap: true,
                        crossAxisCount: 2,
                        childAspectRatio: 1.5,
                        physics: NeverScrollableScrollPhysics(),
                        children: [
                          CategoryTile(
                            label: 'Resource',
                            assetPath: 'assets/resource.png',
                          ),
                          CategoryTile(
                            label: 'Job',
                            assetPath: 'assets/job.png',
                          ),
                          CategoryTile(
                            label: 'Professional',
                            assetPath: 'assets/professional.png',
                          ),
                          CategoryTile(
                            label: 'Networking',
                            assetPath: 'assets/networking.png',
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      case 1:
        return ChatHomePage(); // Replace with your ChatPage implementation
      case 2:
        return ProfileScreen(); // Replace with your ProfileScreen implementation
      default:
        return Center(child: Text('Unknown page'));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(
          0xFF161616), // Set scaffold background color to Color(0xFF161616)
      body: _buildContent(),
      bottomNavigationBar: CustomFooter(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}

class CategoryTile extends StatelessWidget {
  final String label;
  final String assetPath;

  CategoryTile({
    required this.label,
    required this.assetPath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              assetPath,
              height: 80,
              width: 120,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white, // Set text color to white
            ),
          ),
        ],
      ),
    );
  }
}
