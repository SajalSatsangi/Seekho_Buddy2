import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'branches.dart'; // Import the Branches widget

class Faculties extends StatelessWidget {
  final DatabaseReference _databaseReference = FirebaseDatabase(
    databaseURL:
        'https://seekhobuddy-default-rtdb.asia-southeast1.firebasedatabase.app',
  ).reference().child('Material DB');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        width: MediaQuery.of(context).size.width, // Set width to screen width
        height:
            MediaQuery.of(context).size.height, // Set height to screen height
        child: Column(
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
                          "Faculties",
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
            Expanded(
              child: StreamBuilder<DatabaseEvent>(
                stream: _databaseReference.onValue,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasError) {
                    return Center(
                        child: Text('Error: ${snapshot.error}',
                            style: TextStyle(color: Colors.white)));
                  }
                  if (!snapshot.hasData ||
                      snapshot.data!.snapshot.value == null) {
                    return Center(
                        child: Text('No faculties found',
                            style: TextStyle(color: Colors.white)));
                  }
                  final Map<String, dynamic> data = Map<String, dynamic>.from(
                      snapshot.data!.snapshot.value as Map);
                  final List<Map<String, dynamic>> faculties = data.values
                      .map((value) => Map<String, dynamic>.from(value))
                      .toList();
                  return ListView.builder(
                    itemCount: faculties.length,
                    itemBuilder: (context, index) {
                      final faculty = faculties[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 44.0, vertical: 8.0), // Reduced padding
                        child: GestureDetector(
                          child: Container(
                            width: MediaQuery.of(context).size.width *
                                0.6, // Adjusted width
                            height: MediaQuery.of(context).size.height *
                                0.2, // Adjusted height
                            decoration: BoxDecoration(
                              color: Color(0xFF323232),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(0.0),
                              child: Row(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.horizontal(
                                        left: Radius.circular(
                                            20)), // Rounded only from the left side
                                    child: Image.asset(
                                      index == 0
                                          ? 'assets/comm.png' // Image for index 0
                                          : index == 1
                                              ? 'assets/edu.png' // Use LinkedIn icon for the fifth image
                                              : index == 2
                                                  ? 'assets/eng.png' // Use LinkedIn icon for the fifth image
                                                  : index == 3
                                                      ? 'assets/art.png' // Use LinkedIn icon for the fifth image
                                                      : index == 4
                                                          ? 'assets/eng.png' // Use LinkedIn icon for the fifth image
                                                          : index == 5
                                                              ? 'assets/sci.png' // Use LinkedIn icon for the fifth image
                                                              : index == 6
                                                                  ? 'assets/tec.png' // Use LinkedIn icon for the fifth image
                                                                  : 'assets/search_result.png', // Default image for other indices
                                      width: 100,
                                      height: 100,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  SizedBox(width: 20),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          faculty['name'],
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 17.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(height: 10),
                                        ElevatedButton(
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              SlideRightPageRoute(
                                                page: Branches(
                                                  facultyName: faculty['name'],
                                                  facultyData:
                                                      faculty, // Pass the entire faculty map
                                                ),
                                              ),
                                            );
                                          },
                                          style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all<
                                                    Color>(
                                              Colors.white,
                                            ),
                                          ),
                                          child: Text(
                                            'View',
                                            style: TextStyle(
                                              color: Colors.black,
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
                    },
                  );
                },
              ),
            ),
          ],
        ),
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
