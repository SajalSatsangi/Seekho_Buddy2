import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:seekhobuddy/Courses/Materials.dart';

class MateiralsectionAdmin extends StatefulWidget {
  final String subject;

  MateiralsectionAdmin({required this.subject});

  @override
  _MateiralsectionAdminState createState() => _MateiralsectionAdminState();
}

class _MateiralsectionAdminState extends State<MateiralsectionAdmin> {
  DocumentSnapshot? userData;
  List<DocumentSnapshot> subjects = [];
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    fetchUserData();
  }

  Future<void> fetchUserData() async {
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      var querySnapshot = await FirebaseFirestore.instance
          .collection('users')
          .where('uid', isEqualTo: user.uid)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        setState(() {
          userData = querySnapshot.docs.first;
        });

        fetchSubjects();
      }
    }
  }

  void fetchSubjects() async {
    if (userData != null) {
      String faculty = userData!['faculty'];
      String subfaculty = userData!['subfaculty'];
      String semester = userData!['semester'];

      final snapshot = await FirebaseFirestore.instance
          .collection('Material DB')
          .doc(faculty)
          .collection(subfaculty)
          .doc(semester)
          .collection('Subjects')
          .doc(widget.subject)
          .collection(widget.subject)
          .get();

      setState(() {
        subjects = snapshot.docs;
      });
    }
  }

  void _updateSearchQuery(String newQuery) {
    setState(() {
      _searchQuery = newQuery;
    });
  }

  List<DocumentSnapshot> _filterSubjects() {
    return subjects
        .where((subject) =>
            subject.id.toLowerCase().contains(_searchQuery.toLowerCase()))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
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
                          Navigator.of(context).pop();
                        },
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Text(
                        widget.subject,
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(30.0, 5.0, 30.0, 30.0),
              child: ListView.builder(
                itemCount: _filterSubjects().length,
                itemBuilder: (context, index) {
                  DocumentSnapshot subjectDoc = _filterSubjects()[index];
                  String subjectName = subjectDoc.id;
                  return GestureDetector(
                    onTap: () {},
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: 350,
                          height: 150,
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(50, 50, 50, 1),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Stack(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(35.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          subjectName,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Icon(
                                          Icons.book,
                                          color: Colors.white,
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 7),
                                    Text(
                                      '',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Positioned(
                                bottom: 15,
                                left: 0,
                                right: 0,
                                child: Center(
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        SlideRightPageRoute(
                                          page: Materials(
                                            subject: widget.subject,
                                            documentId: subjectDoc.id,
                                          ),
                                        ),
                                      );
                                    },
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                        Colors.white,
                                      ),
                                    ),
                                    child: SizedBox(
                                      width: 230,
                                      child: Text(
                                        'View',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SlideRightPageRoute extends PageRouteBuilder {
  final Widget page;

  SlideRightPageRoute({required this.page})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(1.0, 0.0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
        );
}
