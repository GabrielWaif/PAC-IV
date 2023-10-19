import 'package:flutter/material.dart';
import 'package:pac_4/pages/login_page.dart';
import 'package:pac_4/pages/registration_page.dart';

import 'pages/custom_card.dart';
import 'pages/register_card.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginPage(),
        '/dialog': (context) => const DialogExample(),
        '/register': (context) => const RegistrationPage(),
        '/card-register': (context) => const RegisterScreen(),
      },
      theme: ThemeData(
        primaryColor: Colors.blue[800],
        brightness: Brightness.light,
        iconTheme: IconThemeData(
          color: Colors.blue[800], // Set the default icon color to green
        ),
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.blue[800]
        ),
        appBarTheme: AppBarTheme(backgroundColor:  Colors.blue[800]),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.blue[800]), // Set the default background color
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50.0), // Adjust the value to make it more or less circular
              ),
            ),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme( 
          labelStyle: TextStyle(color: Color(0xFF1565C0)),
           // Set label text color
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color:Color(0xFF1565C0)),
            borderRadius: BorderRadius.circular(10.0), // Border radius // Set border color when the field is enabled
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFF1565C0)), // Border color when the field is focused
            borderRadius: BorderRadius.circular(10.0), // Border radius
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey), // Default border color
            borderRadius: BorderRadius.circular(10.0), // Border radius
            gapPadding: 10.0, // Adjust this value to control the box shadow spread
          ),
          // Add a box shadow to the focused field
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red), // Border color when the field is focused
            borderRadius: BorderRadius.circular(10.0), // Border radius
            gapPadding: 10.0, // Adjust this value to control the box shadow spread
          ),
        )
      ),
      
    );
  }
}

class DialogExample extends StatelessWidget {
  const DialogExample({super.key});

  void goToRegisterCard(BuildContext context) {
    Navigator.pushNamed(context, '/card-register'); // Use '/card-register' to match the route you defined in MaterialApp
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shuffle'),
      ),
      body:
      Stack(
        children: <Widget>[
       Hero(
            tag: 'cardHero',
            child: Material(
              color: Colors.transparent,
              child: Ink.image(
                image: AssetImage('./assets/carta.jpg'), // Your background image
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity, // Adjust the height as needed
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CustomCard(
                          title: 'carta teste',
                          description: 'Carta de teste pros guri',
                          imagePath: './assets/lanso.jpg',
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
      const Spacer(), // Add a spacer to push the button to the bottom
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20.0),
              child: RawMaterialButton(
                 onPressed: () => goToRegisterCard(context),
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(16.0),
                constraints: const BoxConstraints(minWidth: 0, minHeight: 0),
                child: Icon(Icons.add, size: 40, color: Colors.white), // Adjust size as needed
                fillColor: Colors.blue[800],
            ),
            ),
          ),
      ]
    )
    );
  }
  
}
