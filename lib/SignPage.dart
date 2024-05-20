import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:seekhobuddy/LoginPage.dart';

void main() {
  runApp(SignUpPage());
}

class SignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'StudyHub',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.black,
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
                        icon: Icons.menu_book_sharp,
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
                        icon: Icons.search,
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
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
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Processing Data')),
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.grey.shade800,
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

  Widget _buildTextField({
    required TextEditingController controller,
    required String hintText,
    required IconData icon,
    bool obscureText = false,
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
