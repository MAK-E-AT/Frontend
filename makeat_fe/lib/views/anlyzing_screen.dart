import 'package:flutter/material.dart';
import 'package:makeat_fe/views/analyzed_image_screen.dart';

import '../common/no_animation_page_route.dart';

class AnalyzingScreen extends StatefulWidget {
  const AnalyzingScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AnalyzingScreenState createState() => _AnalyzingScreenState();
}

class _AnalyzingScreenState extends State<AnalyzingScreen> {
  @override
  void initState() {
    super.initState();
    /* 1초 후에 (간편)로그인 화면으로 이동 */
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.push(
        context,
        NoAnimationPageRoute(
            builder: (context) => const AnalyzedImageScreen(),
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
              width: 300.0,
              height: 300.0,
              'assets/images/sample_icons/analyze_icon.gif',
            ),
            const SizedBox(
              height: 50.0,
            ),

            /* Progress Indicator(원형) */
            const SizedBox(
              height: 50.0,
            ),
          ],
        ),
      ),
    )));
  }
}
