import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DonationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Donation',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: screenWidth * 0.05, // Responsive font size
          ),
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
          padding: EdgeInsets.all(screenWidth * 0.04), // Responsive padding
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding:
                    EdgeInsets.all(screenWidth * 0.04), // Responsive padding
                decoration: BoxDecoration(
                  color: Color(0xFF323232),
                  borderRadius: BorderRadius.circular(
                      screenWidth * 0.05), // Responsive rounded corners
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Tell us about you',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: screenWidth * 0.04, // Responsive font size
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.015), // Responsive height
                    Text(
                      'You are stepping toward wellbeing, we thank you for your contribution',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: screenWidth * 0.04, // Responsive font size
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.02), // Responsive height
                    buildTextField(
                        context, 'Your Name*', screenWidth, screenHeight),
                    SizedBox(height: screenHeight * 0.001), // Responsive height
                    buildTextField(
                        context, 'Your Course*', screenWidth, screenHeight),
                    SizedBox(height: screenHeight * 0.001), // Responsive height
                    buildTextField(
                        context, 'Your Year*', screenWidth, screenHeight),
                    SizedBox(height: screenHeight * 0.001), // Responsive height
                    buildTextField(context, 'Your Roll Number*', screenWidth,
                        screenHeight),
                    SizedBox(height: screenHeight * 0.001), // Responsive height
                    buildTextField(
                        context,
                        'Your Branch/Specialization/Stream*',
                        screenWidth,
                        screenHeight),
                    SizedBox(height: screenHeight * 0.02), // Responsive height
                    Text(
                      'Donation Methods',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: screenWidth * 0.04, // Responsive font size
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.015), // Responsive height
                    Text(
                      'Give us a brief description of what you are donating to us so that we can put the resources in an appropriate section. We thank you for your help to your juniors.',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: screenWidth * 0.04, // Responsive font size
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.015), // Responsive height
                    Text(
                      'There are two ways you can give us your resources and help:',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: screenWidth * 0.04, // Responsive font size
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.015), // Responsive height
                    Text(
                      'Through Google Drive',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: screenWidth * 0.04, // Responsive font size
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.015), // Responsive height
                    Text(
                      'You can upload your material on your drive, make it public, and send us your drive link.',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: screenWidth * 0.04, // Responsive font size
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.015), // Responsive height
                    Text(
                      'Through Upload',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: screenWidth * 0.04, // Responsive font size
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.015), // Responsive height
                    Text(
                      'You can upload your pdfs directly here',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: screenWidth * 0.04, // Responsive font size
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.03), // Responsive height
                    buildTextField(
                      context,
                      'Description (tell us about whatever you are donating to us in brief)',
                      screenWidth,
                      screenHeight,
                      maxLines: 5,
                    ),
                    SizedBox(height: screenHeight * 0.001), // Responsive height
                    buildTextField(
                        context, 'Drive Link', screenWidth, screenHeight),
                    SizedBox(height: screenHeight * 0), // Responsive height
                    ElevatedButton.icon(
                      onPressed: () {
                        // Implement your image upload logic here
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 0, 0, 0),
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(screenWidth * 0.05),
                        ),
                      ),
                      icon: Icon(Icons.file_upload, color: Colors.white),
                      label: Text(
                        'Upload Pdf',
                        style: TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontSize: screenWidth * 0.04,
                        ),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    buildTextField(
                        context,
                        'Any other Information or Suggestion',
                        screenWidth,
                        screenHeight),
                    Padding(
                      padding: EdgeInsets.only(
                          top: screenHeight * 0.04), // Responsive padding
                      child: Center(
                        child: ElevatedButton(
                          onPressed: () {
                            // Handle add button press
                            // You can access the text fields' values here
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 0, 0, 0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(screenWidth *
                                  0.05), // Responsive rounded corners
                            ),
                            padding: EdgeInsets.symmetric(
                              horizontal:
                                  screenWidth * 0.1, // Responsive padding
                              vertical:
                                  screenHeight * 0.02, // Responsive padding
                            ),
                          ),
                          child: Text(
                            'Donate Now',
                            style: TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255),
                              fontSize:
                                  screenWidth * 0.04, // Responsive font size
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(BuildContext context, String hintText,
      double screenWidth, double screenHeight,
      {int maxLines = 1}) {
    return Container(
      margin: EdgeInsets.only(bottom: screenHeight * 0.02), // Responsive margin
      child: TextField(
        maxLines: maxLines,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            color: Colors.grey,
            fontSize: screenWidth * 0.04, // Responsive font size
          ),
          filled: true,
          fillColor: Colors.black,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
                screenWidth * 0.05), // Responsive rounded corners
            borderSide: BorderSide.none,
          ),
        ),
        style: TextStyle(
          color: Colors.white,
          fontSize: screenWidth * 0.04, // Responsive font size
        ),
      ),
    );
  }
}
