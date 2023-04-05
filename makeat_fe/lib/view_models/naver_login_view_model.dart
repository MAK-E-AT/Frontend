import 'package:flutter/material.dart';
import 'package:flutter_web_auth_2/flutter_web_auth_2.dart';

class NaverLoginViewModel extends ChangeNotifier {

  final String naverClientId = 'YOUR_NAVER_CLIENT_ID';
  final String naverClientSecret = 'YOUR_NAVER_CLIENT_SECRET';
  final String naverRedirectUri = 'YOUR_NAVER_REDIRECT_URI';

  Future<String?> signInWithNaver() async {
    final url = Uri.https('nid.naver.com', '/oauth2.0/authorize', {
      'client_id': naverClientId,
      'response_type': 'code',
      'redirect_uri': naverRedirectUri,
      'state': 'RANDOM_STATE_VALUE', // CSRF 공격 방지를 위한 임의의 값
    });

    final result = await FlutterWebAuth2.authenticate(
      url: url.toString(), 
      callbackUrlScheme: 'https'
    );

    return Uri.parse(result).queryParameters['code'];
  }
}