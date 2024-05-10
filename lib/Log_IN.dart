import 'package:flutter/material.dart';
import 'package:seekhobuddy/sign_up.dart';

class LogInScreen extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 80,
              backgroundImage: AssetImage(
                  'assets/Login_background.png'), // Replace 'assets/login_background.png' with your image path
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
                border: Border.all(color: Colors.black), // Add border property
                borderRadius:
                    BorderRadius.circular(5), // Add borderRadius property
              ),
              child: TextField(
                controller: _usernameController,
                onTap: () {
                  _usernameController.clear(); // Clear the text when tapped
                },
                decoration: InputDecoration(
                  labelText: 'Username',
                  labelStyle: TextStyle(
                      fontFamily:
                          'RobotoMono'), // Apply fontFamily to the label
                  border:
                      OutlineInputBorder(), // Add border line for the input field
                ),
              ),
            ),
            SizedBox(height: 14),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black), // Add border property
                borderRadius:
                    BorderRadius.circular(5), // Add borderRadius property
              ),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  labelStyle: TextStyle(
                      fontFamily:
                          'RobotoMono'), // Apply fontFamily to the label
                  border:
                      OutlineInputBorder(), // Add border line for the input field
                ),
              ),
            ),
            Row(
              children: [
                Checkbox(
                  value: false, // Change to your logic for remembering username
                  onChanged: (value) {
                    // Implement your logic for remembering username here
                  },
                ),
                const Text(
                  'Remember me',
                  style: TextStyle(
                      fontFamily: 'RobotoMono', fontWeight: FontWeight.bold),
                ),
                Spacer(), // Add a spacer to push Forget Password button to the right
                TextButton(
                  onPressed: () {
                    // Implement functionality for Forget Password button
                  },
                  child: const Text(
                    'Forget Password',
                    style: TextStyle(
                        fontFamily: 'RobotoMono', fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),
            Container(
              width: 300, // Adjust width as needed
              decoration: BoxDecoration(
                color: Colors.purpleAccent, // Change color to white
                border: Border.all(color: Colors.black), // Add border property
                borderRadius:
                    BorderRadius.circular(10), // Add borderRadius property
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(255, 0, 0, 0).withOpacity(1),
                    offset: Offset(2, 3), // changes position of shadow
                  ),
                ],
              ),
              child: TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: Colors.black,
                ),
                onPressed: () {
                  // // Navigate to Welcome screen when TextButton is clicked
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => ()),
                  // );
                },
                child: Text(
                  'LOG IN',
                  style: TextStyle(
                      fontFamily: 'RobotoMono', fontWeight: FontWeight.bold),
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
                style: TextStyle(
                    fontFamily: 'RobotoMono', fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
