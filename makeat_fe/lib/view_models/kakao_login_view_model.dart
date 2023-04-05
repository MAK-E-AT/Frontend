import 'package:flutter/material.dart';
import 'package:flutter_web_auth_2/flutter_web_auth_2.dart';

class KakaoLoginViewModel extends ChangeNotifier {

  final String kakaoClientId = 'YOUR_KAKAO_CLIENT_ID';
  final String kakaoRedirectUri = 'YOUR_KAKAO_REDIRECT_URI';

  Future<String?> signInWithKakao() async {
    final url = Uri.https('kauth.kakao.com', '/oauth/authorize', {
      'client_id': kakaoClientId,
      'response_type': 'code',
      'redirect_uri': kakaoRedirectUri,
    });

    final result = await FlutterWebAuth2.authenticate(
      url: url.toString(), 
      callbackUrlScheme: 'https'
    );

    return Uri.parse(result).queryParameters['code'];
  }
}