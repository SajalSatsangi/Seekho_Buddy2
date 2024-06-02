import 'package:flutter/material.dart';
import 'package:seekhobuddy/GetStarred/Landing2.dart';

void main() {
  runApp(LandingPage());
}

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Seekho Buddy',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: TextTheme(
          bodyLarge: TextStyle(color: Colors.white), // Set text color to white
          bodyMedium: TextStyle(color: Colors.white), // Set text color to white
        ),
      ),
      home: StudyHubScreen(),
    );
  }
}

class StudyHubScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Get screen size
    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Color(0xFF161616),
      appBar: AppBar(
        title: Text(
          'Seekho Buddy',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Color(0xFF161616),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(screenSize.width * 0.04), // 4% of screen width
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Image.asset(
              'assets/Get_Start.png',
              width: screenSize.width * 0.9, // 90% of screen width
              height: screenSize.height * 0.4, // 40% of screen height
            ),
            SizedBox(height: screenSize.height * 0.01), // 1% of screen height
            Text(
              'Welcome to Our Study Hub App!',
              style: TextStyle(
                fontSize: screenSize.width * 0.06, // 6% of screen width
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: screenSize.height * 0.02), // 2% of screen height
            Text(
              'Discover a world of knowledge at your fingertips. Connect with peers, access study materials, and join study groups for collaborative learning experiences.',
              style: TextStyle(
                fontSize: screenSize.width * 0.04, // 4% of screen width
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: screenSize.height * 0.04), // 4% of screen height
            ElevatedButton(
              onPressed: () {
                // Navigate to LandingPage2 with slide animation
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        LandingPage2(),
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                      const begin = Offset(1.0, 0.0);
                      const end = Offset.zero;
                      const curve = Curves.ease;

                      var tween = Tween(begin: begin, end: end)
                          .chain(CurveTween(curve: curve));

                      return SlideTransition(
                        position: animation.drive(tween),
                        child: child,
                      );
                    },
                    transitionDuration: Duration(milliseconds: 500),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
              ),
              child: Text('Start learning'),
            ),
          ],
        ),
      ),
    );
  }
}