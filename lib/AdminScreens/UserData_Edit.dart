import 'package:flutter/material.dart';
import 'package:seekhobuddy/AdminScreens/UsersData.dart';

void main() {
  runApp(userdata_edit());
}

class userdata_edit extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyWidget(),
      theme: ThemeData.dark(),
    );
  }
}

class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 28.0), // Additional padding from the top
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
                            MaterialPageRoute(builder: (context) => userdata()),
                          );
                        },
                      ),
                      SizedBox(width: 10.0),
                      Text(
                        "UserData Edit",
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
            // Add the circular image after the title bar
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 14, vertical: 14),
              child: ClipOval(
                child: Image.network(
                  'https://resize.indiatv.in/resize/newbucket/400_-/2024/04/virat-kohli-7-1712427968.webp',
                  width: 150,
                  height: 150,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // Add the text lines with boxes after the image
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 14, vertical: 10),
              child: Column(
                children: [
                  BoxedText(text: 'Name: Virat Kohli'),
                  BoxedText(text: 'Email: virath@gmail.com'),
                  BoxedText(text: 'Roll Number: 2104221'),
                  BoxedText(text: 'Faculty: Faculty of Engineering'),
                  BoxedText(text: 'Branch: 1st Year'),
                  BoxedText(text: 'Sub-Branch: Computer Science'),
                  BoxedText(text: 'Semester: Semester 1'),
                ],
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.black87,
    );
  }
}

class BoxedText extends StatelessWidget {
  final String text;

  BoxedText({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(12),
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Color(0xFF323232),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 18,
          color: Colors.white,
        ),
      ),
    );
  }
}
