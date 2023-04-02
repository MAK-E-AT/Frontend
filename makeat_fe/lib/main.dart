import 'package:flutter/material.dart';

import 'package:makeat_fe/views/splash_screen.dart';


void main() {
  runApp(const MaterialApp(
    title: 'MAK-E-AT',
    home: SplashScreen(),
  ));
}

class MAKEAT extends StatelessWidget {
  const MAKEAT({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SplashScreen(),
    );
  }
}