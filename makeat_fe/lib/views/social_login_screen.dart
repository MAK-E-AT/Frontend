import 'dart:io';

import 'package:flutter/material.dart';
import 'package:makeat_fe/widgets/social_login_button.dart';
import 'package:provider/provider.dart';
import 'package:makeat_fe/view_models/social_login_view_model.dart';


class SocialLoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final viewModel = Provider.of<SocialLoginViewModel>(context);

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

                /* KAKAO 소셜 로그인 */
                SocialLoginButton(
                  buttonText1: '', 
                  buttonText2: '', 
                  // onTap: onTap, 
                  // https://developers.kakao.com/tool/resource/kakaosync
                  // kakao_login_large_narrow.png
                  imageURL: 'assets/images/social_login/kakao_login.png', 
                  buttonColor: Color(0xfffee500),
                ),
                SizedBox(height: 10.0),

                /* Naver 소셜 로그인 */
                SocialLoginButton(
                  buttonText1: '', 
                  buttonText2: '  네이버로 시작하기       ', 
                  // onTap: onTap, 
                  // 2021_Login_with_naver_guidelines_Kr
                  // btnG_아이콘사각.png
                  imageURL: 'assets/images/social_login/naver_login.png', 
                  buttonColor: Color(0xff03c75a),
                ),
                SizedBox(height: 10.0),

                /* Apple 소셜 로그인 */
                
                if (Platform.isIOS) ...[
                  SocialLoginButton(
                    buttonText1: '  Apple', 
                    buttonText2: '로 시작하기      ', 
                    // onTap: onTap, 
                    // Sign in with Apple - Logo Only
                    // PNG/3x/Logo-SIWA-Logo-only-White@3x.png
                    imageURL: 'assets/images/social_login/apple_login.png', 
                    buttonColor: Color(0xff000000),
                  ),
                  SizedBox(height: 10.0),
                ],
                
              ],
            ),
          ),
        )
      )
    );
  }
}