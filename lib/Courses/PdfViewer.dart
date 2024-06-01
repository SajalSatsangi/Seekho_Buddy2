import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';

class PdfViewer extends StatelessWidget {
  final String pdfName;
  final String pdfLink;

  PdfViewer({
    required this.pdfName,
    required this.pdfLink,
  });
  @override
  Widget build(BuildContext context) {
    print(pdfLink);
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          // Add a back button
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          pdfName, // Display keyValue in the app bar
          style: TextStyle(color: Colors.white), // Set text color to white
        ), // Display keyValue in the app bar
      ),
      body: PDF().cachedFromUrl(
        pdfLink,
        placeholder: (progress) =>
            Center(child: CircularProgressIndicator(value: progress)),
        errorWidget: (error) =>
            Center(child: Text("Error loading PDF: $error")),
      ),
    );
  }
}
