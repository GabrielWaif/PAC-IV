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
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
       TextButton(
        onPressed:() => {
           Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CustomCard(
                        title: 'carta teste',
                        description: 'Carta de teste pros guri',
                        imagePath: './assets/lanso.jpg',
                      ),
                    ),
           )
        },
        child: const Text('Abrir Carta'),
      ),
      TextButton(
        onPressed: () => goToRegisterCard(context),
        child: const Text('Escrever carta'),
      ),
      ]
    )
    );
  }
  
}
