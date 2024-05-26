import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart'; // Add this import for SvgPicture
import 'footer.dart';
import 'Chat/ChatPage-home.dart';
import 'Profile.dart';
import 'Courses.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Explorer App',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Color.fromARGB(255, 0, 0, 0),
        textTheme: TextTheme(
          bodyText1: TextStyle(color: Colors.white),
          bodyText2: TextStyle(color: Colors.white),
        ),
      ),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _buildContent() {
    switch (_selectedIndex) {
      case 0:
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Row(
              children: [
                Text(
                  'Seekho Buddy',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
                ),
                Spacer(),
                Container(
                  padding:
                      EdgeInsets.only(left: 8, right: 8, top: 2, bottom: 2),
                  height: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.notification_add,
                        color: Colors.white,
                        size: 20,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            backgroundColor: Color.fromARGB(255, 0, 0, 0),
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 8),
                    Text(
                      'Explore now!',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Event highlights',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Center(
                      child: Container(
                        width: 350,
                        height: 139,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(110, 68, 254, 1),
                          borderRadius: BorderRadius.circular(
                              20), // Adjust the value to change the roundness
                        ),
                        child: Stack(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 15.0, top: 20),
                                  child: Text(
                                    'Career',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 19,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 5),
                                Padding(
                                  padding: const EdgeInsets.only(left: 15.0),
                                  child: Text(
                                    'Connect with professionals',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 13,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10),
                                Align(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        bottom: 7.0, right: 130),
                                    child: SizedBox(
                                      width: 120, // Adjust button width here
                                      height: 40, // Adjust button height here
                                      child: ElevatedButton(
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ResourcesPage()),
                                          );
                                        },
                                        style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all<Color>(
                                                  Color.fromARGB(
                                                      255, 255, 255, 255)),
                                        ),
                                        child: Text(
                                          'View',
                                          style: TextStyle(
                                            color: const Color.fromARGB(
                                                255, 0, 0, 0), // Text color
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Positioned(
                              top: 27,
                              right: 12,
                              child: SvgPicture.asset(
                                'assets/undraw_online_test_re_kyfx.svg',
                                height: 90,
                                width: 90,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Browse categories',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    SizedBox(height: 8), // Add some spacing
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // First box
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ResourcesPage()),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(
                                right: 15.0, left: 15, top: 15),
                            child: Container(
                              width: 160,
                              height: 140,
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 41, 41, 41),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    'assets/Resource.svg',
                                    height: 80,
                                    width: 80,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 15),
                                    child: Text(
                                      'Resource',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        // Second box
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ResourcesPage()),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(top: 15, left: 5),
                            child: Container(
                              width: 160,
                              height: 140,
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 41, 41, 41),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    'assets/Job.svg',
                                    height: 80,
                                    width: 80,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 15),
                                    child: Text(
                                      'Job',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8), // Add some more spacing
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Third box
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ResourcesPage()),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(
                                right: 15, left: 15, top: 15),
                            child: Container(
                              width: 160,
                              height: 140,
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 41, 41, 41),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    'assets/Professional.svg',
                                    height: 80,
                                    width: 80,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 15),
                                    child: Text(
                                      'Professional',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        // Fourth box
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ResourcesPage()),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(top: 15, left: 5),
                            child: Container(
                              width: 160,
                              height: 140,
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 41, 41, 41),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    'assets/Network.svg',
                                    height: 70,
                                    width: 60,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 20),
                                    child: Text(
                                      'Networking',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      case 1:
        return ChatHomePage();
      case 2:
        return ProfileScreen();
      default:
        return Center(child: Text('Unknown page'));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 0, 0, 0),
      body: _buildContent(),
      bottomNavigationBar: CustomFooter(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
