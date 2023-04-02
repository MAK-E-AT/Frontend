import 'package:flutter/material.dart';



class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    /* 1초 후에 (간편)로그인 화면으로 이동 */
    // Future.delayed(const Duration(seconds: 1), () {
    //   Navigator.push(
    //     context,
    //     MaterialPageRoute(builder: (context) => const LoginPage()),
    //   );
    // });
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
                Image.asset(
                  width: 200.0,
                  height: 200.0,
                  'assets/images/makeat_logo/logo_big_size.png',
                ),
                const SizedBox(height: 50.0,),

                /* Progress Indicator(원형) */
                const CircularProgressIndicator(
                  color: Colors.black12,
                ),
                const SizedBox(height: 50.0,),
              ],
            ),
          ),
        )
      )
    );
  }
}