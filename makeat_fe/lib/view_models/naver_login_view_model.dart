import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

import '../models/social_login_model.dart';


class NaverLoginViewModel extends ChangeNotifier {
  final naverLoginModel = SocialLoginModel();

  // 플랫폼에 따른 Redirect URI 설정
  String getRedirectUri() {
    if (Platform.isIOS) {
      return dotenv.env['NAVER_IOS_REDIRECT_URI']!;
    } else if (Platform.isAndroid) {
      return dotenv.env['NAVER_AOS_REDIRECT_URI']!;
    } else {
      throw UnsupportedError("");
    }
  }
  
  Future<void> loginWithNaver() async { 
    final clientId = dotenv.env['NAVER_CLIENT_ID']!;
    final redirectUri = getRedirectUri();
    // final clientSecret = dotenv.env['NAVER_CLIENT_SECRET']!;

    final url =
        'https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=$clientId&redirect_uri=$redirectUri&state=flutter_naver_login';
    
    final flutterWebviewPlugin = FlutterWebviewPlugin();

    // 플러터 웹뷰 실행
    flutterWebviewPlugin.launch(
      url,
      clearCache: true,
      clearCookies: true,
      withJavascript: true,
    );

    // onUrlChanged 이벤트
    flutterWebviewPlugin.onUrlChanged.listen((String url) {

      // 네이버 소셜 로그인 인증 성공
      if (url.startsWith('$redirectUri?code=')) {
        flutterWebviewPlugin.close();
        
        final _authCode = url.split('code=')[1].replaceFirst('&state=flutter_naver_login', '');
        print('NAVER 인증 코드는 $_authCode 입니다.');
        naverLoginModel.sendAuthCodeToBackend('naver', _authCode);
        
      // 네이버 소셜 로그인 인증 실패
      } else {
        print('NAVER/인증 코드가 반환되지 않았습니다.');
      }
    });
  }
}