import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';

class PdfViewer extends StatelessWidget {
  final String keyValue; // Value to display in the app bar
  final String value; // URL to the PDF file

  PdfViewer({required this.keyValue, required this.value});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(keyValue), // Display keyValue in the app bar
      ),
      body: PDF().cachedFromUrl(
        value,
        placeholder: (progress) => Center(child: CircularProgressIndicator(value: progress)),
        errorWidget: (error) => Center(child: Text("Error loading PDF: $error")),
      ),
    );
  }
}
