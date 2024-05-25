import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'edit.dart'; // Import the EditField screen

class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
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

  Future<void> navigateToEditField(String field, String currentValue) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditField(field: field, currentValue: currentValue),
      ),
    );
    if (result != null) {
      // Update the specific field in Firestore and local state
      await FirebaseFirestore.instance.collection('users').doc(userData!.id).update({field: result});
      fetchUserData();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
      ),
      body: userData == null
          ? Center(child: CircularProgressIndicator())
          : ListView(
              padding: EdgeInsets.all(16),
              children: [
                GestureDetector(
                  onTap: () => navigateToEditField('profile_picture', userData!['profile_picture']),
                  child: CircleAvatar(
                    radius: 100,
                    backgroundImage: NetworkImage(userData!['profile_picture']),
                  ),
                ),
                SizedBox(height: 16),
                GestureDetector(
                  onTap: () => navigateToEditField('name', userData!['name']),
                  child: Text(
                    userData!['name'],
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 8),
                GestureDetector(
                  onTap: () => navigateToEditField('email', userData!['email']),
                  child: Text(
                    userData!['email'],
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
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
                    GestureDetector(
                      onTap: () => navigateToEditField('rollno', userData!['rollno']),
                      child: Text('Roll Number: ${userData!['rollno']}'),
                    ),
                    GestureDetector(
                      onTap: () => navigateToEditField('faculty', userData!['faculty']),
                      child: Text('Faculty: ${userData!['faculty']}'),
                    ),
                    GestureDetector(
                      onTap: () => navigateToEditField('subfaculty', userData!['subfaculty']),
                      child: Text('Branch: ${userData!['subfaculty']}'),
                    ),
                    GestureDetector(
                      onTap: () => navigateToEditField('subbranch', userData!['subbranch']),
                      child: Text('Sub Branch: ${userData!['subbranch']}'),
                    ),
                    GestureDetector(
                      onTap: () => navigateToEditField('semester', userData!['semester']),
                      child: Text('Semester: ${userData!['semester']}'),
                    ),
                  ],
                ),
              ],
            ),
    );
  }
}
