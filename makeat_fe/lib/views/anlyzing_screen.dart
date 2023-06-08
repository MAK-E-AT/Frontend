import 'dart:typed_data';

import 'package:flutter/material.dart';

import 'analyzed_image_screen.dart';
import '../common/no_animation_page_route.dart';

class AnalyzingScreen extends StatefulWidget {
  final String selectedDate;
  final Future<Uint8List>? photo;

  const AnalyzingScreen({
    super.key,
    required this.selectedDate,
    required this.photo,
  });

  @override
  // ignore: library_private_types_in_public_api
  _AnalyzingScreenState createState() => _AnalyzingScreenState();
}

class _AnalyzingScreenState extends State<AnalyzingScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.push(
        context,
        NoAnimationPageRoute(
            builder: (context) => AnalyzedImageScreen(
                  selectedDate: widget.selectedDate,
                  photo: widget.photo,
                ),
            settings: const RouteSettings(name: 'analyzed_image_screen')),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            body: SafeArea(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /* MAK-E-AT 로고(대) */
            Image.asset(
              width: 250.0,
              height: 250.0,
              'assets/images/sample_icons/analyze_Icon2.gif',
            ),
            const SizedBox(
              height: 50.0,
            ),
            const SizedBox(
              height: 50.0,
            ),
          ],
        ),
      ),
    )));
  }
}
