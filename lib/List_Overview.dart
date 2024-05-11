import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Academic Courses',
      home: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 23.0),
                child: Text('Academic Courses'),
              ),
              IconButton(
                icon: Icon(Icons.book_rounded),
                onPressed: () {
                  // Add functionality for book icon action
                },
              ),
            ],
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              // Add functionality for back action
            },
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black), // Add a border
            borderRadius: BorderRadius.circular(0.0), // Optional: Add border radius
          ),
          child: ListView(
            children: [
              CourseItem(
                title: 'Photography\nBasics',
                subtitle: 'Mentorship',
                progress: 69,
                imageAsset: 'assets/List_Overview.png.png',
                imageWidth: 120, // Set the width of the image
                imageHeight: 160, // Set the height of the image
                icon: Icons.camera_alt,
              ),
              CourseItem(
                title: 'Creative\nCareer',
                progress: 27,
                imageAsset: 'assets/List_Overview.png.png',
                imageWidth: 120, // Set the width of the image
                imageHeight: 160, // Set the height of the image
                icon: Icons.create_new_folder,
              ),
              CourseItem(
                title: 'Visual\nCommunication',
                subtitle: 'Event Planning',
                progress: 11,
                imageAsset: 'assets/List_Overview.png.png',
                imageWidth: 120, // Set the width of the image
                imageHeight: 160, // Set the height of the image
                icon: Icons.file_copy,
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: Icon(Icons.home),
                iconSize: 32, // Increase icon size
                onPressed: () {
                  // Add functionality for home action
                },
              ),
              IconButton(
                icon: Icon(Icons.search),
                iconSize: 32, // Increase icon size
                onPressed: () {
                  // Add functionality for search action
                },
              ),
              IconButton(
                icon: Icon(Icons.bookmark_add_outlined),
                iconSize: 32, // Increase icon size
                onPressed: () {
                  // Add functionality for bookmark action
                },
              ),
              IconButton(
                icon: Icon(Icons.person_rounded),
                iconSize: 32, // Increase icon size
                onPressed: () {
                  // Add functionality for profile action
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CourseItem extends StatelessWidget {
  final String title;
  final String? subtitle;
  final int progress;
  final String imageAsset;
  final double imageWidth;
  final double imageHeight;
  final IconData? icon;

  CourseItem({
    required this.title,
    this.subtitle,
    required this.progress,
    required this.imageAsset,
    required this.imageWidth,
    required this.imageHeight,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            imageAsset,
            width: imageWidth, // Set the width of the image
            height: imageHeight, // Set the height of the image
          ),
          SizedBox(
            width: 24.0,
          ), // Add more spacing between the image and details
          Expanded(
            flex: 7,
            child: Column(
              mainAxisAlignment: MainAxisAlignment
                  .center, // Align content vertically at the center
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      textAlign:
                          TextAlign.start, // Align text starting from the left
                      style: TextStyle(
                        fontFamily: 'RobotoMono',
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                    ),
                    if (icon != null)
                      Container(
                        width: 40, // Set the width of the container
                        height: 40, // Set the height of the container
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: [
                            BoxShadow(
                              color:
                                  Color.fromARGB(235, 0, 0, 0).withOpacity(1),
                              offset: Offset(2, 3),
                            ),
                          ],
                        ),
                        child: Icon(icon, size: 20), // Book icon
                      ),
                  ],
                ),
                if (subtitle != null)
                  Text(
                    subtitle!,
                    style: TextStyle(
                      fontFamily: 'RobotoMono',
                      fontSize: 16.0,
                    ),
                  ),
                SizedBox(height: 28.0),
                Container(
                  width: 150, // Set the width of the progress indicator
                  child: LinearProgressIndicator(
                    value: progress / 100,
                    minHeight: 8.0, // Reduce the size of the line
                  ),
                ),
                Text(
                  'Progress: $progress%',
                  style: TextStyle(
                    fontFamily: 'RobotoMono',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
