import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _studentIdController = TextEditingController();
  final TextEditingController _majorController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16.0, 0, 16.0, 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10), // Adjust only the left padding for "Student" text
                  child: const Text(
                    'Student',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'RobotoMono',
                    ),
                  ),
                ),
                SizedBox(width: 10),
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
                  style: TextStyle(fontFamily: 'RobotoMono', fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
