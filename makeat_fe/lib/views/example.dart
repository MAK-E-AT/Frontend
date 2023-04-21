import 'package:flutter/material.dart';
import '../widgets/custom_navigation_bar.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My App'),
      ),
      body: const Center(
        child: Text('Hello, World!'),
      ),
      bottomNavigationBar: const CustomNavigationBar(),
    );
  }
}