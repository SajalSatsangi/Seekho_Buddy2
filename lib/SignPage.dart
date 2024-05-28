import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:seekhobuddy/LoginPage.dart';
import 'package:seekhobuddy/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(SignUpPage());
}

class SignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'StudyHub',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: const Color.fromRGBO(0, 0, 0, 1),
        hintColor: Colors.white,
      ),
      home: StudyHubLoginScreen(),
    );
  }
}

class StudyHubLoginScreen extends StatefulWidget {
  @override
  _StudyHubLoginScreenState createState() => _StudyHubLoginScreenState();
}

class _StudyHubLoginScreenState extends State<StudyHubLoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _rollnoController = TextEditingController();

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
      'Semester 7',
      'Semester 8'
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
    'Faculty of Engineering_Fulltime-Electrical_Semester 6': [
      'Computer Science',
      'Subbranch 12'
    ],
    'Faculty of Engineering_Fulltime-Electrical_Semester 7': [
      'Subbranch 13',
      'Subbranch 14'
    ],
    'Faculty of Engineering_Fulltime-Electrical_Semester 8': [
      'Subbranch 15',
      'Subbranch 16'
    ],
    'Faculty of Engineering_Fulltime-Mechanical_Semester 5': [
      'Subbranch 13',
      'Subbranch 14'
    ],
    'Faculty of Engineering_Fulltime-Mechanical_Semester 6': [
      'Computer Science',
      'Subbranch 16'
    ],
    'Faculty of Engineering_Fulltime-Mechanical_Semester 7': [
      'Subbranch 17',
      'Subbranch 18'
    ],
    'Faculty of Engineering_Fulltime-Mechanical_Semester 8': [
      'Subbranch 19',
      'Subbranch 20'
    ],
    // Add other combinations of faculty, subfaculty, and semester here
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF161616),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset(
                  'assets/loginPage.png',
                  height: 250,
                ),
                SizedBox(height: 20),
                Text(
                  'Seekho Buddy',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10),
                Text(
                  'Access study materials efficiently',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 30),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      _buildTextField(
                        controller: _emailController,
                        hintText: 'Email',
                        icon: Icons.email,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20),
                      _buildTextField(
                        controller: _passwordController,
                        hintText: 'Password',
                        icon: Icons.password,
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20),
                      _buildTextField(
                        controller: _nameController,
                        hintText: 'Name',
                        icon: Icons.person,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your name';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20),
                      _buildTextField(
                        controller: _rollnoController,
                        hintText: 'Roll-No',
                        icon: Icons.numbers,
                        keyboardType: TextInputType
                            .number, // Set keyboard type to accept only numbers
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your roll Number';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20),
                      _buildDropdown(
                        value: _selectedFaculty,
                        items: _faculties,
                        hintText: 'Faculty',
                        icon: Icons.school,
                        onChanged: (value) {
                          setState(() {
                            _selectedFaculty = value;
                            _selectedSubfaculty = null;
                            _selectedSemester = null;
                            _selectedSubbranch = null;
                          });
                        },
                      ),  
                      SizedBox(height: 20),
                      _buildDropdown(
                        value: _selectedSubfaculty,
                        items: _subfaculties[_selectedFaculty] ?? [],
                        hintText: 'Subfaculty',
                        icon: Icons.new_label,
                        onChanged: (value) {
                          setState(() {
                            _selectedSubfaculty = value;
                            _selectedSemester = null;
                            _selectedSubbranch = null;
                          });
                        },
                      ),
                      SizedBox(height: 20),
                      _buildDropdown(
                        value: _selectedSemester,
                        items: _semesters[_selectedSubfaculty] ?? [],
                        hintText: 'Semester',
                        icon: Icons.calendar_month,
                        onChanged: (value) {
                          setState(() {
                            _selectedSemester = value;
                            _selectedSubbranch = null;
                          });
                        },
                      ),
                      SizedBox(height: 20),
                      _buildDropdown(
                        value: _selectedSubbranch,
                        items: _subbranches[
                                '${_selectedFaculty}_${_selectedSubfaculty}_${_selectedSemester}'] ??
                            [],
                        hintText: 'Subbranch',
                        icon: Icons.branding_watermark,
                        onChanged: (value) {
                          setState(() {
                            _selectedSubbranch = value;
                          });
                        },
                      ),
                      SizedBox(height: 32),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: ElevatedButton(
                          onPressed: _signUp,
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor:
                                const Color.fromRGBO(66, 66, 66, 1),
                            minimumSize: Size(double.infinity, 50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                          child: Text('Sign Up'),
                        ),
                      ),
                      SizedBox(height: 40),
                      Row(
                        children: [
                          Expanded(
                            child: Divider(
                              color: Colors.grey.shade800,
                              thickness: 1,
                              indent: 30,
                              endIndent: 10,
                            ),
                          ),
                          Text(
                            'WELCOME BACK',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                          Expanded(
                            child: Divider(
                              color: Colors.grey.shade800,
                              thickness: 1,
                              indent: 10,
                              endIndent: 30,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 25),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginPage()),
                              );
                            },
                            child: Text(
                              'Already have an account',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginPage()),
                              );
                            },
                            child: Text(
                              'Sign In',
                              style: TextStyle(
                                color: Colors.white,
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
  }

  Future<void> _signUp() async {
    if (_formKey.currentState!.validate()) {
      try {
         UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text,
          password: _passwordController.text,
        );

        String uid = userCredential.user!.uid;


        await FirebaseFirestore.instance
            .collection('users')
            .doc(_nameController.text) // Set document ID to the user's name
            .set({
          'uid': uid,
          'email': _emailController.text,
          'name': _nameController.text,
          'faculty': _selectedFaculty,
          'subfaculty': _selectedSubfaculty,
          'semester': _selectedSemester,
          'subbranch': _selectedSubbranch,
          'rollno': _rollnoController.text,
          'profile_picture': '',
          'role': 'student',
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Signup Successful')),
        );
        // Navigate to another screen or perform other actions
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Home()),
        );
      } on FirebaseAuthException catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to sign up: ${e.message}')),
        );
      }
    }
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hintText,
    required IconData icon,
    bool obscureText = false,
    TextInputType keyboardType = TextInputType.text, // Define keyboardType parameter
    String? Function(String?)? validator,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        children: [
          Icon(
            icon,
            color: Colors.white,
            size: 25,
          ),
          SizedBox(width: 10),
          Expanded(
            child: TextFormField(
              controller: controller,
              obscureText: obscureText,
              keyboardType: keyboardType, // Use keyboardType parameter here
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: TextStyle(color: Colors.white70),
                filled: true,
                fillColor: Colors.grey.shade800,
                contentPadding: EdgeInsets.symmetric(vertical: 10).copyWith(
                  left: 20,
                ),
                // Adjust this value to decrease/increase height and add left padding
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                  borderSide: BorderSide.none,
                ),
              ),
              validator: validator,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDropdown({
    required String? value,
    required List<String> items,
    required String hintText,
    required IconData icon,
    required void Function(String?) onChanged,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Container(
        height: 50, // Adjust the height here
        child: Row(
          children: [
            Icon(
              icon,
              color: Colors.white,
              size: 25,
            ),
            SizedBox(width: 10),
            Expanded(
              child: DropdownButtonFormField<String>(
                value: value,
                onChanged: onChanged,
                items: items.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                decoration: InputDecoration(
                  hintText: hintText,
                  hintStyle: TextStyle(color: Colors.white70),
                  filled: true,
                  fillColor: Colors.grey.shade800,
                  contentPadding: EdgeInsets.symmetric(
                      vertical: 0,
                      horizontal: 20), // Adjust horizontal padding here
                  // isDense: true, // This will align the text vertically centered
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50.0),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}