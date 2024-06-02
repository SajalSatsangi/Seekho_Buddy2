import 'package:flutter/material.dart';
import 'package:seekhobuddy/GetStarred/Landing3.dart';

void main() {
  runApp(LandingPage2());
}

class LandingPage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LandingPage(),
    );
  }
}

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
 

  void _onItemTapped(int index) {
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    // Get screen size
    var screenSize = MediaQuery.of(context).size;

    // Calculate responsive size for text
    double titleFontSize = screenSize.width / 20;
    double descriptionFontSize = screenSize.width / 30;
    double buttonFontSize = screenSize.width / 25;

    // Calculate responsive size for padding and margins
    double containerPadding = screenSize.width / 20;
    double textSpacing = screenSize.height / 40;

    // Calculate responsive size for images
    double imageHeight = screenSize.height / 3;

    return Scaffold(
      appBar: AppBar(
        backgroundColor:
            const Color.fromRGBO(0, 0, 0, 1), // Set background color to black
        elevation: 0, // No shadow
        automaticallyImplyLeading: false, // Remove back button
      ),
      body: Column(
        children: [
          // Header content
          Container(
            color: Colors.black,
            height: 10.0, // Same height as the AppBar
          ),
          // Remaining content with background image
          Expanded(
            child: Stack(
              children: [
                // Background image with specific size
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.centerLeft, // Shift image to left
                    child: Container(
                      height: double.infinity,
                      width: double.infinity,
                      child: Image.asset(
                        'assets/Landing2_BackGroud.png',
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),
                ),
                // Overlay content
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'New Arrivals!',
                        style: TextStyle(
                          fontSize: titleFontSize,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: textSpacing),
                      Container(
                        width: screenSize.width * 0.65,
                        padding: EdgeInsets.all(containerPadding),
                        decoration: BoxDecoration(
                          color: Color(0xFF323232).withOpacity(0.9),
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [],
                        ),
                        child: Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Container(
                                height: imageHeight,
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.white.withOpacity(0.5),
                                      spreadRadius: 5,
                                      blurRadius: 10,
                                    ),
                                  ],
                                ),
                                child: Image.asset('assets/Landing2_Book.png'),
                              ),
                            ),
                            SizedBox(height: textSpacing),
                            Text(
                              'Mathematics Guide',
                              style: TextStyle(
                                fontSize: titleFontSize,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: textSpacing / 2),
                            Text(
                              'This comprehensive guide covers key math concepts and problem-solving techniques to help you excel in your studies.',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: descriptionFontSize,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: textSpacing),
                            ElevatedButton(
                              onPressed: () {
                                // Navigate to LandingPage3 with slide animation
                                Navigator.push(
                                  context,
                                  PageRouteBuilder(
                                    pageBuilder: (context, animation,
                                            secondaryAnimation) =>
                                        LandingPage3(),
                                    transitionsBuilder: (context, animation,
                                        secondaryAnimation, child) {
                                      const begin = Offset(1.0, 0.0);
                                      const end = Offset.zero;
                                      const curve = Curves.ease;

                                      var tween = Tween(begin: begin, end: end)
                                          .chain(CurveTween(curve: curve));
                                      var offsetAnimation =
                                          animation.drive(tween);

                                      return SlideTransition(
                                        position: offsetAnimation,
                                        child: child,
                                      );
                                    },
                                    transitionDuration: Duration(
                                        milliseconds:
                                            500), // Set transition duration to 500ms
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    Colors.black, // Background color
                              ),
                              child: Text(
                                'Get now',
                                style: TextStyle(
                                  fontSize: buttonFontSize,
                                  color: Colors.white, // Text color
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
     
    );
  }
}