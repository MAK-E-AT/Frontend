import 'dart:io';

import 'package:flutter/material.dart';
import 'package:makeat_fe/views/additional_user_info_screen.dart';
import 'package:provider/provider.dart';

import '../common/no_animation_page_route.dart';
import '../widgets/custom_login_button.dart';
import '../view_models/kakao_login_view_model.dart';
import '../view_models/naver_login_view_model.dart';


class SocialLoginScreen extends StatelessWidget {
  const SocialLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final viewModel = Provider.of<SocialLoginViewModel>(context);
    final kakaoLoginViewModel = Provider.of<KakaoLoginViewModel>(context, listen: false);
    final naverLoginViewModel = Provider.of<NaverLoginViewModel>(context, listen: false);

    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                /* MAK-E-AT 로고(대) */
                const SizedBox(height: 80.0),
                Image.asset(
                  width: 200.0,
                  height: 200.0,
                  'assets/images/makeat_logo/logo_big_size.png',
                ),
                const SizedBox(height: 120.0,),

                /* KAKAO 소셜 로그인 버튼 */
                CustomLoginButton(
                  buttonText1: '', 
                  buttonText2: '', 
                  onTap: () async { 
                    kakaoLoginViewModel.loginWithKakao();
                    // Navigator.push(
                    //   context,
                    //   NoAnimationPageRoute(
                    //     builder: (context) => const AdditionalUserInfoScreen(),
                    //     settings: const RouteSettings(name: 'additional_user_info_screen')
                    //   ),
                    // );
                  }, 
                  imageURL: 'assets/images/social_login/kakao_login.png', 
                  buttonColor: const Color(0xfffee500),
                ),
                const SizedBox(height: 10.0),

                /* Naver 소셜 로그인 버튼 */
                CustomLoginButton(
                  buttonText1: '', 
                  buttonText2: '  네이버로 시작하기       ', 
                  onTap: () async { 
                    naverLoginViewModel.loginWithNaver();
                    // Navigator.push(
                    //   context,
                    //   NoAnimationPageRoute(
                    //     builder: (context) => const AdditionalUserInfoScreen(),
                    //     settings: const RouteSettings(name: 'additional_user_info_screen')
                    //   ),
                    // );
                  }, 
                  imageURL: 'assets/images/social_login/naver_login.png', 
                  buttonColor: const Color(0xff03c75a),
                ),
                const SizedBox(height: 10.0),

                /* Apple 소셜 로그인 버튼 */
                if (Platform.isIOS) ...[
                  CustomLoginButton(
                    buttonText1: '  Apple', 
                    buttonText2: '로 시작하기      ', 
                    onTap: () async { 
                      kakaoLoginViewModel.loginWithKakao();
                      naverLoginViewModel.loginWithNaver();
                    }, 
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