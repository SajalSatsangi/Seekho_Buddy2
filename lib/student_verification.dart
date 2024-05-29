import 'package:flutter/material.dart';


import 'package:seekhobuddy/Profile-Admin.dart';
import 'package:seekhobuddy/verification_history.dart';


void main() {
  runApp(verification());
}

class verification extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: VerificationScreen(),
      theme: ThemeData.dark(),
    );
  }
}

class VerificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 28.0), // Additional padding from the top
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 16, right: 16, top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.arrow_back_ios, color: Colors.white),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProfileScreenAdmin()),
                          );
                        },
                      ),
                      SizedBox(width: 10.0),
                      Text(
                        "Verification",
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                    icon: Icon(Icons.history, color: Colors.white),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => history()),
                      );
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 14, vertical: 14),
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
            Padding(
              padding: EdgeInsets.only(left: 16.0, top: 8.0, bottom: 8.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Student Verification Requests",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Container(
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Color(0xFF424242),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              "John Doe",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight:
                                    FontWeight.bold, // Make the text bold
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                                width:
                                    16), // Added padding between text and button
                            TextButton(
                              onPressed: () {
                                _showIDPopup(
                                  context,
                                  AssetImage(
                                      'assets/search_result.png'), // Image to display
                                );
                              },
                              style: TextButton.styleFrom(
                                backgroundColor: Colors
                                    .black, // Background color of the button
                              ),
                              child: Text(
                                "ID",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 4),
                        Text(
                          "Student ID: 123456",
                          style: TextStyle(
                            color: Colors.white70,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "Institution: ABC University",
                          style: TextStyle(
                            color: Colors.white70,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            disabledBackgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          child: Text("Approve"),
                        ),
                        SizedBox(height: 8),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            disabledBackgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          child: Text("Reject"),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.black87,
    );
  }

  // Function to show the popup
  void _showIDPopup(BuildContext context, AssetImage image) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("ID Information"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image(image: image),
              SizedBox(height: 8),
              Text("Student ID: 123456"),
              SizedBox(height: 4),
              Text("Institution: ABC University"),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Close"),
            ),
          ],
        );
      },
    );
  }
}
