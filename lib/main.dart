import 'package:flutter/material.dart';
import 'package:outalma/views/screens/login_register/login.register.screen.dart';

void main() {
  runApp(const OutalmaApp());
}

class OutalmaApp extends StatelessWidget {
  const OutalmaApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Outalma',
      home: LoginRegisterScreen(),
    );
  }
}
