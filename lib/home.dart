import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart'; // Add this import for SvgPicture
import 'package:seekhobuddy/Notification.dart';
import 'footer.dart';
import 'Chat/ChatPage-home.dart';
import 'Profile.dart';
import 'Courses.dart';

void main() {
  runApp(HomePage());
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Explorer App',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Color.fromARGB(255, 0, 0, 0),
        textTheme: TextTheme(
          bodyLarge: TextStyle(color: Colors.white),
          bodyMedium: TextStyle(color: Colors.white),
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
          backgroundColor: Colors.black,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Row(
              children: [
                Text(
                  'Explore & Connect',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 28,
                      color: Colors.white),
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
                      Container(
                        padding: EdgeInsets.only(
                            left: 8, right: 8, top: 2, bottom: 2),
                        height: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Color(0xFF323232),
                        ),
                        child: Center(
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => NotificationsPage()),
                              );
                            },
                            child: Icon(
                              Icons.notification_add,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                        ),
                      )
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
                    Center(
                      child: Container(
                        width: 350,
                        height:
                            129, // Increase the height to accommodate the bar
                        decoration: BoxDecoration(
                          color: Color(0xFF212121),
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
                                    'Latest study updates',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 19,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 5),
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 15.0, right: 10.0),
                                      child: CircleAvatar(
                                        backgroundImage:
                                            AssetImage('assets/Image.png'),
                                        radius: 10,
                                      ),
                                    ),
                                    Text(
                                      'join study groups for success',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 13,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10),
                                Align(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        bottom: 7.0, right: 130),
                                    child: SizedBox(
                                      width: 120, // Adjust button width here
                                      height: 40, // Adjust button height here
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Positioned(
                              top: 22,
                              right: 20,
                              child: SvgPicture.asset(
                                'assets/undraw_online_test_re_kyfx.svg',
                                height: 65,
                                width: 65,
                              ),
                            ),
                            Positioned(
                              bottom: 20,
                              left: 185,
                              right: 15,
                              child: Container(
                                height:
                                    10, // Adjust the height of the rectangular bar
                                decoration: BoxDecoration(
                                  color:
                                      Color.fromARGB(255, 63, 63, 63), // Set the color of the bar
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(
                                        10), // Adjust the radius value as needed
                                    bottomRight: Radius.circular(
                                        10), // Adjust the radius value as needed
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Study Tools',
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    SizedBox(height: 20),
                    Center(
                      child: Container(
                        width: 350,
                        height: 149,
                        decoration: BoxDecoration(
                         color:  Color(0xFF212121),
                          // color: Color(0xFF323232),
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
                                    'Latest study updates',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 19,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 5),
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        left: 15.0,
                                      ),
                                      child: Text(
                                        'join study groups for success',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 13,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 15.0, top: 5.0),
                                  child: SizedBox(
                                    width: 120, // Adjust button width here
                                    height: 40, // Adjust button height here
                                    child: ElevatedButton(
                                      onPressed: () {
                                        // Add your onPressed code here
                                      },
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                          Color.fromARGB(255, 255, 255, 255),
                                        ),
                                      ),
                                      child: Text(
                                        'view',
                                        style: TextStyle(
                                          color: const Color.fromARGB(255, 0, 0, 0), // Text color
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Positioned(
                              top: 22,
                              right: 20,
                              child: SvgPicture.asset(
                                'assets/undraw_online_test_re_kyfx.svg',
                                height: 65,
                                width: 65,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Study categories',
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    SizedBox(height: 8), // Add some spacing
                    Padding(
                      padding: EdgeInsets.only(right: 15.0),
                      child: Column(
                        children: [
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
                                      borderRadius: BorderRadius.circular(20),
                                       color: Color.fromARGB(255, 28, 28, 28),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SvgPicture.asset(
                                          'assets/Resource.svg',
                                          height: 80,
                                          width: 80,
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 15),
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
                                  padding:
                                      const EdgeInsets.only(top: 15, left: 5),
                                  child: Container(
                                    width: 160,
                                    height: 140,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      border: Border.all(
                                        color: const Color.fromARGB(
                                            255, 107, 107, 107),
                                        width: 2.0,
                                      ),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SvgPicture.asset(
                                          'assets/Job.svg',
                                          height: 80,
                                          width: 80,
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 15),
                                          child: Text(
                                            'Notices',
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
                                      borderRadius: BorderRadius.circular(20),
                                      border: Border.all(
                                        color: const Color.fromARGB(
                                            255, 107, 107, 107),
                                        width: 2.0,
                                      ),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SvgPicture.asset(
                                          'assets/Professional.svg',
                                          height: 80,
                                          width: 80,
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 15),
                                          child: Text(
                                            '?????',
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
                                  padding:
                                      const EdgeInsets.only(top: 15, left: 5),
                                  child: Container(
                                    width: 160,
                                    height: 140,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      border: Border.all(
                                        color: const Color.fromARGB(
                                            255, 107, 107, 107),
                                        width: 2.0,
                                      ),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SvgPicture.asset(
                                          'assets/Network.svg',
                                          height: 70,
                                          width: 60,
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 20),
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
