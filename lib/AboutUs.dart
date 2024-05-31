import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(about());
}

class about extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: Colors.white),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(
            'About Us',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.black,
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ProfileCard(
                    name: 'Nihal Saran',
                    imageUrl:
                        'https://avatars.githubusercontent.com/u/92871743?v=4',
                    isImageRight: false,
                    linkedinUrl: 'https://www.linkedin.com/in/nihal-saran/',
                  ),
                  ProfileCard(
                    name: 'Sajal Satsangi',
                    imageUrl:
                        'https://avatars.githubusercontent.com/u/119046714?v=4',
                    isImageRight: true,
                    linkedinUrl: 'https://www.linkedin.com/in/sajal-satsangi/',
                  ),
                  ProfileCard(
                    name: 'N. Shikhar',
                    imageUrl:
                        'https://avatars.githubusercontent.com/u/92314161?v=4',
                    isImageRight: false,
                    linkedinUrl: 'https://www.linkedin.com/in/n-shikhar/',
                  ),
                  ProfileCard(
                    name: 'Ansh Prasad',
                    imageUrl:
                        'https://avatars.githubusercontent.com/u/129548078?v=4',
                    isImageRight: true,
                    linkedinUrl: 'https://www.linkedin.com/in/ansh-prasad/',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ProfileCard extends StatelessWidget {
  final String name;
  final String imageUrl;
  final bool isImageRight;
  final String linkedinUrl;

  ProfileCard(
      {required this.name,
      required this.imageUrl,
      required this.isImageRight,
      required this.linkedinUrl});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (!isImageRight)
            Container(
              margin: EdgeInsets.only(left: 0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  imageUrl,
                  width: 150,
                  height: 150,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          if (!isImageRight) SizedBox(width: 40),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20), // Adjust the height as needed
              Text(
                name,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 4),
              Text(
                'B.Tech 4th Year',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
              SizedBox(height: 8),
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
                        'linkedin',
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
          if (isImageRight) SizedBox(width: 10),
          if (isImageRight)
            Container(
              margin: EdgeInsets.only(left: 16),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  imageUrl,
                  width: 150,
                  height: 150,
                  fit: BoxFit.cover,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
