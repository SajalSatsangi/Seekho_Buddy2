import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:seekhobuddy/Log_IN.dart';
import 'package:seekhobuddy/Profile.dart';

class SignUpScreen extends StatefulWidget {
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  String? _selectedFaculty;
  String? _selectedSubfaculty;
  String? _selectedSemester;
  String? _selectedSubbranch;

  final List<String> _faculties = [
    'Faculty of Engineering',
    'Faculty of Science',
    'Faculty of Arts',
    'Faculty of Commerece',
    'Faculty of Education',
    'Faculty of Architecture',
    'DEI Technical College'
  ];
  final Map<String, List<String>> _subfaculties = {
    'Faculty of Engineering': [
      "Fulltime-Electrical",
      "Fulltime-Mechanical",
      "Fulltime-Civil",
      "Fulltime-Footwear",
      "Fulltime-Agriclture",
      "Parttime-Electrical",
      "BVoc-RE",
      "BVoc-WS",
      "BVoc-AI",
      "BVoc-WM",
      "BVoc-Automobile",
      "BVoc-DM"
    ],
    'Faculty of Science': ['Subfaculty 3', 'Subfaculty 4'],
    'Faculty of Arts': ['Subfaculty 5', 'Subfaculty 6'],
    'Faculty of Commerece': ['Subfaculty 7', 'Subfaculty 8'],
    'Faculty of Education': ['Subfaculty 9', 'Subfaculty 10'],
    'Faculty of Architecture': ['Subfaculty 11', 'Subfaculty 12'],
    'DEI Technical College': ['Subfaculty 13', 'Subfaculty 14'],
  };
  final Map<String, List<String>> _semesters = {
    'Fulltime-Electrical': [
      'Semester 1',
      'Semester 2',
      'Semester 3',
      'Semester 4',
      'Semester 5',
      'Semester 6',
      'Semester 7'
      
    ],
    'Fulltime-Mechanical': [
      'Semester 1',
      'Semester 2',
      'Semester 3',
      'Semester 4',
      'Semester 5',
      'Semester 6',
      'Semester 7',
      'Semester 8'
    ],
    'Fulltime-Civil': [
      'Semester 1',
      'Semester 2',
      'Semester 3',
      'Semester 4',
      'Semester 5',
      'Semester 6',
      'Semester 7',
      'Semester 8'
    ],
    'Fulltime-Footwear': [
      'Semester 1',
      'Semester 2',
      'Semester 3',
      'Semester 4',
      'Semester 5',
      'Semester 6',
      'Semester 7',
      'Semester 8'
    ],
    'Fulltime-Agriclture': [
      'Semester 1',
      'Semester 2',
      'Semester 3',
      'Semester 4',
      'Semester 5',
      'Semester 6',
      'Semester 7',
      'Semester 8'
    ],
    'Parttime-Electrical': [
      'Semester 1',
      'Semester 2',
      'Semester 3',
      'Semester 4',
      'Semester 5',
      'Semester 6'
    ],
    'BVoc-RE': [
      'Semester 1',
      'Semester 2',
      'Semester 3',
      'Semester 4',
      'Semester 5',
      'Semester 6'
    ],
    'BVoc-WS': [
      'Semester 1',
      'Semester 2',
      'Semester 3',
      'Semester 4',
      'Semester 5',
      'Semester 6'
    ],
    'BVoc-AI': [
      'Semester 1',
      'Semester 2',
      'Semester 3',
      'Semester 4',
      'Semester 5',
      'Semester 6'
    ],
    'BVoc-WM': [
      'Semester 1',
      'Semester 2',
      'Semester 3',
      'Semester 4',
      'Semester 5',
      'Semester 6'
    ],
    'BVoc-Automobile': [
      'Semester 1',
      'Semester 2',
      'Semester 3',
      'Semester 4',
      'Semester 5',
      'Semester 6'
    ],
    'BVoc-DM': [
      'Semester 1',
      'Semester 2',
      'Semester 3',
      'Semester 4',
      'Semester 5',
      'Semester 6'
    ],
    'Subfaculty 3': ['Semester 1', 'Semester 2', 'Semester 3'],
    'Subfaculty 4': ['Semester 1', 'Semester 2', 'Semester 3'],
    'Subfaculty 5': ['Semester 1', 'Semester 2', 'Semester 3'],
    'Subfaculty 6': ['Semester 1', 'Semester 2', 'Semester 3'],
    'Subfaculty 7': ['Semester 1', 'Semester 2', 'Semester 3'],
    'Subfaculty 8': ['Semester 1', 'Semester 2', 'Semester 3'],
    'Subfaculty 9': ['Semester 1', 'Semester 2', 'Semester 3'],
    'Subfaculty 10': ['Semester 1', 'Semester 2', 'Semester 3'],
    'Subfaculty 11': ['Semester 1', 'Semester 2', 'Semester 3'],
    'Subfaculty 12': ['Semester 1', 'Semester 2', 'Semester 3'],
    'Subfaculty 13': ['Semester 1', 'Semester 2', 'Semester 3'],
    'Subfaculty 14': ['Semester 1', 'Semester 2', 'Semester 3'],
  };
final Map<String, List<String>> _subbranches = {
    'Faculty of Engineering_Fulltime-Electrical_Semester 5': ['Subbranch 9', 'Subbranch 10'],
    'Faculty of Engineering_Fulltime-Electrical_Semester 6': ['Subbranch 11', 'Subbranch 12'],
    'Faculty of Engineering_Fulltime-Electrical_Semester 7': ['Subbranch 13', 'Subbranch 14'],
    'Faculty of Engineering_Fulltime-Mechanical_Semester 5': ['Subbranch 17', 'Subbranch 18'],
    // Add more key-value pairs for other combinations of faculty, subfaculty, and semester
};

  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/SignupBGg.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/Splashlogo-removebg-preview.png',
                          width: 100,
                          height: 100,
                        ),
                        Center(
                          child: Text(
                            'SeekhoBuddy',
                            style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontFamily: 'RobotoMono',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: SlidingUpPanel(
                      minHeight: 120,
                      maxHeight: MediaQuery.of(context).size.height * 0.8,
                      panelBuilder: (ScrollController sc) => _buildPanel(sc),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 20,
              left: 20,
              child: IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPanel(ScrollController sc) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: ListView(
        controller: sc,
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 0, horizontal: 140),
            height: 3,
            color: const Color.fromARGB(255, 133, 130, 130),
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: const Text(
                  'Sign Up',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'RobotoMono',
                  ),
                ),
              ),
              SizedBox(width: 30),
              Container(
                width: 50,
                decoration: BoxDecoration(
                  color: Colors.purpleAccent,
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(255, 0, 0, 0).withOpacity(1),
                      offset: Offset(2, 3),
                    ),
                  ],
                ),
                child: TextButton(
                  onPressed: () {
                    // Add functionality for the button
                  },
                  child: Text(
                    'Hi',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 30),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(5),
            ),
            child: TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                labelStyle: TextStyle(fontFamily: 'RobotoMono'),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          SizedBox(height: 14),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(5),
            ),
            child: TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                labelStyle: TextStyle(fontFamily: 'RobotoMono'),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          SizedBox(height: 14),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(5),
            ),
            child: TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Name',
                labelStyle: TextStyle(fontFamily: 'RobotoMono'),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          SizedBox(height: 14),
          DropdownButtonFormField<String>(
            value: _selectedFaculty,
            onChanged: (String? newValue) {
              setState(() {
                _selectedFaculty = newValue;
                _selectedSubfaculty = null;
                _selectedSemester = null;
                _selectedSubbranch = null;
              });
            },
            items: _faculties.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            decoration: InputDecoration(
              labelText: 'Faculty',
              labelStyle: TextStyle(fontFamily: 'RobotoMono'),
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 14),
          DropdownButtonFormField<String>(
            value: _selectedSubfaculty,
            onChanged: (String? newValue) {
              setState(() {
                _selectedSubfaculty = newValue;
                _selectedSemester = null;
                _selectedSubbranch = null;
              });
            },
            items: _subfaculties[_selectedFaculty]?.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList() ??
                [],
            decoration: InputDecoration(
              labelText: 'Subfaculty',
              labelStyle: TextStyle(fontFamily: 'RobotoMono'),
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 14),
          DropdownButtonFormField<String>(
            value: _selectedSemester,
            onChanged: (String? newValue) {
              setState(() {
                _selectedSemester = newValue;
                _selectedSubbranch = null;
              });
            },
            items: _semesters[_selectedSubfaculty]?.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList() ??
                [],
            decoration: InputDecoration(
              labelText: 'Semester',
              labelStyle: TextStyle(fontFamily: 'RobotoMono'),
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 14),
          DropdownButtonFormField<String>(
  value: _selectedSubbranch,
  onChanged: (String? newValue) {
    setState(() {
      _selectedSubbranch = newValue;
    });
  },
  items: _subbranches[
          '${_selectedFaculty}_${_selectedSubfaculty}_${_selectedSemester}']
      ?.map((String value) {
    return DropdownMenuItem<String>(
      value: value,
      child: Text(value),
    );
  }).toList() ??
      [],
  decoration: InputDecoration(
    labelText: 'Subbranch',
    labelStyle: TextStyle(fontFamily: 'RobotoMono'),
    border: OutlineInputBorder(),
  ),
),
          SizedBox(height: 14),
          Container(
            width: 300,
            decoration: BoxDecoration(
              color: Colors.purpleAccent,
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Color.fromARGB(255, 0, 0, 0).withOpacity(1),
                  offset: Offset(2, 3),
                ),
              ],
            ),
            child: TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.black,
              ),
              onPressed: _handleSignUp,
              child: Text(
                'JOIN',
                style: TextStyle(
                    fontFamily: 'RobotoMono', fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                  child: Text(
                    'Already have an account ?',
                    style: TextStyle(
                      fontFamily: 'RobotoMono',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LogInScreen()),
                    );
                  },
                  child: Text(
                    'Log In',
                    style: TextStyle(
                      fontFamily: 'RobotoMono',
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _handleSignUp() async {
    try {
      final UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );

      await _storeUserData(userCredential.user?.uid);

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) =>
                StudentProfileScreen()), // Replace HomeScreen with your actual home screen widget
      );
    } catch (e) {
      print('Error signing up: $e');
    }
  }

  Future<void> _storeUserData(String? userId) async {
    if (userId != null) {
      try {
        final FirebaseFirestore firestore = FirebaseFirestore.instance;
        final DocumentReference userRef =
            firestore.collection('users').doc(_nameController.text);

        Map<String, dynamic> userData = {
          'email': _emailController.text,
          'name': _nameController.text,
          'faculty': _selectedFaculty,
          'subfaculty': _selectedSubfaculty,
          'semester': _selectedSemester,
          'subbranch': _selectedSubbranch,
        };

        await userRef.set(userData);
      } catch (e) {
        print('Error storing user data: $e');
      }
    }
  }
}
