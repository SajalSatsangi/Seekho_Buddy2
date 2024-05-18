import 'package:flutter/material.dart';
import 'package:seekhobuddy/GetStarred/Landing3.dart';

void main() {
  runApp(LandingPage2());
}

class LandingPage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LandingPage(),
    );
  }
}

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:
            const Color.fromRGBO(0, 0, 0, 1), // Set background color to black
        elevation: 0, // No shadow
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            // Handle back button press
          },
        ),
      ),
      body: Column(
        children: [
          // Header content
          Container(
            color: Colors.black,
            height: 10.0, // Same height as the AppBar
          ),
          // Remaining content with background image
          Expanded(
            child: Stack(
              children: [
                // Background image with specific size
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.centerLeft, // Shift image to left
                    child: Container(
                      height: double.infinity,
                      width: double.infinity,
                      child: Image.asset(
                        'assets/Landing2_BackGroud.png',
                        fit: BoxFit.fitHeight,
                        
                      ),
                    ),
                  ),
                ),
                // Overlay content
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'New Arrivals!',
                        style: TextStyle(
                          fontSize: 35,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 80),
                      Container(
                        width: 260,
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Color(0xFF323232).withOpacity(0.9),
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [],
                        ),
                        child: Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Container(
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.white.withOpacity(0.5),
                                      spreadRadius: 5,
                                      blurRadius: 10,
                                    ),
                                  ],
                                ),
                                child: Image.asset('assets/Landing2_Book.png'),
                              ),
                            ),
                            SizedBox(height: 20),
                            Text(
                              'Mathematics Guide',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              'This comprehensive guide covers key math concepts and problem-solving techniques to help you excel in your studies.',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 20),
                            ElevatedButton(
                              onPressed: () {
                                // Handle button press
                                 Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LandingPage3()),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    Colors.black, // Background color
                              ),
                              child: Text(
                                'Get now',
                                style: TextStyle(
                                  color: Colors.white, // Text color
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black, // Set background color to black
        selectedItemColor:
            const Color.fromARGB(255, 0, 0, 0), // Set selected item color
        unselectedItemColor:
            const Color.fromARGB(255, 0, 0, 0), // Set unselected item color
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }
}
