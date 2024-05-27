import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:seekhobuddy/home.dart';
import 'dart:async';

class EmailVerificationPage extends StatefulWidget {
  final User user;
  final String nameController;
  final String? selectedFaculty;
  final String? selectedSubfaculty;
  final String? selectedSemester;
  final String? selectedSubbranch;
  final String rollno;

  EmailVerificationPage({
    required this.user,
    required this.nameController,
    required this.selectedFaculty,
    required this.selectedSubfaculty,
    required this.selectedSemester,
    required this.selectedSubbranch,
    required this.rollno,
  });

  @override
  _EmailVerificationPageState createState() => _EmailVerificationPageState();
}

class _EmailVerificationPageState extends State<EmailVerificationPage> {
  bool _isLoading = false;
  Timer? _timer;
  int _retryCount = 0;

  @override
  void initState() {
    super.initState();
    _sendVerificationEmail();
    _startEmailVerificationCheck();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  Future<void> _sendVerificationEmail() async {
    try {
      await widget.user.sendEmailVerification();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Verification email sent. Please check your email.')),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'too-many-requests') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Too many requests. Please try again later.')),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to send verification email: ${e.message}')),
        );
      }
    }
  }

  void _startEmailVerificationCheck() {
    _timer = Timer.periodic(Duration(seconds: 5), (timer) async {
      await widget.user.reload();
      var user = FirebaseAuth.instance.currentUser;

      if (user != null && user.emailVerified) {
        timer.cancel();
        _onEmailVerified();
      }
    });
  }

  Future<void> _onEmailVerified() async {
    setState(() {
      _isLoading = true;
    });

    await FirebaseFirestore.instance.collection('users').doc(widget.nameController).set({
      'uid': widget.user.uid,
      'email': widget.user.email,
      'name': widget.nameController,
      'faculty': widget.selectedFaculty,
      'subfaculty': widget.selectedSubfaculty,
      'semester': widget.selectedSemester,
      'subbranch': widget.selectedSubbranch,
      'rollno': widget.rollno,
    });

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => Home()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF161616),
      body: SafeArea(
        child: Center(
          child: _isLoading
              ? CircularProgressIndicator()
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Verify Your Email',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'A verification link has been sent to ${widget.user.email}. Please check your email and verify your account.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Waiting for email verification...',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
