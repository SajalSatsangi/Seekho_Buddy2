import 'package:flutter/material.dart';
import 'Chat/ChatPage-home.dart';
import 'Profile.dart';
import 'home.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home1 extends StatefulWidget {
  @override
  _Home1State createState() => _Home1State();
}

class _Home1State extends State<Home1> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    if (_selectedIndex == 0 && index == 0) {
      // Refresh home page if already on the home page
      setState(() {});
    } else {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  Widget _buildContent() {
    switch (_selectedIndex) {
      case 0:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SafeArea(
              child: Padding(
                padding: EdgeInsets.only(left: 16, right: 16, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: [
                        IconButton(
                          icon: Icon(Icons.arrow_back, color: Colors.white),
                          onPressed: () {
                            Navigator.of(context).pop(); // Navigate back
                          },
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Text(
                          "Resources",
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.white, // Text color
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: 30),
                    GestureDetector(
                      onTap: () {
                        // Add functionality for the button in Box 1
                      },
                      child: Container(
                        width: 350,
                        height: 150,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(50, 50, 50, 1), // Box 1 color
                          borderRadius:
                              BorderRadius.circular(20), // Rounded corners
                        ),
                        child: Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(
                                  35.0), // Padding around the text
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                                    '',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12.0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Positioned(
                              bottom: 15, // Adjust button position from bottom
                              right: 40, // Adjust button position from right
                              child: ElevatedButton(
                                onPressed: () {
                                  // Add functionality for the button in Box 1
                                },
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                    Colors.black, // Set button background color
                                  ),
                                ),
                                child: SizedBox(
                                  width: 190, // Set button width
                                  child: Text(
                                    'View',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color:
                                          Colors.white, // Set button text color
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
                          color: Color.fromRGBO(50, 50, 50, 1), // Box 2 color
                          borderRadius:
                              BorderRadius.circular(20), // Rounded corners
                        ),
                        child: Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(
                                  35.0), // Padding around the text
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                                    '',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 10.0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Positioned(
                              bottom: 15, // Adjust button position from bottom
                              right: 40, // Adjust button position from right
                              child: ElevatedButton(
                                onPressed: () {
                                  // Add functionality for the button in Box 2
                                },
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                    Colors.black, // Set button background color
                                  ),
                                ),
                                child: SizedBox(
                                  width: 190, // Set button width
                                  child: Text(
                                    'View',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color:
                                          Colors.white, // Set button text color
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              top: 29,
                              right: 40,
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
      backgroundColor: Colors.black,
      body: _buildContent(),
    );
  }
}
