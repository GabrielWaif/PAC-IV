import 'package:flutter/material.dart';
import 'package:pac_4/pages/login_page.dart';
import 'package:pac_4/pages/registration_page.dart';
import 'package:pac_4/pages/dialog_page.dart';

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
