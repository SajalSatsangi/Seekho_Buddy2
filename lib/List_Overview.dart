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
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Container(
            decoration: BoxDecoration(),
            child: ListView(
              children: [
                _buildBox(),
                _buildCourseItem(
                  title: 'Photography\nBasics',
                  subtitle: 'Mentorship',
                  progress: 69,
                  imageAsset: 'assets/List_Overview.png.png',
                  imageWidth: 120,
                  imageHeight: 180,
                  icon: Icons.camera_alt,
                ),
                _buildBox(),
                _buildCourseItem(
                  title: 'Creative\nCareer',
                  progress: 27,
                  imageAsset: 'assets/List_Overview.png.png',
                  imageWidth: 120,
                  imageHeight: 180,
                  icon: Icons.create_new_folder,
                ),
                _buildBox(),
                _buildCourseItem(
                  title: 'Visual\nCommunication',
                  subtitle: 'Event Planning',
                  progress: 11,
                  imageAsset: 'assets/List_Overview.png.png',
                  imageWidth: 120,
                  imageHeight: 180,
                  icon: Icons.file_copy,
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: Icon(Icons.home),
                iconSize: 32,
                onPressed: () {
                  // Add functionality for home action
                },
              ),
              IconButton(
                icon: Icon(Icons.search),
                iconSize: 32,
                onPressed: () {
                  // Add functionality for search action
                },
              ),
              IconButton(
                icon: Icon(Icons.bookmark_add_outlined),
                iconSize: 32,
                onPressed: () {
                  // Add functionality for bookmark action
                },
              ),
              IconButton(
                icon: Icon(Icons.person_rounded),
                iconSize: 32,
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

  Widget _buildCourseItem({
    required String title,
    String? subtitle,
    required int progress,
    required String imageAsset,
    required double imageWidth,
    required double imageHeight,
    IconData? icon,
  }) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(color: Colors.black),
                bottom: BorderSide(color: Colors.black),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    imageAsset,
                    width: imageWidth,
                    height: imageHeight,
                  ),
                  SizedBox(
                    width: 24.0,
                  ),
                  Expanded(
                    flex: 7,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              title,
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontFamily: 'RobotoMono',
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0,
                              ),
                            ),
                            if (icon != null)
                              Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(color: Colors.black),
                                  borderRadius: BorderRadius.circular(5),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color.fromARGB(235, 0, 0, 0).withOpacity(1),
                                      offset: Offset(2, 3),
                                    ),
                                  ],
                                ),
                                child: Icon(icon, size: 20),
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
                          width: 150,
                          child: LinearProgressIndicator(
                            value: progress / 100,
                            minHeight: 8.0,
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
            ),
          ),
          Divider(
            color: Colors.black,
            thickness: 1.0,
            height: 0.0,
          ),
        ],
      ),
    );
  }

  Widget _buildBox() {
    return SizedBox(height: 16.0);
  }
}
