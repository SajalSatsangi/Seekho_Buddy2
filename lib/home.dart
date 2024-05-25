import 'package:flutter/material.dart';
import 'footer.dart';
import 'Chat/ChatPage-home.dart';
import 'Profile.dart';
import 'Courses.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Explorer App',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Color(0xFF161616),
        textTheme: TextTheme(
          bodyText1: TextStyle(color: Colors.white),
          bodyText2: TextStyle(color: Colors.white),
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
            automaticallyImplyLeading: false,
            title: Row(
              children: [
                Text(
                  'Seekho Buddy',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
                ),
                Spacer(),
                Container(
                  padding:
                      EdgeInsets.only(left: 8, right: 8, top: 2, bottom: 2),
                  height: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Color(0xFF323232),
                  ),
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.notification_add,
                        color: Colors.white,
                        size: 20,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            backgroundColor: Color(0xFF161616),
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  color: Colors.grey.shade800,
                  padding: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Explore now!',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Row(
                        children: [
                          TextButton(
                            onPressed: () {
                              // Add your onPressed logic here
                            },
                            child: Row(
                              children: [
                                Text(
                                  'Discover Resources',
                                  style: TextStyle(color: Colors.white),
                                ),
                                Icon(Icons.insights, color: Colors.white),
                              ],
                            ),
                          ),
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
                          color: Colors.white,
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                    TextButton(
                                      // Changed from Text to TextButton
                                      onPressed: () {
                                        // Add your onPressed logic here
                                      },
                                      style: ButtonStyle(
                                          backgroundColor: MaterialStateProperty
                                              .all<Color>(const Color(
                                                  0xFF161616)) // Change background color to red
                                          ),
                                      child: Text(
                                        'View', // Changed to a TextButton
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(width: 42),
                                Image.asset(
                                  'assets/career.png',
                                  height: 100,
                                  width: 100,
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
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 12),
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: 4, // Number of items in the list
                        itemBuilder: (context, index) {
                          return CategoryTile(
                            label: [
                              'Resource',
                              'Job',
                              'Professional',
                              'Networking'
                            ][index],
                            assetPath: [
                              'assets/resource.png',
                              'assets/job.png',
                              'assets/professional.png',
                              'assets/networking.png'
                            ][index],
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      case 1:
        return ChatHomePage();
      case 2:
        return ProfileScreen();
      default:
        return Center(child: Text('Unknown page'));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF161616),
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
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ResourcesPage()),
        );
      },
      child: Card(
        color: Colors.grey.shade800,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  assetPath,
                  height: 70,
                  width: 120,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 8),
              Text(
                label,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
