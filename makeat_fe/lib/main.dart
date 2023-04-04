import 'package:flutter/material.dart';
import 'package:makeat_fe/views/social_login_screen.dart';
import 'package:provider/provider.dart';

import 'package:makeat_fe/views/splash_screen.dart';
import 'package:makeat_fe/view_models/social_login_view_model.dart';

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
    return MaterialApp(
      // home: ChangeNotifierProvider(
      //   create: (context) => SocialLoginViewModel(),
      //   child: SocialLoginScreen(),
      // ),
      home: SplashScreen(),
    );
  }
}