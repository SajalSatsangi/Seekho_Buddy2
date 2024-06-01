import 'package:flutter/material.dart';
import 'PdfViewer.dart';
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
      body: FutureBuilder<QuerySnapshot>(
        future: userData != null ? _fetchDocuments() : null,
        builder: (context, snapshot) {
          if (userData == null) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
                child: Text('Error: ${snapshot.error}',
                    style: TextStyle(color: Colors.white)));
          } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(
                child: Text('No documents found',
                    style: TextStyle(color: Colors.white)));
          }

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
                  children: snapshot.data!.docs.map((doc) {
                    return ListTile(
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      leading: Icon(
                        Icons.folder,
                        color: Colors.white,
                      ),
                      title: Text(
                        doc.id,
                        style: TextStyle(color: Colors.white),
                      ),
                      trailing: TextButton(
                        onPressed: () {
                          String pdfName = doc.id;
                          Map<String, dynamic> data =
                              doc.data() as Map<String, dynamic>;
                          String pdfLink = data['link'] ??
                              ''; // Fetch the "link" value from the document
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PdfViewer(
                                pdfName: pdfName, // Pass the document name
                                pdfLink: pdfLink, // Pass the "link" value
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
                    );
                  }).toList(),
                ),
              ),
            ),
          );
        },
      ),
      backgroundColor: Colors.black,
    );
  }

  Future<QuerySnapshot<Map<String, dynamic>>> _fetchDocuments() async {
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
        .collection(widget.documentId)
        .get();
  }
}
