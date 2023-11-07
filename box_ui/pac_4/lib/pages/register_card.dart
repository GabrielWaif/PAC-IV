import 'dart:io';

import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String title = '';
  String description = '';
  XFile? pickedImage;

  // Function to open image picker.
  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      pickedImage = pickedFile;
    });
  }

  // Function to upload an image to Firebase Storage.
  Future<String?> uploadImageToStorage() async {
    if (pickedImage == null) {
      return null;
    }

    final storage = FirebaseStorage.instance;
    final imagePath = 'images/${pickedImage!.name}'; // Use the original filename
    final storageRef = storage.ref().child(imagePath);
    final UploadTask uploadTask = storageRef.putFile(File(pickedImage!.path));
    await uploadTask.whenComplete(() => null);
    return await storageRef.getDownloadURL();
  }

  // Function to add a card to Firestore.
  Future<void> addCardToFirestore(String imageUrl) async {
    final firestore = FirebaseFirestore.instance;
    final cardsCollection = firestore.collection('cards');

    await cardsCollection.add({
      'title': title,
      'description': description,
      'imagePath': imageUrl,
      'upvotes': 0,
      'downvotes': 0,
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
              child: Text('Escolha uma Imagem'),
            ),
            SizedBox(height: 16.0),
            pickedImage != null
                ? Image.file(File(pickedImage!.path),height: 300,)
                : Text('Nenhuma imagem selecionada'),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () async {
                if (title.isNotEmpty && description.isNotEmpty) {
                  final imageUrl = await uploadImageToStorage();
                  if (imageUrl != null) {
                    await addCardToFirestore(imageUrl);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Carta adicionada'),
                      ),
                    );
                    Navigator.pushNamed(context, '/dialog');
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Falha no upload da imagem'),
                      ),
                    );
                  }
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Preencha todos os campos'),
                    ),
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
