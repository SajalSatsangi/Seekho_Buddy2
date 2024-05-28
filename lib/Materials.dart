import 'package:flutter/material.dart';
import 'PdfViewer.dart';

class Materials extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Materials',
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
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(68.0),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search...',
                hintStyle: TextStyle(
                    color: Colors.white), // Set search text color to white
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
                contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
              ),
            ),
          ),
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 25.0),
            child: ListTile(
              leading: Icon(Icons.folder,
                  color: Colors.white), // Set folder icon color to white
              title: Text(
                'Test',
                style: TextStyle(color: Colors.white),
              ),
              trailing: TextButton(
                onPressed: () {
                  // Navigate to PdfViewer page when button is clicked
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PdfViewer()),
                  );
                },
                child: Text(
                  'View',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                style: TextButton.styleFrom(
                  backgroundColor: Colors.grey[800],
                ),
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.folder,
                color: Colors.white), // Set folder icon color to white
            title: Text(
              'Test Subject',
              style: TextStyle(color: Colors.white),
            ),
            trailing: TextButton(
              onPressed: () {
                // Navigate to PdfViewer page when button is clicked
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PdfViewer()),
                );
              },
              child: Text(
                'View',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              style: TextButton.styleFrom(
                backgroundColor: Colors.grey[800],
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.folder,
                color: Colors.white), // Set folder icon color to white
            title: Text(
              'asdadsad',
              style: TextStyle(color: Colors.white),
            ),
            trailing: TextButton(
              onPressed: () {
                // Navigate to PdfViewer page when button is clicked
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PdfViewer()),
                );
              },
              child: Text(
                'View',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              style: TextButton.styleFrom(
                backgroundColor: Colors.grey[800],
              ),
            ),
          ),
        ],
      ),
      backgroundColor:
          Colors.grey[900], // Setting the background color to black
    );
  }
}
