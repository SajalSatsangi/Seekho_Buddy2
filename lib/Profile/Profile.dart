import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../Profile/editprofile.dart';
import '../LoginPage.dart';

class ProfileScreenAdmin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'StudyHub',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.black,
        ),
        textTheme: TextTheme(
          bodyLarge: TextStyle(color: Colors.white),
          bodyMedium: TextStyle(color: Colors.white),
        ),
      ),
      home: ProfilePage(),
    );
  }
}

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  User? user = FirebaseAuth.instance.currentUser;
  DocumentSnapshot? userData;

  @override
  void initState() {
    super.initState();
    fetchUserData();
  }

  Future<void> fetchUserData() async {
    if (user != null) {
      var querySnapshot = await FirebaseFirestore.instance
          .collection('users')
          .where('uid', isEqualTo: user!.uid)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        setState(() {
          userData = querySnapshot.docs.first;
        });
      }
    }
  }

  // Function to handle logout
  Future<void> _logout() async {
    try {
      await FirebaseAuth.instance.signOut();
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => LoginPage()),
        (Route<dynamic> route) => false,
      );
      // Navigate to the login screen after logout and clear the navigation stack
    } catch (e) {
      print("Error logging out: $e");
      // Handle any errors here
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: EdgeInsets.only(
              left: screenWidth * 0.05,
              right: screenWidth * 0.04,
              top: screenHeight * 0.025),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Profile",
                style: TextStyle(
                  fontSize: screenWidth * 0.065,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Row(
                // Add this
                children: <Widget>[
                  IconButton(
                    icon: Icon(
                      Icons.edit,
                      color: Colors.white,
                      size: screenWidth * 0.06,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => EditProfile()),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      body: userData == null
          ? Center(child: CircularProgressIndicator())
          : Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(screenWidth * 0.07),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: screenHeight * 0.04),
                      Center(
                        child: Column(
                          children: [
                            CircleAvatar(
                              radius: screenWidth * 0.15,
                              backgroundImage:
                                  NetworkImage(userData!['profile_picture']),
                            ),
                            SizedBox(height: screenHeight * 0.03),
                            Text(
                              userData!['name'],
                              style: TextStyle(
                                fontSize: screenWidth * 0.065,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: screenHeight * 0.005),
                            Text(
                              userData!['email'],
                              style: TextStyle(
                                fontSize: screenWidth * 0.035,
                                color: Colors.grey,
                              ),
                            ),
                            SizedBox(height: screenHeight * 0.03),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                buildInfoBox(
                                  label: 'University',
                                  text: 'Dayalbagh Educational Institute',
                                  icon: Icons.location_city,
                                  screenWidth: screenWidth,
                                ),
                                SizedBox(height: screenHeight * 0.01),
                                buildInfoBox(
                                  label: 'Roll Number',
                                  text: userData!['rollno'],
                                  icon: Icons.confirmation_number,
                                  screenWidth: screenWidth,
                                ),
                                SizedBox(height: screenHeight * 0.01),
                                buildInfoBox(
                                  label: 'Faculty',
                                  text: userData!['faculty'],
                                  icon: Icons.account_balance,
                                  screenWidth: screenWidth,
                                ),
                                SizedBox(height: screenHeight * 0.01),
                                buildInfoBox(
                                  label: 'Branch',
                                  text: userData!['subfaculty'],
                                  icon: Icons.category,
                                  screenWidth: screenWidth,
                                ),
                                SizedBox(height: screenHeight * 0.01),
                                buildInfoBox(
                                  label: 'Specialization',
                                  text: userData!['subbranch'],
                                  icon: Icons.spa,
                                  screenWidth: screenWidth,
                                ),
                                SizedBox(height: screenHeight * 0.01),
                                buildInfoBox(
                                  label: 'Semester',
                                  text: userData!['semester'],
                                  icon: Icons.timeline,
                                  screenWidth: screenWidth,
                                ),
                              ],
                            ),
                            SizedBox(height: screenHeight * 0.02),
                            Padding(
                              padding:
                                  EdgeInsets.only(right: screenWidth * 0.06),
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: SizedBox(
                                  width: screenWidth * 0.26,
                                  height: screenHeight * 0.055,
                                  child: ElevatedButton(
                                    onPressed: _logout,
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                        Color.fromRGBO(65, 48, 48, 0.591),
                                      ),
                                    ),
                                    child: Text(
                                      'LogOut',
                                      style: TextStyle(
                                        color: Color.fromARGB(255, 233, 30, 30),
                                        fontSize: screenWidth * 0.035,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }

  Widget buildInfoBox(
      {required String label,
      required String text,
      required IconData icon,
      required double screenWidth}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: screenWidth * 0.005),
      child: Container(
        width: screenWidth * 0.75,
        padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.04, vertical: screenWidth * 0.03),
        decoration: BoxDecoration(
          color: Color.fromRGBO(32, 32, 32, 1),
          borderRadius: BorderRadius.circular(screenWidth * 0.05),
          border: Border.all(color: const Color.fromARGB(255, 115, 115, 115)),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: Color.fromARGB(255, 255, 255, 255),
              size: screenWidth * 0.07,
            ),
            SizedBox(width: screenWidth * 0.04),
            Text(
              text,
              style: TextStyle(
                color: Colors.white,
                fontSize: screenWidth * 0.035,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
