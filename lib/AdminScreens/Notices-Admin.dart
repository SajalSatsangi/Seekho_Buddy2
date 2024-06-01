import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:seekhobuddy/home.dart';

void main() {
  runApp(Notices_admin());
}

class Notices_admin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyWidget(),
      theme: ThemeData.dark(),
    );
  }
}

class MyWidget extends StatelessWidget {
  void _showMaintenanceNotice(BuildContext context) {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      transitionDuration: const Duration(milliseconds: 200),
      pageBuilder: (BuildContext buildContext, Animation animation,
          Animation secondaryAnimation) {
        return Center(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 30),
            child: AlertDialog(
              backgroundColor: Color.fromARGB(255, 56, 56, 56),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
              ),
              contentPadding: EdgeInsets.all(0),
              content: SingleChildScrollView(
                child: Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 39, 39, 39),
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Important Notice:",
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              "Server Maintenance",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              "Our servers will undergo maintenance on 25th August from 10:00 PM to 2:00 AM. During this time, there may be intermittent disruptions in service. We apologize for any inconvenience caused. Thank you for your understanding.",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              "By-XYZ",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.vertical(
                          bottom: Radius.circular(20.0),
                        ),
                        child: Image.network(
                          'https://assets.api.uizard.io/api/cdn/stream/3c5a2383-de2c-44b8-a0b4-3b08795acbb3.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        return BackdropFilter(
          filter: ImageFilter.blur(
              sigmaX: 2 * animation.value, sigmaY: 2 * animation.value),
          child: ScaleTransition(
            scale: CurvedAnimation(parent: animation, curve: Curves.easeOut),
            child: child,
          ),
        );
      },
    );
  }

  Future<void> _showAddPopup(BuildContext context) async {
    final List<String> faculties = [
      'Faculty of Engineering',
      'Faculty of Science',
      'Faculty of Arts',
      'Faculty of Commerce',
      'Faculty of Education',
      'Faculty of Architecture',
      'DEI Technical College'
    ];
    final List<String> subfaculties = [
      "1stYear",
      "Electrical",
      "Mechanical",
      "Civil",
      "Footwear",
      "Agriculture",
      "Electrical",
    ];
    final List<String> semesters = [
      'Semester 1',
      'Semester 2',
      'Semester 3',
      'Semester 4',
      'Semester 5',
      'Semester 6',
      'Semester 7',
      'Semester 8'
    ];
    final List<String> subbranches = ['Students', 'Teachers', 'All'];

    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Color(0xFF323232),
          title: Text(
            'Add Notice',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Title TextField
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Title',
                    hintStyle: TextStyle(color: Colors.grey),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(height: 16),
                // Description TextField
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Description',
                    hintStyle: TextStyle(color: Colors.grey),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                  style: TextStyle(color: Colors.white),
                  maxLines: 5,
                ),
                SizedBox(height: 16),
                // Upload Image Button
                TextButton.icon(
                  onPressed: () {
                    // Implement your image upload logic here
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                  ),
                  icon: Icon(Icons.file_upload),
                  label: Text(
                    'Upload Image',
                    style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),
                  ),
                ),
                SizedBox(height: 16),
                // Multi-select Dropdown 1
                MultiSelectDialogField(
                  items: faculties.map((e) => MultiSelectItem(e, e)).toList(),
                  title: Text("Faculties"),
                  selectedColor: Colors.blue,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.all(Radius.circular(40)),
                    border: Border.all(
                      color: Colors.white,
                      width: 2,
                    ),
                  ),
                  buttonText: Text(
                    "Select faculties",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  itemsTextStyle:
                      TextStyle(color: Colors.white), // Option text color
                  onConfirm: (results) {
                    // Handle the selected faculties
                  },
                ),
                SizedBox(height: 16),
                // Multi-select Dropdown 2
                MultiSelectDialogField(
                  items:
                      subfaculties.map((e) => MultiSelectItem(e, e)).toList(),
                  title: Text("Branches"),
                  selectedColor: Colors.blue,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.all(Radius.circular(40)),
                    border: Border.all(
                      color: Colors.white,
                      width: 2,
                    ),
                  ),
                  buttonText: Text(
                    "Select Branch",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  itemsTextStyle:
                      TextStyle(color: Colors.white), // Option text color
                  onConfirm: (results) {
                    // Handle the selected subfaculties
                  },
                ),
                SizedBox(height: 16),
                // Multi-select Dropdown 3
                MultiSelectDialogField(
                  items: semesters.map((e) => MultiSelectItem(e, e)).toList(),
                  title: Text("Semesters"),
                  selectedColor: Colors.blue,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.all(Radius.circular(40)),
                    border: Border.all(
                      color: Colors.white,
                      width: 2,
                    ),
                  ),
                  buttonText: Text(
                    "Select Semester",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  itemsTextStyle:
                      TextStyle(color: Colors.white), // Option text color
                  onConfirm: (results) {
                    // Handle the selected semesters
                  },
                ),
                SizedBox(height: 16),
                // Multi-select Dropdown 3
                MultiSelectDialogField(
                  items: subbranches.map((e) => MultiSelectItem(e, e)).toList(),
                  title: Text("Specilization"),
                  selectedColor: Colors.blue,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.all(Radius.circular(40)),
                    border: Border.all(
                      color: Colors.white,
                      width: 2,
                    ),
                  ),
                  buttonText: Text(
                    "Select Specilization",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  itemsTextStyle:
                      TextStyle(color: Colors.white), // Option text color
                  onConfirm: (results) {
                    // Handle the selected semesters
                  },
                ),
              ],
            ),
          ),
          actions: <Widget>[
            // Cancel Button
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'Cancel',
                style: TextStyle(color: Colors.white),
              ),
            ),
            // Add Button
            ElevatedButton(
              onPressed: () {
                // Handle add button press
                // You can access the text fields' values here
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 255, 255, 255),
              ),
              child: Text(
                'Add',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 28.0),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 16, right: 16, top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.arrow_back_ios, color: Colors.white),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Home()),
                          );
                        },
                      ),
                      SizedBox(width: 10.0),
                      Text(
                        "Notices",
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
            Padding(
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
            GestureDetector(
              onTap: () {
                _showMaintenanceNotice(context);
              },
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Color(0xFF323232),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Important Notice: Exam Timetable",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            "The exam timetable for this semester has been posted. Please check your courses and exam dates.",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            "Posted on: 15th Oct, 2021",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 16,
                      right: 16,
                      child: Container(
                        width: 17,
                        height: 17,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Color(0xDD000000),
      floatingActionButton: Padding(
        padding: EdgeInsets.only(bottom: 16.0),
        child: FloatingActionButton(
          onPressed: () {
            _showAddPopup(context);
          },
          backgroundColor: Color(0xFF323232),
          child: Icon(Icons.add),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
