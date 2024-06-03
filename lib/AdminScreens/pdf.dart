import 'package:flutter/material.dart';

class MaterialDetailScreen extends StatelessWidget {
  final String imageUrl;

  MaterialDetailScreen({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Material Detail"),
        backgroundColor: Colors.black87,
      ),
      body: Center(
        child: InteractiveViewer(
          child: Image.network(imageUrl),
          boundaryMargin:
              EdgeInsets.all(MediaQuery.of(context).size.width * 0.02),
          minScale: 0.1,
          maxScale: 5.0,
        ),
      ),
      backgroundColor: Colors.black87,
    );
  }
}
