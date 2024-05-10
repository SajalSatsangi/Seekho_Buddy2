import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:seekhobuddy/sign_up.dart';
import 'package:seekhobuddy/Profile.dart';

class LogInScreen extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

 // Firebase authentication instance
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> _signInWithEmailAndPassword(BuildContext context) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: _usernameController.text.trim(), // Assuming email is used for username
        password: _passwordController.text.trim(),
      );
      
      // Navigate to WelcomeScreen or any other screen upon successful login
      // Example:
       Navigator.push(
         context,
         MaterialPageRoute(builder: (context) => StudentProfileScreen()),
       );
    } catch (e) {
      // Handle errors here, e.g., display an error message
      print('Failed to sign in: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to sign in: $e'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 80,
                backgroundImage: AssetImage('assets/Login_background.png'),
              ),
              const SizedBox(height: 20),
              const Text(
                'Welcome Back',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'RobotoMono',
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Explore courses, mentorship,',
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'RobotoMono',
                ),
              ),
              const SizedBox(height: 30),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: TextField(
                  controller: _usernameController,
                  onTap: () {
                    _usernameController.clear();
                  },
                  decoration: InputDecoration(
                    labelText: 'Username',
                    labelStyle: TextStyle(fontFamily: 'RobotoMono'),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              SizedBox(height: 14),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    labelStyle: TextStyle(fontFamily: 'RobotoMono'),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Row(
                children: [
                  Checkbox(
                    value: false,
                    onChanged: (value) {
                      // Implement your logic for remembering username here
                    },
                  ),
                  const Text(
                    'Remember me',
                    style: TextStyle(fontFamily: 'RobotoMono', fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  TextButton(
                    onPressed: () {
                      // Implement functionality for Forget Password button
                    },
                    child: const Text(
                      'Forget Password',
                      style: TextStyle(fontFamily: 'RobotoMono', fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),
              Container(
                width: 300,
                decoration: BoxDecoration(
                  color: Colors.purpleAccent,
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(255, 0, 0, 0).withOpacity(1),
                      offset: Offset(2, 3),
                    ),
                  ],
                ),
                child: TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.black,
                  ),
                  onPressed: () => _signInWithEmailAndPassword(context),
                  child: Text(
                    'LOG IN',
                    style: TextStyle(fontFamily: 'RobotoMono', fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignUpScreen()),
                  );
                },
                child: Text(
                  'Create an account',
                  style: TextStyle(fontFamily: 'RobotoMono', fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
