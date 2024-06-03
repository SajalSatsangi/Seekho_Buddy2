import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart'; // Import shared preferences package
import 'editprofile.dart';
import '../LoginPage.dart';

class ProfileScreen extends StatelessWidget {
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
  late SharedPreferences prefs;

  @override
  void initState() {
    super.initState();
    initPrefs();
    fetchUserData();
  }

  Future<void> initPrefs() async {
    prefs = await SharedPreferences.getInstance();
  }

  Future<void> fetchUserData() async {
    // Check if it's been more than a day since last fetch
    DateTime lastFetchTime =
        DateTime.parse(prefs.getString('lastFetchTime') ?? '2000-01-01');
    DateTime now = DateTime.now();
    if (now.difference(lastFetchTime).inDays >= 1 || userData == null) {
      if (user != null) {
        var querySnapshot = await FirebaseFirestore.instance
            .collection('users')
            .where('uid', isEqualTo: user!.uid)
            .get();

        if (querySnapshot.docs.isNotEmpty) {
          setState(() {
            userData = querySnapshot.docs.first;
            saveUserDataLocally(); // Save data locally when fetched
            prefs.setString('lastFetchTime', now.toIso8601String());
          });
        }
      }
    }
  }

  // Function to save user data locally
  Future<void> saveUserDataLocally() async {
    await prefs.setString('name', userData!['name']);
    await prefs.setString('email', userData!['email']);
    await prefs.setString('profile_picture', userData!['profile_picture']);
    await prefs.setString('rollno', userData!['rollno']);
    await prefs.setString('faculty', userData!['faculty']);
    await prefs.setString('subfaculty', userData!['subfaculty']);
    await prefs.setString('subbranch', userData!['subbranch']);
    await prefs.setString('semester', userData!['semester']);
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
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: EdgeInsets.only(left: 17, right: 16, top: 11),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Profile",
                style: TextStyle(
                  fontSize: 28,
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
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 30.0),
                      Center(
                        child: Column(
                          children: [
                            CircleAvatar(
                              radius: 60, // Decreased radius
                              backgroundImage:
                                  NetworkImage(userData!['profile_picture']),
                            ),
                            SizedBox(height: 16),
                            Text(
                              prefs.getString('name') ?? '', // Use local data
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 3),
                            Text(
                              prefs.getString('email') ?? '', // Use local data
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey,
                              ),
                            ),
                            SizedBox(height: 32),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                buildInfoBox(
                                  label: 'University',
                                  text: 'Dayalbagh Educational Institute',
                                  icon: Icons.location_city,
                                ),
                                SizedBox(height: 5),
                                buildInfoBox(
                                  label: 'Roll Number',
                                  text: prefs.getString('rollno') ??
                                      '', // Use local data
                                  icon: Icons.confirmation_number,
                                ),
                                SizedBox(height: 5),
                                buildInfoBox(
                                  label: 'Faculty',
                                  text: prefs.getString('faculty') ??
                                      '', // Use local data
                                  icon: Icons.account_balance,
                                ),
                                SizedBox(height: 5),
                                buildInfoBox(
                                  label: 'Branch',
                                  text: prefs.getString('subfaculty') ?? '',
                                  icon: Icons.category,
                                ),
                                SizedBox(height: 5),
                                buildInfoBox(
                                  label: 'Specialization',
                                  text: prefs.getString('subbranch') ?? '',
                                  icon: Icons.category,
                                ),
                                SizedBox(height: 5),
                                buildInfoBox(
                                  label: 'Semester',
                                  text: prefs.getString('semester') ??
                                      '', // Use local data
                                  icon: Icons.timeline,
                                ),
                              ],
                            ),
                            SizedBox(height: 20),
                            Padding(
                              padding: const EdgeInsets.only(right: 16.0),
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: SizedBox(
                                  width: 100, // Adjust button width here
                                  height: 40, // Adjust button height here
                                  child: ElevatedButton(
                                    onPressed: _logout, // Call _logout function
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                        Color.fromRGBO(65, 48, 48,
                                            0.591), // Changed to red
                                      ),
                                    ),
                                    child: Text(
                                      'LogOut',
                                      style: TextStyle(
                                        color: Color.fromARGB(
                                            255, 233, 30, 30), // Text color
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
      {required String label, required String text, required IconData icon}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8, // Set maximum width
        padding: EdgeInsets.symmetric(horizontal: 14.0, vertical: 10.0),
        decoration: BoxDecoration(
          color: Color.fromRGBO(32, 32, 32, 1),
          borderRadius: BorderRadius.circular(20.0),
          border: Border.all(color: const Color.fromARGB(255, 115, 115, 115)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  icon,
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
                SizedBox(width: 10.0),
                Text(
                  text,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14.0,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
