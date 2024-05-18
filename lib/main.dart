import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';

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
        nextScreen: const LandingPage(),
        duration: 3100,
        splashTransition: SplashTransition.fadeTransition,
        backgroundColor: const Color.fromRGBO(16, 16, 16, 1),
      ),
    );
  }
}

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Landing Page'),
      ),
      body: const Center(
        child: Text('Welcome to SeekhoBuddy!'),
      ),
    );
  }
}
