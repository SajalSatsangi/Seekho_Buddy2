import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:seekhobuddy/GetStarred/Landing.dart';
import 'firebase_options.dart';
import 'LoginPage.dart';
import 'home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnimatedSplashScreen(
        splash: "assets/SplashAnimation.gif",
        splashIconSize: 3000,
        nextScreen: AuthWrapper(),
        duration: 3100,
        splashTransition: SplashTransition.fadeTransition,
        backgroundColor: Color.fromARGB(255, 0, 0, 0),
        pageTransitionType: PageTransitionType.fade,
        animationDuration: Duration(milliseconds: 800),
      ),
    );
  }
}

class AuthWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          User? user = snapshot.data;
          if (user == null) {
            return LandingPage();
          } else {
            return Home();
          }
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
