import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:seekhobuddy/AdminScreens/Noticepage/Notices-Admin.dart';
import 'package:seekhobuddy/Courses.dart';
import 'package:seekhobuddy/NewHelp.dart';
import 'package:seekhobuddy/donation.dart';
import 'footer.dart';
import 'AdminScreens/Profile-Admin.dart';
import 'ComingSoonPage.dart';

void main() {
  runApp(const HomePage());
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SeekhoBuddy App',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color.fromARGB(255, 0, 0, 0),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.white),
          bodyMedium: TextStyle(color: Colors.white),
        ),
      ),
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController();

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _pageController.animateToPage(index,
          duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        children: [
          Scaffold(
            backgroundColor: Colors.black,
            appBar: AppBar(
              automaticallyImplyLeading: false,
              title: const Row(
                children: [
                  Expanded(
                    child: Text(
                      'Explore & Connect',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 28,
                        color: Colors.white,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              backgroundColor: const Color.fromARGB(255, 0, 0, 0),
            ),
            body: SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      Center(
                        child: Container(
                          width: 350,
                          height: 149,
                          decoration: BoxDecoration(
                            color: const Color(0xFF212121),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Stack(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Padding(
                                    padding:
                                        EdgeInsets.only(left: 15.0, top: 20),
                                    child: Text(
                                      'Explore study Materials',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 19,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  const Row(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(left: 15.0),
                                        child: Text(
                                          'best study materials for you',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 13,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20.0, top: 5.0),
                                    child: SizedBox(
                                      width: 120,
                                      height: 40,
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
                                              WidgetStateProperty.all<Color>(
                                            const Color.fromARGB(
                                                255, 255, 255, 255),
                                          ),
                                        ),
                                        child: const Text(
                                          'View',
                                          style: TextStyle(
                                            color: Color.fromARGB(255, 0, 0, 0),
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
                      const SizedBox(height: 8),
                      Padding(
                        padding: const EdgeInsets.only(right: 0.0),
                        child: Column(
                          children: [
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ComingSoonScreen()),
                                      );
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          right: 15.0, left: 15, top: 15),
                                      child: Container(
                                        width: 160,
                                        height: 140,
                                        decoration: BoxDecoration(
                                          color: const Color.fromARGB(
                                              87, 162, 162, 162),
                                          borderRadius:
                                              BorderRadius.circular(20),
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
                                              'assets/Resource.svg',
                                              height: 80,
                                              width: 80,
                                            ),
                                            const Padding(
                                              padding: EdgeInsets.only(top: 15),
                                              child: Text(
                                                'Explore More',
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
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                NoticesAdmin()),
                                      );
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          top: 15, left: 5),
                                      child: Container(
                                        width: 160,
                                        height: 140,
                                        decoration: BoxDecoration(
                                          color: const Color.fromARGB(
                                              87, 162, 162, 162),
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          border: Border.all(
                                            color: const Color.fromARGB(
                                                255, 107, 107, 107),
                                            width: 2.0, // Reduced border width
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
                                            const Padding(
                                              padding: EdgeInsets.only(top: 15),
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
                            ),
                            const SizedBox(height: 8),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ComingSoonScreen()),
                                      );
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          right: 15, left: 15, top: 15),
                                      child: Container(
                                        width: 160,
                                        height: 140,
                                        decoration: BoxDecoration(
                                          color: const Color.fromARGB(
                                              87, 162, 162, 162),
                                          borderRadius:
                                              BorderRadius.circular(20),
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
                                            const Padding(
                                              padding: EdgeInsets.only(top: 15),
                                              child: Text(
                                                'Projects',
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
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ComingSoonScreen()),
                                      );
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          top: 15, left: 5),
                                      child: Container(
                                        width: 160,
                                        height: 140,
                                        decoration: BoxDecoration(
                                          color: const Color.fromARGB(
                                              87, 162, 162, 162),
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          border: Border.all(
                                            color: const Color.fromARGB(
                                                255, 107, 107, 107),
                                            width: 2.0, // Reduced border width
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
                                            const Padding(
                                              padding: EdgeInsets.only(top: 20),
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
                            ),
                          ],
                        ),
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 70.0, top: 25.0),
                              child: SizedBox(
                                width: 155,
                                height: 40,
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => DonationPage()),
                                    );
                                  },
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                      Color.fromARGB(255, 93, 93, 93),
                                    ),
                                  ),
                                  child: const Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Donate',
                                        style: TextStyle(
                                          color: Color.fromARGB(
                                              255, 252, 251, 251),
                                          fontSize: 18,
                                        ),
                                      ),
                                      SizedBox(
                                          width:
                                              8), // Space between the text and the icon
                                      Icon(
                                        Icons.badge,
                                        color:
                                            Color.fromARGB(255, 252, 251, 251),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 10.0, top: 25.0),
                              child: SizedBox(
                                width: 120,
                                height: 40,
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Newhelp()),
                                    );
                                  },
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                      const Color.fromARGB(255, 93, 93, 93),
                                    ),
                                  ),
                                  child: const Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Help',
                                        style: TextStyle(
                                          color: Color.fromARGB(
                                              255, 252, 251, 251),
                                          fontSize: 18,
                                        ),
                                      ),
                                      SizedBox(
                                          width:
                                              8), // Space between the text and the icon
                                      Icon(
                                        Icons.help,
                                        color:
                                            Color.fromARGB(255, 252, 251, 251),
                                      ),
                                    ],
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
          ),
          ComingSoonScreen(),
          ProfileScreenAdmin(),
        ],
      ),
      bottomNavigationBar: CustomFooter(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
