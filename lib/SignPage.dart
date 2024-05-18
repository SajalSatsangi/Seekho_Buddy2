import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Join Study',
      theme: ThemeData(
        primarySwatch: Colors.grey,
        brightness: Brightness.dark,
      ),
      home: SignUpScreen(),
    );
  }
}

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();

  String? _selectedFaculty;
  String? _selectedSubfaculty;
  String? _selectedSemester;
  String? _selectedSubbranch;

  final List<String> _faculties = [
    'Faculty of Engineering',
    'Faculty of Science',
    'Faculty of Arts',
    'Faculty of Commerce',
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
      "Fulltime-Agriculture",
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
    'Faculty of Commerce': ['Subfaculty 7', 'Subfaculty 8'],
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
    // Add other subfaculties and their semesters here
  };

  final Map<String, List<String>> _subbranches = {
    'Faculty of Engineering_Fulltime-Electrical_Semester 5': [
      'Subbranch 9',
      'Subbranch 10'
    ],
    // Add other combinations of faculty, subfaculty, and semester here
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SlidingUpPanel(
        minHeight: 70,
        maxHeight: MediaQuery.of(context).size.height * 0.819,
        panelBuilder: (ScrollController sc) => _buildPanel(sc),
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      'https://assets.api.uizard.io/api/cdn/stream/377b3c2e-be73-409a-836f-c232f13423fb.png'), // Replace with your image URL
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPanel(ScrollController sc) {
    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: SingleChildScrollView(
        child: Container(
          color: Colors.black,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          // Add Member Icon
                          SizedBox(width: 8.0),
                          Text(
                            'Sign Up', // Sign Up Text
                            style: TextStyle(
                              fontSize: 24.0,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Icon(Icons.person_add,
                          color: Colors.white), // Add Member Icon
                    ],
                  ),
                  SizedBox(height: 20.0),
                  Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        TextFormField(
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            labelText: 'Email',
                            labelStyle: TextStyle(color: Colors.white70),
                            filled: true,
                            fillColor: Colors.grey.shade800,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide: BorderSide.none,
                            ),
                          ),
                          validator: (value) {
                            if (value?.isEmpty ?? true) {
                              return 'Please enter your email';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 16.0),
                        TextFormField(
                          obscureText: true,
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            labelText: 'Password',
                            labelStyle: TextStyle(color: Colors.white70),
                            filled: true,
                            fillColor: Colors.grey.shade800,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide: BorderSide.none,
                            ),
                          ),
                          validator: (value) {
                            if (value?.isEmpty ?? true) {
                              return 'Please enter a password';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 16.0),
                        TextFormField(
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            labelText: 'Name',
                            labelStyle: TextStyle(color: Colors.white70),
                            filled: true,
                            fillColor: Colors.grey.shade800,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide: BorderSide.none,
                            ),
                          ),
                          validator: (value) {
                            if (value?.isEmpty ?? true) {
                              return 'Please enter your name';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 16.0),
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
                            labelStyle: TextStyle(color: Colors.white70),
                            filled: true,
                            fillColor: Colors.grey.shade800,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                        SizedBox(height: 16.0),
                        DropdownButtonFormField<String>(
                          value: _selectedSubfaculty,
                          onChanged: (String? newValue) {
                            setState(() {
                              _selectedSubfaculty = newValue;
                              _selectedSemester = null;
                              _selectedSubbranch = null;
                            });
                          },
                          items: _subfaculties[_selectedFaculty]
                              ?.map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          decoration: InputDecoration(
                            labelText: 'Subfaculty',
                            labelStyle: TextStyle(color: Colors.white70),
                            filled: true,
                            fillColor: Colors.grey.shade800,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                        SizedBox(height: 16.0),
                        DropdownButtonFormField<String>(
                          value: _selectedSemester,
                          onChanged: (String? newValue) {
                            setState(() {
                              _selectedSemester = newValue;
                              _selectedSubbranch = null;
                            });
                          },
                          items: _semesters[_selectedSubfaculty]
                              ?.map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          decoration: InputDecoration(
                            labelText: 'Semester',
                            labelStyle: TextStyle(color: Colors.white70),
                            filled: true,
                            fillColor: Colors.grey.shade800,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                        SizedBox(height: 16.0),
                        DropdownButtonFormField<String>(
                          value: _selectedSubbranch,
                          onChanged: (String? newValue) {
                            setState(() {
                              _selectedSubbranch = newValue;
                            });
                          },
                          items: _subbranches[
                                  '${_selectedFaculty}${_selectedSubfaculty}${_selectedSemester}']
                              ?.map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          decoration: InputDecoration(
                            labelText: 'Subbranch',
                            labelStyle: TextStyle(color: Colors.white70),
                            filled: true,
                            fillColor: Colors.grey.shade800,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                        SizedBox(height: 32.0),
                        ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Processing Data')),
                              );
                            }
                          },
                          child: Text('Sign Up'),
                        ),
                      ],
                    ),
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
