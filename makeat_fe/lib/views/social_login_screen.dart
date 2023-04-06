import 'dart:io';

import 'package:flutter/material.dart';

import '../view_models/apple_login_view_model.dart';
import '../view_models/naver_login_view_model.dart';
import '../widgets/custom_login_button.dart';
// import 'package:provider/provider.dart';


import 'package:makeat_fe/view_models/kakao_login_view_model.dart';


class SocialLoginScreen extends StatelessWidget {
  const SocialLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final viewModel = Provider.of<SocialLoginViewModel>(context);
    final KakaoLoginViewModel kakaoViewModel = KakaoLoginViewModel();
    final NaverLoginViewModel naverViewModel = NaverLoginViewModel();
    final AppleLoginViewModel appleViewModel = AppleLoginViewModel();

    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                /* MAK-E-AT 로고 */
                const SizedBox(height: 80.0),
                Image.asset(
                  width: 200.0,
                  height: 200.0,
                  'assets/images/makeat_logo/logo_big_size.png',
                ),
                const SizedBox(height: 120.0,),

                // /* KAKAO 소셜 로그인 */
                CustomLoginButton(
                  buttonText1: '', 
                  buttonText2: '', 
                  // onTap: kakaoViewModel.signIn(), 
                  onTap: appleViewModel.signIn(), 
                  imageURL: 'assets/images/social_login/kakao_login.png', 
                  buttonColor: const Color(0xfffee500),
                ),
                const SizedBox(height: 10.0),

                CustomLoginButton(
                  buttonText1: '', 
                  buttonText2: '  네이버로 시작하기       ', 
                  onTap: appleViewModel.signIn(), 
                  imageURL: 'assets/images/social_login/naver_login.png', 
                  buttonColor: const Color(0xff03c75a),
                ),
                const SizedBox(height: 10.0),

                if (Platform.isIOS) ...[
                  CustomLoginButton(
                    buttonText1: '  Apple', 
                    buttonText2: '로 시작하기      ', 
                    onTap: appleViewModel.signIn(), 
                    imageURL: 'assets/images/social_login/apple_login.png', 
                    buttonColor: const Color(0xff000000),
                  ),
                  const SizedBox(height: 10.0),
                ],
              ],
            ),
          ),
        )
      )
    );
  }
}