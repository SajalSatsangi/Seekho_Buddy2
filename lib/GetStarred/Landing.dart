import 'package:flutter/material.dart';

void main() {
  runApp(LandingPage());
}

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Study Hub Access',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: TextTheme(
          bodyText1: TextStyle(color: Colors.white), // Set text color to white
          bodyText2: TextStyle(color: Colors.white), // Set text color to white
        ),
      ),
      home: StudyHubScreen(),
    );
  }
}

class StudyHubScreen extends StatelessWidget {
  final TextStyle appBarTextStyle = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF161616),
      appBar: AppBar(
        title: Text(
          'Study Hub Access',
          style: appBarTextStyle,
        ),
        backgroundColor: Color.fromRGBO(16, 16, 16, 1),
        centerTitle: true, // Center the title horizontally
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            // Handle menu button press
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Image.asset(
              'assets/Get_Start.png', // Ensure this path is correct
              width: 450, // Increased width
              height: 450, // Increased height
            ),
            SizedBox(height: 0),
            Text(
              'Welcome to Our Study Hub App!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10), // Decreased gap
            Text(
              'Discover a world of knowledge at your fingertips. Connect with peers, access study materials, and join study groups for collaborative learning experiences.',
              style: TextStyle(
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20), // Adjusted gap to fit the design better
            ElevatedButton(
              onPressed: () {
                // Handle button press
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white, // background (button) color
                foregroundColor: Colors.black, // foreground (text) color
              ),
              child: Text('Start learning'),
            ),
          ],
        ),
      ),
    );
  }
}
