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
  final TextStyle appBarTextStyle = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double imageWidth = constraints.maxWidth * 0.8;
        double imageHeight = constraints.maxHeight * 0.4;
        double padding = constraints.maxWidth * 0.05;

        return Scaffold(
          backgroundColor: Color(0xFF161616),
          appBar: AppBar(
            title: Text(
              'Seekho Buddy',
              style: appBarTextStyle,
            ),
            backgroundColor: Color(0xFF161616),
            centerTitle: true, // Center the title horizontally
          ),
          body: SingleChildScrollView(
            padding: EdgeInsets.all(padding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Image.asset(
                  'assets/Get_Start.png', // Ensure this path is correct
                  width: imageWidth, // Responsive width
                  height: imageHeight, // Responsive height
                ),
                SizedBox(height: padding / 2),
                Text(
                  'Welcome to Our Study Hub App!',
                  style: TextStyle(
                    fontSize:
                        constraints.maxWidth * 0.06, // Responsive font size
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: padding / 4), // Decreased gap
                Text(
                  'Discover a world of knowledge at your fingertips. Connect with peers, access study materials, and join study groups for collaborative learning experiences.',
                  style: TextStyle(
                    fontSize:
                        constraints.maxWidth * 0.04, // Responsive font size
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: padding),
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
                    backgroundColor: Colors.white, // background (button) color
                    foregroundColor: Colors.black, // foreground (text) color
                  ),
                  child: Text('Start learning'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
