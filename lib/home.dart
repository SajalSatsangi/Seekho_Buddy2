import 'package:flutter/material.dart';
import 'footer.dart';
import 'Chat/ChatPage-home.dart';
import 'Profile.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
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
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SafeArea(
              child: Padding(
                padding: EdgeInsets.only(left: 17, right: 16, top: 11),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Home",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.white, // Text color
                      ),
                    ),
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
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 14, left: 14, right: 14),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search...",
                  hintStyle: TextStyle(color: Colors.white),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.white,
                    size: 20,
                  ),
                  filled: true,
                  fillColor: Color(0xFF323232),
                  contentPadding: EdgeInsets.all(8),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Color(0xFF323232)),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    _buildBox(
                      icon: Icons.notes_rounded,
                      title: 'Math',
                      onTap: () {
                        // Add functionality for the button in Box 1
                      },
                    ),
                    SizedBox(height: 20),
                    _buildBox(
                      icon: Icons.book_outlined,
                      title: 'Science',
                      onTap: () {
                        // Add functionality for the button in Box 2
                      },
                    ),
                    SizedBox(height: 20),
                    _buildBox(
                      icon: Icons.history_edu,
                      title: 'History',
                      onTap: () {
                        // Add functionality for the button in Box 3
                      },
                    ),
                    SizedBox(height: 20),
                    _buildBox(
                      icon: Icons.public,
                      title: 'Geography',
                      onTap: () {
                        // Add functionality for the button in Box 4
                      },
                    ),
                    SizedBox(height: 20),
                    _buildBox(
                      icon: Icons.biotech,
                      title: 'Biology',
                      onTap: () {
                        // Add functionality for the button in Box 5
                      },
                    ),
                    SizedBox(height: 20),
                    _buildBox(
                      icon: Icons.calculate,
                      title: 'Physics',
                      onTap: () {
                        // Add functionality for the button in Box 6
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      case 1:
        return ChatHomePage(); // Replace with your ChatPage implementation
      case 2:
        return ProfileScreen(); // Replace with your ProfileScreen implementation
      default:
        return Center(child: Text('Unknown page'));
    }
  }

  Widget _buildBox(
      {required IconData icon,
      required String title,
      required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 350,
        height: 80,
        decoration: BoxDecoration(
          color: Color.fromRGBO(50, 50, 50, 1),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    icon,
                    color: Colors.white,
                  ),
                  SizedBox(width: 8),
                  Text(
                    title,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: onTap,
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                    Colors.black,
                  ),
                ),
                child: Text(
                  'View',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF161616), // Set background color to #161616
      body: _buildContent(),
      bottomNavigationBar: CustomFooter(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
