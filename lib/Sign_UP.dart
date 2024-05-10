import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:seekhobuddy/Log_IN.dart';

class SignUpScreen extends StatefulWidget {
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _studentIdController = TextEditingController();

  final TextEditingController _majorController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                'assets/signupbg.png'), // Replace 'assets/background_image.jpg' with your image path
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Image.asset(
                    'assets/Splashlogo-removebg-preview.png', // Replace 'assets/logo.png' with your image path
                    width: 100,
                    height: 100,
                    // Adjust width and height as needed
                  ),
                  Center(
                    child: Text(
                      'SeekhoBuddy',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontFamily: 'RobotoMono',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SlidingUpPanel(
                minHeight: 120, // Adjust as needed
                maxHeight: MediaQuery.of(context).size.height *
                    0.8, // Adjust as needed
                panelBuilder: (ScrollController sc) => _buildPanel(sc),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPanel(ScrollController sc) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: ListView(
        controller: sc,
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 0, horizontal: 140),
            height: 3, // Set height for the divider
            color: const Color.fromARGB(
                255, 133, 130, 130), // Color of the divider
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    left:
                        10), // Adjust only the left padding for "Student" text
                child: const Text(
                  'Sign Up',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'RobotoMono',
                  ),
                ),
              ),
              SizedBox(width: 30),
              Container(
                width: 50,
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
                  onPressed: () {
                    // Add functionality for the button
                  },
                  child: Text(
                    'Hi',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 30),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(5),
            ),
            child: TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
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
          SizedBox(height: 14),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(5),
            ),
            child: TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Name',
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
              controller: _studentIdController,
              decoration: InputDecoration(
                labelText: 'Student ID',
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
              controller: _majorController,
              decoration: InputDecoration(
                labelText: 'Major',
                labelStyle: TextStyle(fontFamily: 'RobotoMono'),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          SizedBox(height: 14),
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
              onPressed: () {
                // Implement functionality for Join button
              },
              child: Text(
                'JOIN',
                style: TextStyle(
                    fontFamily: 'RobotoMono', fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Already have an account ?',
                  style: TextStyle(
                    fontFamily: 'RobotoMono',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LogInScreen()),
                    );
                  },
                  child: Text(
                    'Log In',
                    style: TextStyle(
                      fontFamily: 'RobotoMono',
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
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
