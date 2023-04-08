import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';

import 'package:provider/provider.dart';


import 'view_models/kakao_login_view_model.dart';
import 'views/splash_screen.dart';
import 'views/social_login_screen.dart';
import 'views/additional_user_info_screen.dart';



// Future<void> main() async {
//   await dotenv.load();
//   runApp(const MaterialApp(
//     title: 'MAK-E-AT',
//     home: SocialLoginScreen(),
//   ));
// }

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load();
  KakaoSdk.init(nativeAppKey: dotenv.env['KAKAO_CLIENT_ID']!);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => KakaoLoginViewModel()),
      ],
      child: const MAKEAT(),
    )
  );
}

class MAKEAT extends StatelessWidget {
  const MAKEAT({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SocialLoginScreen(),
    );
  }
}