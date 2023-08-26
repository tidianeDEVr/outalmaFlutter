import 'package:flutter/material.dart';

class NotFoundScreen extends StatelessWidget {
  const NotFoundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Une erreur s\'est produite ! Veuillez réessayer plus tard.'),
    );
  }
}
