import 'package:flutter/material.dart';
import 'package:seekhobuddy/splash_screen.dart';
// Import the Welcome screen

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
