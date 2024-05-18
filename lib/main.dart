import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
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
        splash: Scaffold(
          backgroundColor: const Color.fromRGBO(16, 16, 16, 1),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/Splashlogo.png',
                  height: 150,
                ),
                const SizedBox(height: 20),
                const Text(
                  'SEEKHO BUDDY',
                  style: TextStyle(
                    fontFamily: 'PoetsenOne',
                    color: Colors.white,
                    fontSize: 45,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
        nextScreen: LandingPage(),
        duration: 3100,
        splashTransition: SplashTransition.fadeTransition,
        backgroundColor: const Color.fromRGBO(16, 16, 16, 1),
      ),
    );
  }
}
