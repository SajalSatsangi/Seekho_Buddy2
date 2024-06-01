import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class DonationPage extends StatefulWidget {
  @override
  _DonationPageState createState() => _DonationPageState();
}

class _DonationPageState extends State<DonationPage> {
  @override
  void initState() {
    super.initState();
    // Enable hybrid composition.
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Donation',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor:
            const Color(0xFF000000), // Set the background color to black
      ),
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: 750.0,
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Color(0xFF323232),
                  borderRadius: BorderRadius.circular(16.0), // Rounded corners
                ),
                child: WebView(
                  initialUrl: 'https://docs.google.com/forms/d/e/1FAIpQLScmnapMdHfEHTb9kK2dG1hdmoLNfOzvk6-6jrR8_U5iWcV_6A/viewform?usp=sf_link', // Replace with your Google Form URL
                  javascriptMode: JavascriptMode.unrestricted,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}