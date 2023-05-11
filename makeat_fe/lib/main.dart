import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:makeat_fe/views/home_screen.dart';
import 'package:provider/provider.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';

import 'models/bottom_navigation_index.dart';
import 'view_models/kakao_login_view_model.dart';
import 'view_models/naver_login_view_model.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load();
  KakaoSdk.init(nativeAppKey: dotenv.env['KAKAO_CLIENT_ID']!);

  runApp(MultiProvider(
    /* 앱 전체에 대한 Provider 선언 */
    providers: [
      ChangeNotifierProvider(create: (context) => KakaoLoginViewModel()),
      ChangeNotifierProvider(create: (context) => NaverLoginViewModel()),
      ChangeNotifierProvider(
          create: (context) => CustomBottomNavigationBarModel()),
    ],
    child: MAKEAT(),
  ));
}

// ignore: use_key_in_widget_constructors
class MAKEAT extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

        /* 페이지 이동 시 애니메이션 제거 적용 */
        theme: ThemeData(
          pageTransitionsTheme: NoAnimationTransition(),
        ),
        home: const HomeScreen()
        );
  }
}

/* 페이지 이동시 애니메이션 제거 */
class NoAnimationTransition extends PageTransitionsTheme {
  @override
  Widget buildTransitions<T>(
    route,
    context,
    animation,
    secondaryAnimation,
    child,
  ) {
    return child;
  }
}
