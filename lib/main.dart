import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:seekhobuddy/GetStarred/Landing.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp(key: UniqueKey()));
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
