import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Student Profile',
      home: StudentProfileScreen(),
    );
  }
}

class StudentProfileScreen extends StatelessWidget {
  final List<String> _gridImages = [
    'assets/Login_background.png',
    'assets/Login_background.png',
    'assets/Login_background.png',
    'assets/Login_background.png',
    'assets/Login_background.png',
    'assets/Login_background.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.person),
          iconSize: 32,
          onPressed: () {
            Navigator.pop(context); // Add the action to pop the current screen
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            iconSize: 32,
            onPressed: () {
              // Add functionality for search action
            },
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: 46),
          CircleAvatar(
            radius: 78,
            backgroundImage: AssetImage('assets/Login_background.png'),
          ),
          SizedBox(height: 16),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'Student Profile',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                fontFamily: 'RobotoMono', // Apply 'RobotoMono' font family
              ),
            ),
          ),
          SizedBox(height: 8),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'Manage profile, access resources, connect with peers, explore events!',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'RobotoMono', // Apply 'RobotoMono' font family
              ),
            ),
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildStatCounter(56, 'Connect'),
              _buildStatCounter(20, 'Events'),
              _buildStatCounter(24, 'Academ'),
            ],
          ),
          SizedBox(height: 30),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16), // Added padding
            child: Divider(
              color: Color.fromARGB(255, 81, 78, 78), // Dark color
              thickness: 1, // Increased thickness
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(8),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                ),
                itemCount: _gridImages.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.all(4),
                    child: Image.asset(
                      _gridImages[index],
                      fit: BoxFit.cover,
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Icon(Icons.home),
              iconSize: 32, // Increase icon size
              onPressed: () {
                // Add functionality for home action
              },
            ),
            IconButton(
              icon: Icon(Icons.search),
              iconSize: 32, // Increase icon size
              onPressed: () {
                // Add functionality for search action
              },
            ),
            IconButton(
              icon: Icon(Icons.bookmark_add_outlined),
              iconSize: 32, // Increase icon size
              onPressed: () {
                // Add functionality for search action
              },
            ),
            IconButton(
              icon: Icon(Icons.man_rounded),
              iconSize: 32, // Increase icon size
              onPressed: () {
                // Add functionality for search action
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCounter(int value, String label) {
    return Column(
      children: [
        Text(
          value.toString(),
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            fontFamily: 'RobotoMono', // Apply 'RobotoMono' font family
          ),
        ),
        Text(
          label,
          style: TextStyle(
            fontFamily: 'RobotoMono', // Apply 'RobotoMono' font family
          ),
        ),
      ],
    );
  }
}
