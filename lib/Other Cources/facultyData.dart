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
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;
    final padding = mediaQuery.padding;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        width: screenWidth, // Set width to screen width
        height: screenHeight, // Set height to screen height
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SafeArea(
              child: Padding(
                padding: EdgeInsets.only(
                  left: screenWidth * 0.04,
                  right: screenWidth * 0.04,
                  top: padding.top + 10,
                ),
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
                        SizedBox(width: screenWidth * 0.02),
                        Text(
                          "Faculties",
                          style: TextStyle(
                            fontSize: screenWidth * 0.07,
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
                      final nameParts = faculty['name'].split(' ');
                      final lastWord =
                          nameParts.isNotEmpty ? nameParts.removeLast() : '';

                      return Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: screenWidth * 0.12,
                          vertical: screenHeight * 0.01,
                        ), // Adjusted padding
                        child: GestureDetector(
                          child: Padding(
                            padding: EdgeInsets.only(
                                top: screenHeight *
                                    0.01), // Adjust padding from the top
                            child: Container(
                              width: screenWidth * 0.01, // Adjusted width
                              height: screenHeight * 0.18, // Adjusted height
                              decoration: BoxDecoration(
                                color: Color(0xFF323232),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Row(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.horizontal(
                                      left: Radius.circular(20),
                                    ), // Rounded only from the left side
                                    child: Image.asset(
                                      index == 0
                                          ? 'assets/comm.png' // Image for index 0
                                          : index == 1
                                              ? 'assets/edu.png' // Image for index 1
                                              : index == 2
                                                  ? 'assets/eng.png' // Image for index 2
                                                  : index == 3
                                                      ? 'assets/art.png' // Image for index 3
                                                      : index == 4
                                                          ? 'assets/eng.png' // Image for index 4
                                                          : index == 5
                                                              ? 'assets/sci.png' // Image for index 5
                                                              : index == 6
                                                                  ? 'assets/tec.png' // Image for index 6
                                                                  : 'assets/search_result.png', // Default image for other indices
                                      width: screenWidth * 0.34,
                                      height: screenHeight * 0.18,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  SizedBox(width: screenWidth * 0.05),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(height: screenHeight * 0.02),
                                        RichText(
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text: nameParts.join(' '),
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: screenWidth * 0.048,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              TextSpan(
                                                text: '\n$lastWord',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: screenWidth * 0.048,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(height: screenHeight * 0.01),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              right: screenWidth *
                                                  0.15), // Adjust right padding
                                          child: Align(
                                            alignment: Alignment
                                                .centerRight, // Align the button to the right
                                            child: ElevatedButton(
                                              onPressed: () {
                                                Navigator.push(
                                                  context,
                                                  SlideRightPageRoute(
                                                    page: Branches(
                                                      facultyName:
                                                          faculty['name'],
                                                      facultyData:
                                                          faculty, // Pass the entire faculty map
                                                    ),
                                                  ),
                                                );
                                              },
                                              style: ButtonStyle(
                                                backgroundColor:
                                                    WidgetStateProperty.all<
                                                        Color>(
                                                  Colors.white,
                                                ),
                                              ),
                                              child: Text(
                                                'View',
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: screenWidth * 0.03,
                                                ),
                                              ),
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
