import 'package:flutter/material.dart';
import 'package:flutter_web_auth_2/flutter_web_auth_2.dart';

class AppleLoginViewModel extends ChangeNotifier {
  
  final String appleClientId = 'com.example.your-app';
  final String appleRedirectUri = 'https://example.com/callback';

  Future<String?> signInWithApple() async {
    final url = Uri.https('appleid.apple.com', '/auth/authorize', {
      'client_id': appleClientId,
      'redirect_uri': appleRedirectUri,
      'response_type': 'code',
      'scope': 'email name',
      'response_mode': 'form_post',
    });

    final result = await FlutterWebAuth2.authenticate(
      url: url.toString(), 
      callbackUrlScheme: 'https'
    );

    return Uri.parse(result).queryParameters['code'];
  }
}