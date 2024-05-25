import 'package:flutter/material.dart';
import 'footer.dart';
import 'package:seekhobuddy/Profile.dart'; // Import the footer widget

void main() {
  runApp(Home());
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

    // Handle navigation based on the selected index
    switch (index) {
      case 0:
        // Navigate to HomeScreen
        // You can add navigation logic here if necessary
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
        // Navigate to ProfileScreen
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ProfileScreen()),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor:
            Colors.black, // Set the background color of the Scaffold to black
        body: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  color: Color.fromRGBO(25, 25, 25, 1), // Top bar color
                  height: 70, // Increased height for the top bar
                  padding: EdgeInsets.only(
                    left: 25.0,
                    top: 25.0,
                    right: 25.0,
                  ), // Adjusted padding
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Home',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                        ),
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.notifications,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          // Add your notification icon onPressed functionality here
                        },
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(40.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {
                            // Add functionality for the button in Box 1
                          },
                          child: Container(
                            width: 350,
                            height: 150,
                            decoration: BoxDecoration(
                              color:
                                  Color.fromRGBO(50, 50, 50, 1), // Box 1 color
                              borderRadius:
                                  BorderRadius.circular(20), // Rounded corners
                            ),
                            child: Stack(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(
                                      25.0), // Padding around the text
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Notes',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18.0,
                                          fontWeight:
                                              FontWeight.bold, // Make text bold
                                        ),
                                      ),
                                      SizedBox(height: 7),
                                      Text(
                                        'Some additional information here',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Positioned(
                                  bottom:
                                      15, // Adjust button position from bottom
                                  right:
                                      37, // Adjust button position from right
                                  child: ElevatedButton(
                                    onPressed: () {
                                      // Add functionality for the button in Box 1
                                    },
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                        Colors
                                            .black, // Set button background color
                                      ),
                                    ),
                                    child: SizedBox(
                                      width: 190, // Set button width
                                      child: Text(
                                        'View',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors
                                              .white, // Set button text color
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 29,
                                  right: 37,
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.notes_rounded,
                                        color: Colors.white,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 40), // Adding space between boxes
                        GestureDetector(
                          onTap: () {
                            // Add functionality for the button in Box 2
                          },
                          child: Container(
                            width: 350,
                            height: 150,
                            decoration: BoxDecoration(
                              color:
                                  Color.fromRGBO(50, 50, 50, 1), // Box 2 color
                              borderRadius:
                                  BorderRadius.circular(20), // Rounded corners
                            ),
                            child: Stack(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(
                                      25.0), // Padding around the text
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Previous Year Papers',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 17.0,
                                          fontWeight:
                                              FontWeight.bold, // Make text bold
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      Text(
                                        'Some additional information here',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 10.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Positioned(
                                  bottom:
                                      15, // Adjust button position from bottom
                                  right:
                                      37, // Adjust button position from right
                                  child: ElevatedButton(
                                    onPressed: () {
                                      // Add functionality for the button in Box 2
                                    },
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                        Colors
                                            .black, // Set button background color
                                      ),
                                    ),
                                    child: SizedBox(
                                      width: 190, // Set button width
                                      child: Text(
                                        'View',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors
                                              .white, // Set button text color
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 29,
                                  right: 37,
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.book_outlined,
                                        color: Colors.white,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 80,
              right: 20,
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    // Add functionality for the add button here
                  },
                  borderRadius: BorderRadius.circular(
                      20), // Ensure the ripple effect follows the rounded corners
                  child: Ink(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(50, 50, 50, 1), // Box color
                      borderRadius:
                          BorderRadius.circular(20), // Rounded corners
                    ),
                    child: Center(
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 30.0, // Adjust the size of the icon as needed
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: CustomFooter(
          selectedIndex: _selectedIndex,
          onItemTapped: _onItemTapped,
        ),
      ),
    );
  }
}

// Dummy Screens for Navigation
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
