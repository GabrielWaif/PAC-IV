import 'package:box_ui/box_ui.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CustomCard extends StatefulWidget {
  final String title;
  final String description;
  final String imagePath;
  final int upvotes;
  final int downvotes;
  final DocumentReference cardReference;

  CustomCard({
    required this.title,
    required this.description,
    required this.imagePath,
    required this.upvotes,
    required this.downvotes,
    required this.cardReference,
  });

  @override
  _CustomCardState createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  final storage = FirebaseStorage;

  late int upvotes;
  late int downvotes;

  @override
  void initState() {
    super.initState();
    upvotes = widget.upvotes;
    downvotes = widget.downvotes;
  }

  void handleUpvote() {
    widget.cardReference.update({
      'upvotes': upvotes + 1,
    }).then((_) {
      setState(() {
        upvotes += 1;
      });
    });
  }

  void handleDownvote() {
    widget.cardReference.update({
      'downvotes': downvotes + 1,
    }).then((_) {
      setState(() {
        downvotes += 1;
      });
    });
  }

  @override
Widget build(BuildContext context) {
  final firebaseStorageURL = '${widget.imagePath}';
  return AlertDialog(
    title: Text(widget.title), // Title
    content: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Image.network(
          firebaseStorageURL,

          fit: BoxFit.fill,
        ), // Image from URL
        SizedBox(height: 12.0), // Adjust spacing as needed
        Text(widget.description), // Description
      ],
    ),
    actions: <Widget>[
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          ElevatedButton(
            onPressed: handleUpvote,
            child: Row(
              children: [
                Icon(Icons.arrow_upward, color: secondaryColor), // Thumbs-up icon
                SizedBox(width: 8.0), // Adjust spacing as needed
                Text('$upvotes', style: TextStyle(color: secondaryColor),), // Number of upvotes
              ],
            ),
          ),
          SizedBox(width: 8.0), // Add spacing between buttons
          ElevatedButton(
            onPressed: handleDownvote,
            child: Row(
              children: [
                Icon(Icons.arrow_downward, color: secondaryColor), // Thumbs-down icon
                SizedBox(width: 8.0), // Adjust spacing as needed
                Text('$downvotes', style: TextStyle(color: secondaryColor),), // Number of downvotes
            
              ],
            ),
          ),
          SizedBox(width: 8.0),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context); // Close the AlertDialog
            },
          child: Text('Fechar'),
          ),
        ],
      ),
    ],
  );
}

}
