import 'dart:ffi';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

import 'custom_card.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

void _handleRegistration(BuildContext context) {
  Navigator.pop(context);
}

class _RegisterScreenState extends State<RegisterScreen> {
  // Define variables to store user input and image.
  bool previewedCard = false;
  String title = '';
  String description = '';
  XFile? pickedImage;

  // Function to request image picker permission.
  Future<void> requestImagePermission() async {
    final status = await Permission.camera.request();
    if (status.isGranted) {
      // Permission granted.
    } else {
      // Permission denied.
      // Handle the denial.
    }
  }

  // Function to open image picker.
  Future<void> _pickImage() async {
    await requestImagePermission();
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      pickedImage = pickedFile;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Escrever Carta'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(labelText: 'Título'),
              onChanged: (value) {
                setState(() {
                  title = value;
                });
              },
            ),
            SizedBox(height: 16.0),
            TextFormField(
              decoration: InputDecoration(labelText: 'Descrição'),
              onChanged: (value) {
                setState(() {
                  description = value;
                });
              },
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _pickImage,
              child: Text('Escolha uma Imagen'),
            ),
            SizedBox(height: 16.0),
            pickedImage != null ? Text('') : Text('No image selected'),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                if (title.isNotEmpty &&
                    description.isNotEmpty &&
                    pickedImage != null) {
                  previewedCard = true;
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CustomCard(
                        title: title,
                        description: description,
                        imagePath: pickedImage!.path,
                      ),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('Preencha todos os campos'),
                  )
                  );
                }
              },
              child: Text('Vizualizar carta'),
            ),
            ElevatedButton(
              onPressed: () {
                if (previewedCard == true) {
                  _handleRegistration(context);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('Visualize a carta primeiramente'),
                  )
                  );
                }
              },
              child: Text('Enviar carta'),
            ),
          ],
        ),
      ),
    );
  }
}
