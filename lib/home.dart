import 'package:flutter/material.dart';

void main() {
  runApp(Home());
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor:
            Colors.black, // Set the background color of the Scaffold to black
        body: Column(
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
                          color: Color.fromRGBO(50, 50, 50, 1), // Box 1 color
                          borderRadius:
                              BorderRadius.circular(20), // Rounded corners
                        ),
                        child: Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(
                                  25.0), // Padding around the text
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
                              bottom: 15, // Adjust button position from bottom
                              right: 37, // Adjust button position from right
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
                                  25.0), // Padding around the text
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
                              bottom: 15, // Adjust button position from bottom
                              right: 37, // Adjust button position from right
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
            Container(
              color: Color.fromRGBO(25, 25, 25, 1), // Footer color
              height: 50, // Footer height
              child: Center(
                child: Text(
                  'Footer',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
