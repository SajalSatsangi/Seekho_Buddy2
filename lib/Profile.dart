import 'package:flutter/material.dart';
import 'footer.dart';
import 'package:seekhobuddy/home.dart'; // Import the footer widget

void main() {
  runApp(ProfileScreen());
}

class ProfileScreen extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfileScreen> {
  int _selectedIndex = 4; // Set the initial selected index to Profile

  void _onItemTapped(int index) {
    // Handle navigation based on the selected index
    setState(() {
      _selectedIndex = index;
    });

    // Navigate to different pages based on the selected index
    switch (index) {
      case 0:
        // Navigate to HomeScreen
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Home()),
        );
        break;
      case 1:
        // Navigate to SearchScreen
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SearchScreen()),
        );
        break;
      case 2:
        // Navigate to AddScreen
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AddScreen()),
        );
        break;
      case 3:
        // Navigate to ChatScreen
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ChatScreen()),
        );
        break;
      case 4:
        // Already on ProfileScreen
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Study Materials',
      theme: ThemeData.dark(),
      home: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.only(top: 180.0), // Add spacing from the top
            child: Column(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage(
                      'assets/search_result.png'), // Replace with your local asset
                ),
                SizedBox(height: 10),
                Text(
                  'StudyHub User',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5),
                Text(
                  'Access study materials and connect with others.',
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Text('42',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold)),
                          Text('Notes', style: TextStyle(color: Colors.grey)),
                        ],
                      ),
                      Column(
                        children: [
                          Text('87',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold)),
                          Text('Connection',
                              style: TextStyle(color: Colors.grey)),
                        ],
                      ),
                      Column(
                        children: [
                          Text('24',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold)),
                          Text('Resource',
                              style: TextStyle(color: Colors.grey)),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: GridView.count(
                    shrinkWrap: true,
                    crossAxisCount: 3,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    children: List.generate(6, (index) {
                      return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: AssetImage(
                                'assets/search_result.png'), // Replace with your local asset
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: CustomFooter(
          selectedIndex: _selectedIndex,
          onItemTapped: _onItemTapped,
        ),
      ),
    );
  }
}

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search'),
        backgroundColor: Colors.black,
      ),
      body: Center(child: Text('Search Screen')),
    );
  }
}

class AddScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add'),
        backgroundColor: Colors.black,
      ),
      body: Center(child: Text('Add Screen')),
    );
  }
}

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat'),
        backgroundColor: Colors.black,
      ),
      body: Center(child: Text('Chat Screen')),
    );
  }
}
