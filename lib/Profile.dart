import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:seekhobuddy/editprofile.dart';
import 'package:seekhobuddy/LoginPage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(ProfileScreen());
}

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
          bodyText1: TextStyle(color: Colors.white),
          bodyText2: TextStyle(color: Colors.white),
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
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => EditProfile()),
                  );
                },
                child: Container(
                  padding:
                      EdgeInsets.only(left: 8, right: 8, top: 2, bottom: 2),
                  height: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Color(0xFF323232),
                  ),
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.edit,
                        color: Colors.white,
                        size: 20,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: userData == null
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 30.0,
                  ),
                  Center(
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 100,
                          backgroundImage:
                              NetworkImage(userData!['profile_picture']),
                        ),
                        SizedBox(height: 16),
                        Text(
                          userData!['name'],
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          userData!['email'],
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(height: 32),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Academic Information',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text('University: Dayalbagh Educational Institute'),
                            Text('Roll Number: ${userData!['rollno']}'),
                            Text('Faculty: ${userData!['faculty']}'),
                            Text(
                                'Branch: ${userData!['subfaculty']}, ${userData!['subbranch']}'),
                            Text('Semester: ${userData!['semester']}'),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 46.0),
                      child: SizedBox(
                        width: 120, // Adjust button width here
                        height: 40, // Adjust button height here
                        child: ElevatedButton(
                          onPressed: _logout, // Call _logout function
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                              const Color.fromARGB(255, 107, 107, 107),
                            ),
                          ),
                          child: Text(
                            'LogOut',
                            style: TextStyle(
                              color: Colors.white, // Text color
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
