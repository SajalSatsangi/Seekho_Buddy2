import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MaterialConfirmationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * 0.05,
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.04,
                right: MediaQuery.of(context).size.width * 0.04,
                top: MediaQuery.of(context).size.height * 0.02,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.arrow_back_ios, color: Colors.white),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.02),
                      Text(
                        "Material Confirmation",
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.06,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.03,
                vertical: MediaQuery.of(context).size.width * 0.02,
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search...",
                  hintStyle: TextStyle(color: Colors.white),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.white,
                    size: MediaQuery.of(context).size.width * 0.05,
                  ),
                  filled: true,
                  fillColor: Color(0xFF323232),
                  contentPadding:
                      EdgeInsets.all(MediaQuery.of(context).size.width * 0.02),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                        MediaQuery.of(context).size.width * 0.08),
                    borderSide: BorderSide(color: Color(0xFF323232)),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.05,
                top: MediaQuery.of(context).size.width * 0.06,
                bottom: MediaQuery.of(context).size.width * 0.02,
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Material Confirmation Requests",
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.05,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: mockData.length,
                itemBuilder: (context, index) {
                  var material = mockData[index];
                  return Padding(
                    padding: EdgeInsets.fromLTRB(
                        MediaQuery.of(context).size.width * 0.03,
                        0,
                        MediaQuery.of(context).size.width * 0.03,
                        0),
                    child: Container(
                      padding: EdgeInsets.all(
                          MediaQuery.of(context).size.width * 0.04),
                      decoration: BoxDecoration(
                        color: Color(0xFF323232),
                        borderRadius: BorderRadius.circular(
                            MediaQuery.of(context).size.width * 0.03),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(width: 16),
                              TextButton(
                                onPressed: () {
                                  _showMaterialPopup(
                                    context,
                                    NetworkImage(material['materialImage']),
                                  );
                                },
                                style: TextButton.styleFrom(
                                  backgroundColor: Colors.black,
                                ),
                                child: Text(
                                  "View Material",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                "Student Name: ${material['studentId']}",
                                style: TextStyle(
                                  color: Colors.white70,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                "Institution: DEI",
                                style: TextStyle(
                                  color: Colors.white70,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              IconButton(
                                icon: Icon(Icons.check, color: Colors.green),
                                onPressed: () {
                                  _updateMaterialStatus(material['id'], true);
                                },
                              ),
                              SizedBox(
                                  height:
                                      MediaQuery.of(context).size.width * 0.02),
                              IconButton(
                                icon: Icon(Icons.close, color: Colors.red),
                                onPressed: () {
                                  _updateMaterialStatus(material['id'], false);
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.black87,
    );
  }

  void _updateMaterialStatus(String materialId, bool isApproved) {
    String formattedDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
    print('Material ID: $materialId');
    print('Status: ${isApproved ? "Approved" : "Rejected"}');
    print('Date: $formattedDate');
  }

  void _showMaterialPopup(BuildContext context, ImageProvider image) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Material Information"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              InteractiveViewer(
                child: Image(image: image),
                boundaryMargin:
                    EdgeInsets.all(MediaQuery.of(context).size.width * 0.02),
                minScale: 0.1,
                maxScale: 5.0,
              ),
              SizedBox(height: MediaQuery.of(context).size.width * 0.02),
              Text("Name: XYZ"),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Close"),
            ),
          ],
        );
      },
    );
  }

  final List<Map<String, dynamic>> mockData = [
    {
      'id': '1',
      'studentId': '12345',
      'materialImage': 'https://via.placeholder.com/150'
    },
    {
      'id': '2',
      'studentId': '67890',
      'materialImage': 'https://via.placeholder.com/150'
    },
  ];
}

void main() {
  runApp(MaterialApp(
    home: MaterialConfirmationScreen(),
    theme: ThemeData.dark(),
  ));
}
