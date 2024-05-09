import 'package:flutter/material.dart';
import 'package:seekhobuddy/welcome_2.dart';

void main() {
  runApp(WelcomePage1());
}
class WelcomePage1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/logo.png',
              height: 200,
            ),
            SizedBox(height: 20),
            Text(
              'ResourceHub',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Explore academic, career, and campus resources.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
              ),
            ),
            SizedBox(height: 30),
            Container(
              width: 200, // Adjust width as needed
              decoration: BoxDecoration(
                color: Colors.white, // Change color to white
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
                  // Navigate to Welcome screen when TextButton is clicked
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Welcome()),
                  );
                },
                child: Text(
                  'TextButton',
                  style: TextStyle(fontFamily: 'RobotoMono'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
