import 'package:flutter/material.dart';

class Welcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/signupbg.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'SeekhoBuddy',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 18),
            Text(
              'Explore, Connect, Learn, Engage, and Grow',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 492),
            Container(
              width: 200, // Adjust width as needed
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.white.withOpacity(1),
                  ),
                ],
              ),
              child: TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: Colors.black,
                ),
                onPressed: () {
                  // Navigate to Welcome screen when TextButton is clicked
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Welcome()),
                  );
                },
                child: Text('TextButton'),
              ),
            ),

            // ElevatedButton(
            //   onPressed: () {
            //     // Handle sign up logic
            //   },
            //   style: ElevatedButton.styleFrom(
            //     backgroundColor: Colors.purple,
            //   ),
            //   child: Text(
            //     'SIGN UP',
            //     style: TextStyle(
            //       color: Colors.white,
            //       fontSize: 16,
            //     ),
            //   ),
            // ),

            SizedBox(height: 16),
            Container(
              width: 200, // Adjust width as needed
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.purple.withOpacity(1),
                  ),
                ],
              ),
              child: TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: Colors.black,
                ),
                onPressed: () {
                  // Navigate to Welcome screen when TextButton is clicked
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Welcome()),
                  );
                },
                child: Text('TextButton'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
