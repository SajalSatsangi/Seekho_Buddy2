import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:seekhobuddy/home.dart';
import 'dart:async';

class EmailVerificationPage extends StatefulWidget {
  final User user;

  EmailVerificationPage({required this.user});

  @override
  _EmailVerificationPageState createState() => _EmailVerificationPageState();
}

class _EmailVerificationPageState extends State<EmailVerificationPage> {
  bool _isEmailVerified = false;
  bool _canResendEmail = false;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _checkEmailVerified();

    _timer = Timer.periodic(Duration(seconds: 3), (timer) {
      _checkEmailVerified();
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  Future<void> _checkEmailVerified() async {
    User? user = FirebaseAuth.instance.currentUser;
    await user?.reload();
    setState(() {
      _isEmailVerified = user?.emailVerified ?? false;
    });

    if (_isEmailVerified) {
      _timer.cancel();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Home()),
      );
    }
  }

  Future<void> _resendVerificationEmail() async {
    try {
      await widget.user.sendEmailVerification();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Verification email sent. Please check your email.')),
      );
      setState(() {
        _canResendEmail = false;
      });
      await Future.delayed(Duration(seconds: 60));
      setState(() {
        _canResendEmail = true;
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to resend verification email.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF161616),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'A verification email has been sent to ${widget.user.email}. Please verify your email to continue.',
                style: TextStyle(color: Colors.white),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              if (!_isEmailVerified)
                ElevatedButton(
                  onPressed: _canResendEmail ? _resendVerificationEmail : null,
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: const Color.fromRGBO(66, 66, 66, 1),
                    minimumSize: Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  child: Text('Resend Verification Email'),
                ),
              if (_isEmailVerified)
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => Home()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: const Color.fromRGBO(66, 66, 66, 1),
                    minimumSize: Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  child: Text('Email Verified! Continue'),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
