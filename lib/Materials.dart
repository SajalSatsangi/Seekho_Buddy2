import 'package:flutter/material.dart';
import 'PdfViewer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Materials extends StatefulWidget {
  final DocumentSnapshot userData; // Add this parameter
  final String subject; // Add this parameter
  final String documentId; // Add this parameter

  Materials({
    required this.userData,
    required this.subject,
    required this.documentId,
  }); // Update the constructor to accept the parameters

  @override
  _MaterialsState createState() => _MaterialsState();
}

class _MaterialsState extends State<Materials> {
  late Future<DocumentSnapshot> _documentSnapshot;

  @override
  void initState() {
    super.initState();
    _documentSnapshot = _fetchDocument();
  }

  Future<DocumentSnapshot> _fetchDocument() async {
    String faculty = widget.userData['faculty'];
    String subfaculty = widget.userData['subfaculty'];
    String semester = widget.userData['semester'];

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Materials - ${widget.documentId}', // Display the document ID in the app bar
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.grey[900],
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () {
            // Navigate back when the back button is pressed
            Navigator.of(context).pop();
          },
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(68.0),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search...',
                hintStyle: TextStyle(
                  color: Colors.white,
                ), // Set search text color to white
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
                contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
              ),
            ),
          ),
        ),
      ),
      body: FutureBuilder<DocumentSnapshot>(
        future: _documentSnapshot,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
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

          return ListView(
            children: documentData.entries.map((entry) {
              return Padding(
                padding: EdgeInsets.only(top: 25.0),
                child: ListTile(
                  leading: Icon(
                    Icons.folder,
                    color: Colors.white,
                  ), // Set folder icon color to white
                  title: Text(
                    entry.key,
                    style: TextStyle(color: Colors.white),
                  ),
                  trailing: TextButton(
                    onPressed: () {
                      print('View button clicked');
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
                        color: Colors.white,
                      ),
                    ),
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.grey[800],
                    ),
                  ),
                ),
              );
            }).toList(),
          );
        },
      ),
      backgroundColor:
          Colors.grey[900], // Setting the background color to black
    );
  }
}
