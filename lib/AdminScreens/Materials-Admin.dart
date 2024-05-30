import 'package:flutter/material.dart';
import '../Courses/PdfViewer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Materials extends StatefulWidget {
  final String subject;
  final String documentId;

  Materials({
    required this.subject,
    required this.documentId,
  });

  @override
  _MaterialsState createState() => _MaterialsState();
}

class _MaterialsState extends State<Materials> {
  DocumentSnapshot? userData;

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
      }
    }
  }

  void _onAddButtonPressed() {
    // Handle add button press
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Text(
            '${widget.documentId}',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(68.0),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 14, vertical: 14),
            child: TextField(
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
        ),
      ),
      body: FutureBuilder<DocumentSnapshot>(
        future: userData != null ? _fetchDocument() : null,
        builder: (context, snapshot) {
          if (userData == null) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
                child: Text('Error: ${snapshot.error}',
                    style: TextStyle(color: Colors.white)));
          } else if (!snapshot.hasData || !snapshot.data!.exists) {
            return Center(
                child: Text('Document does not exist',
                    style: TextStyle(color: Colors.white)));
          }

          var documentData = snapshot.data!.data() as Map<String, dynamic>;

          return Padding(
            padding: EdgeInsets.all(10),
            child: Card(
              color: Color(0xFF323232),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: documentData.entries.expand((entry) {
                    return [
                      ListTile(
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        leading: Icon(
                          Icons.folder,
                          color: Colors.white,
                        ),
                        title: Text(
                          entry.key,
                          style: TextStyle(color: Colors.white),
                        ),
                        trailing: TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PdfViewer(
                                  keyValue: entry.key,
                                  value: entry.value.toString(),
                                ),
                              ),
                            );
                          },
                          child: Text(
                            'View',
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.white,
                          ),
                        ),
                      ),
                      if (documentData.entries.last.key != entry.key)
                        Divider(
                          color: Colors.black,
                          height: 1,
                          thickness: 1,
                        ),
                    ];
                  }).toList(),
                ),
              ),
            ),
          );
        },
      ),
      backgroundColor: Colors.black,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 36.0),
        child: FloatingActionButton(
          onPressed: _onAddButtonPressed,
          backgroundColor: Color(0xFF323232),
          child: Icon(Icons.add, color: Colors.white),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }

  Future<DocumentSnapshot> _fetchDocument() async {
    if (userData == null) {
      throw Exception('userData is not initialized');
    }

    String faculty = userData!['faculty'];
    String subfaculty = userData!['subfaculty'];
    String semester = userData!['semester'];

    return await FirebaseFirestore.instance
        .collection('Material DB')
        .doc(faculty)
        .collection(subfaculty)
        .doc(semester)
        .collection('Subjects')
        .doc(widget.subject)
        .collection(widget.subject)
        .doc(widget.documentId)
        .get();
  }
}
