import 'package:flutter/material.dart';

class PdfViewer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'PDF Note',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.grey[900],
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () {
            // Navigate back when the back button is pressed
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'PDF View Here',
              style: TextStyle(fontSize: 24, color: Colors.white),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.grey[900], // Setting the background color to grey
    );
  }
}
