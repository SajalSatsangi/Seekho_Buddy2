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
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * 0.05,
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
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
                          fontSize: MediaQuery.of(context).size.width * 0.07,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(
                  MediaQuery.of(context).size.width * 0.08,
                ),
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
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.1),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "SeekhoBuddy Team",
                            style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.07,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                              height: MediaQuery.of(context).size.width * 0.05),
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
      padding: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.width * 0.04),
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
                  width: MediaQuery.of(context).size.width * 0.3,
                  height: MediaQuery.of(context).size.width * 0.3,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(width: MediaQuery.of(context).size.width * 0.13),
          ],
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: MediaQuery.of(context).size.width * 0.02),
              Text(
                name,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: MediaQuery.of(context).size.width * 0.045,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'B.Tech 4th Year',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: MediaQuery.of(context).size.width * 0.035,
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.width * 0.015),
              InkWell(
                onTap: () async {
                  if (await canLaunch(linkedinUrl)) {
                    await launch(linkedinUrl);
                  } else {
                    throw 'Could not launch $linkedinUrl';
                  }
                },
                child: Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.02,
                      vertical: MediaQuery.of(context).size.width * 0.01),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        'assets/linkedin_icon.png',
                        width: MediaQuery.of(context).size.width * 0.07,
                        height: MediaQuery.of(context).size.width * 0.07,
                      ),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.01),
                      Text(
                        'LinkedIn',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: MediaQuery.of(context).size.width * 0.03,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          if (isImageRight) ...[
            SizedBox(width: MediaQuery.of(context).size.width * 0.04),
            Container(
              margin: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.04),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  imageUrl,
                  width: MediaQuery.of(context).size.width * 0.3,
                  height: MediaQuery.of(context).size.width * 0.3,
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
