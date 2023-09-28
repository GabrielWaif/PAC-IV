import 'dart:io';
import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final String title;
  final String description;
  final String imagePath;

  CustomCard({
    required this.title,
    required this.description,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title), // Title
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Image.file(File(imagePath),fit: BoxFit.cover,), // Image
          SizedBox(height: 12.0), // Adjust spacing as needed
          Text(description), // Description
        ],
      ),
      actions: <Widget>[
        ElevatedButton(
          onPressed: () {
            // Handle "Like" button press.
          },
          child: Text('Like'),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context); // Close the AlertDialog
          },
          child: Text('Sair'),
        ),
      ],
    );
  }
}