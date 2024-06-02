import 'package:flutter/material.dart';
import 'package:seekhobuddy/home.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(Newhelp());
}

class Newhelp extends StatelessWidget {
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
                        "Help Page",
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
            SizedBox(height: 30),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(26.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Your Course',
                          filled: true,
                          fillColor: Color(0xFF323232),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Your Year',
                          filled: true,
                          fillColor: Color(0xFF323232),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Your Roll Number',
                          filled: true,
                          fillColor: Color(0xFF323232),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Your Branch/Specialization/Stream',
                          filled: true,
                          fillColor: Color(0xFF323232),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        maxLines: 5,
                        decoration: InputDecoration(
                          hintText:
                              'Detailed Description of Your Issue (Please provide as much detail as possible)',
                          filled: true,
                          fillColor: Color(0xFF323232),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(height: 10),
                      ElevatedButton.icon(
                        onPressed: () {
                          // Implement image upload functionality
                        },
                        icon: Icon(Icons.upload_file, color: Colors.white),
                        label: Text('Upload Image',
                            style: TextStyle(color: Colors.white)),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF323232), // Button color
                          disabledBackgroundColor: Colors.white, // Text color
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                      SizedBox(height: 15),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Home()),
                          ); // Implement form submission functionality
                        },
                        child: Text('Send',
                            style:
                                TextStyle(color: Colors.white, fontSize: 20)),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF323232), // Button color
                          disabledBackgroundColor: Colors.white, // Text color
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: EdgeInsets.symmetric(
                              vertical: 15, horizontal: 60),
                        ),
                      ),
                      SizedBox(height: 100),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "SeekhoBuddy Team",
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 20),
                          ProfileCard(
                            name: 'Nihal Saran',
                            imageUrl:
                                'https://media.licdn.com/dms/image/D4D03AQFaaIZWO9IPQw/profile-displayphoto-shrink_100_100/0/1706756591651?e=1722470400&v=beta&t=OGajEuphTl79NiJXhFqNqhQGjLiS0BB0LzR8DYc8lnI',
                            isImageRight: false,
                            linkedinUrl:
                                'https://www.linkedin.com/in/nihal-saran/',
                          ),
                          ProfileCard(
                            name: 'Sajal Satsangi',
                            imageUrl:
                                'https://media.licdn.com/dms/image/D4D03AQGbLkLrr_VNKA/profile-displayphoto-shrink_400_400/0/1689824948962?e=1722470400&v=beta&t=SuvABQD393ep4IaHNzgMFIkI0OYIWl_PPT42dXzJDhU',
                            isImageRight: true,
                            linkedinUrl:
                                'https://www.linkedin.com/in/sajal-satsangi/',
                          ),
                          ProfileCard(
                            name: 'Ansh Prasad',
                            imageUrl:
                                'https://media.licdn.com/dms/image/D4D03AQFYjXW3zGg0Kg/profile-displayphoto-shrink_100_100/0/1674130190372?e=1722470400&v=beta&t=3K1-c3toN7nWILNTBl1NMIFavi6ZT5EDxJQDMrlkZzA',
                            isImageRight: false,
                            linkedinUrl:
                                'https://www.linkedin.com/in/ansh-prasad/',
                          ),
                          ProfileCard(
                            name: 'N. Shikhar',
                            imageUrl:
                                'https://media.licdn.com/dms/image/D4D03AQEJoLYZ8IkgeA/profile-displayphoto-shrink_100_100/0/1685933964356?e=1722470400&v=beta&t=OMxYQxVsDYn46NOUwWvAz_UOb9tsNiBo5tDXLHNwDhA',
                            isImageRight: true,
                            linkedinUrl:
                                'https://www.linkedin.com/in/n-shikhar/',
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.black87,
    );
  }
}

class ProfileCard extends StatelessWidget {
  final String name;
  final String imageUrl;
  final bool isImageRight;
  final String linkedinUrl;

  ProfileCard({
    required this.name,
    required this.imageUrl,
    required this.isImageRight,
    required this.linkedinUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (!isImageRight) ...[
            Container(
              margin: EdgeInsets.only(left: 0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  imageUrl,
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(width: 40),
          ],
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10), // Adjust the height as needed
              Text(
                name,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'B.Tech 4th Year',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
              SizedBox(height: 6),
              InkWell(
                onTap: () async {
                  if (await canLaunch(linkedinUrl)) {
                    await launch(linkedinUrl);
                  } else {
                    throw 'Could not launch $linkedinUrl';
                  }
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        'assets/linkedin_icon.png',
                        width: 20,
                        height: 20,
                      ),
                      SizedBox(width: 4),
                      Text(
                        'LinkedIn',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          if (isImageRight) ...[
            SizedBox(width: 10),
            Container(
              margin: EdgeInsets.only(left: 16),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  imageUrl,
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
