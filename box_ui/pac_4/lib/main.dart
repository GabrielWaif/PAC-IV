import 'package:flutter/material.dart';
import 'package:pac_4/pages/login_page.dart';
import 'package:pac_4/pages/registration_page.dart';

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
        onPressed: () => showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: const Text('Título da carta'),
            content: Column(
              children: <Widget>[
                const Text('Descrição da Carta'),
                const SizedBox(height: 20), // Espaço entre texto e imagem
                Image.asset(
                    './assets/lanso.jpg'), // Substitua pelo caminho da sua imagem
              ],
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context, 'Cancel'),
                child: const Text('Sair'),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context, 'OK'),
                child: const Text('Like'),
              ),
            ],
          ),
        ),
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