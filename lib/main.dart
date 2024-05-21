import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:seekhobuddy/GetStarred/Landing.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnimatedSplashScreen(
        splash: "assets/SplashAnimation.gif",
        splashIconSize: 3000,
        nextScreen: LandingPage(),
        duration: 3100,
        splashTransition: SplashTransition.fadeTransition,
        backgroundColor: Color.fromARGB(255, 0, 0, 0),
        pageTransitionType: PageTransitionType.fade,
        animationDuration:
            Duration(milliseconds: 800), // Set the duration to 0.5 seconds
      ),
    );
  }
}
