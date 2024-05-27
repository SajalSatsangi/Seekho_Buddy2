import 'package:flutter/material.dart';
import 'Chat/ChatPage-home.dart';
import 'Profile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Home1 extends StatefulWidget {
  final DocumentSnapshot? userData;
  final String subject;

  Home1({required this.userData, required this.subject});

  @override
  _Home1State createState() => _Home1State();
}

class _Home1State extends State<Home1> {
  int _selectedIndex = 0;
  List<String> subjects = []; // Store fetched subjects here

  @override
  void initState() {
    super.initState();
    fetchSubjects(); // Call fetchSubjects function when the widget is initialized
  }

  void fetchSubjects() async {
    if (widget.userData != null) {
      String faculty = widget.userData!['faculty'];
      String subfaculty = widget.userData!['subfaculty'];
      String semester = widget.userData!['semester'];

      final snapshot = await FirebaseFirestore.instance
          .collection('Material DB')
          .doc(faculty)
          .collection(subfaculty)
          .doc(semester)
          .collection('Subjects')
          .doc(widget.subject) // Use the subject parameter here
          .collection(widget.subject) // Use the subject parameter here
          .get();

      setState(() {
        subjects = snapshot.docs.map((doc) => doc.id).toList();
      });
    }
  }

  void _onItemTapped(int index) {
    if (_selectedIndex == 0 && index == 0) {
      setState(() {});
    } else {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  Widget _buildContent() {
    switch (_selectedIndex) {
      case 0:
        return Column(
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
                          widget.subject, // Update this line
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
              child: Padding(
                padding: const EdgeInsets.fromLTRB(30.0, 5.0, 30.0, 30.0),
                child: ListView.builder(
                  itemCount: subjects.length,
                  itemBuilder: (context, index) {
                    String subjectName = subjects[index];
                    return GestureDetector(
                      onTap: () {
                        // Add functionality for the button in each box
                      },
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        subjectName,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.bold,
                                        ),
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
                                  right: 40,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      // Add functionality for the button in each box
                                    },
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                        Colors.white,
                                      ),
                                    ),
                                    child: SizedBox(
                                      width: 190,
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
        );
      case 1:
        return ChatHomePage(); // Replace with your ChatPage implementation
      case 2:
        return ProfileScreen(); // Replace with your ProfileScreen implementation
      default:
        return Center(child: Text('Unknown page'));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: _buildContent(),
    );
  }
}
