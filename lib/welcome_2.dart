import 'package:flutter/material.dart';
import 'package:seekhobuddy/sign_up.dart'; // Import the SignUpScreen widget;
import 'package:seekhobuddy/Log_IN.dart'; // Import the Log_IN screen widget;

class Welcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/welcome_background.png'),
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
              SizedBox(height: 490),
              Container(
                width: 300, // Adjust width as needed
                decoration: BoxDecoration(
                  color: Colors.purpleAccent, // Change color to white
                  border:
                      Border.all(color: Colors.black), // Add border property
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
                    // Navigate to SignUpScreen when TextButton is clicked
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignUpScreen()),
                    );
                  },
                  child: Text(
                    'SIGN UP',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16),
              Container(
                width: 300, // Adjust width as needed
                decoration: BoxDecoration(
                  color: Colors.white, // Change color to white
                  border:
                      Border.all(color: Colors.black), // Add border property
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
                    // Navigate to Log_IN screen when TextButton is clicked
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LogInScreen()),
                    );
                  },
                  child: Text(
                    'LOG IN',
                    style: TextStyle(
                      fontFamily: 'RobotoMono',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
