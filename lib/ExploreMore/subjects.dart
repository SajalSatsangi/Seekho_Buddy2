import 'package:flutter/material.dart';
import 'package:seekhobuddy/AdminScreens/materialSectionPage-Admin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:seekhobuddy/ExploreMore/materialSectionPage.dart'; 

class Subjects extends StatefulWidget {
  final String semesterName;
  final Map semesterData;
  final String facultyName;
  final String branchName;

  Subjects({
    required this.semesterName,
    required this.semesterData,
    required this.facultyName,
    required this.branchName,
  });

  @override
  _SubjectsState createState() => _SubjectsState();
}

class _SubjectsState extends State<Subjects> {
  String searchQuery = '';

  Future<String> getUserRole() async {
  User? user = FirebaseAuth.instance.currentUser;
  if (user != null) {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('users').where('uid', isEqualTo: user.uid).get();
    if (querySnapshot.docs.isNotEmpty) {
      return querySnapshot.docs.first['role'];
    } else {
      throw Exception('No user document found');
    }
  } else {
    throw Exception('No user logged in');
  }
}

  @override
  Widget build(BuildContext context) {
    Map subjects = Map.from(widget.semesterData)..remove('semesterName');
    Map filteredSubjects = {};
    for (var key in subjects.keys) {
      if (key.toString().toLowerCase().contains(searchQuery.toLowerCase())) {
        filteredSubjects[key] = subjects[key];
      }
    }

    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SafeArea(
            child: Padding(
              padding: EdgeInsets.only(left: 16, right: 16, top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.arrow_back_ios, color: Colors.white),
                        onPressed: () {
                          Navigator.of(context).pop(); // Navigate back
                        },
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Text(
                        widget.semesterName,
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.white, // Text color
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 14, left: 14, right: 14),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  searchQuery = value;
                });
              },
              style: TextStyle(color: Colors.white), // Add this line
              decoration: InputDecoration(
                hintText: "Search...",
                hintStyle: TextStyle(color: Colors.white),
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.white,
                  size: 20,
                ),
                filled: true,
                fillColor: Color(0xFF323232),
                contentPadding: EdgeInsets.all(8),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: Color(0xFF323232)),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredSubjects.length,
              itemBuilder: (context, index) {
                String subjectKey = filteredSubjects.keys.elementAt(index);
                Map subject = filteredSubjects[subjectKey];

                return Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 7.0, horizontal: 27.0),
                  child: GestureDetector(
                    child: Container(
                      height: 70,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(50, 50, 50, 1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.school,
                                  color: Colors.white,
                                ),
                                SizedBox(width: 8),
                                Text(
                                  subject['subjectName'] ??
                                      'Default Subject Name',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            ElevatedButton(
                              onPressed: () {
                                getUserRole().then((role) {
                                  if (role == 'student') {
                                    Navigator.push(
                                      context,
                                      SlideLeftPageRoute(
                                        page: Materialsectionpage(
                                          subjectName: subject['subjectName'],
                                          subject: subject,
                                          facultyName: widget.facultyName,
                                          branchName: widget.branchName,
                                          semesterName: widget.semesterName,
                                          role: role,  // Add this line
                                        ),
                                      ),
                                    );
                                  } else if (role == 'admin' || role == 'CR') {
                                    Navigator.push(
                                      context,
                                      SlideLeftPageRoute(
                                        page: Materialsectionpage_Admin(
                                          subjectName: subject['subjectName'],
                                          subject: subject,
                                          facultyName: widget.facultyName,
                                          branchName: widget.branchName,
                                          semesterName: widget.semesterName,
                                          role: role,  // Add this line
                                        ),
                                      ),
                                    );
                                  }
                                });
                              },
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                  Colors.white,
                                ),
                              ),
                              child: Text(
                                'View',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class SlideLeftPageRoute<T> extends PageRouteBuilder<T> {
  final Widget page;

  SlideLeftPageRoute({required this.page})
      : super(
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(1.0, 0.0);
            const end = Offset.zero;
            const curve = Curves.ease;

            var tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
            var offsetAnimation = animation.drive(tween);

            return SlideTransition(
              position: offsetAnimation,
              child: child,
            );
          },
        );
}
