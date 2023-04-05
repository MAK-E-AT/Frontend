import 'dart:io';

import 'package:makeat_fe/view_models/social_login_view_model.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';


String getRedirectUri() {
  if (Platform.isAndroid) {
    return dotenv.env['ANDROID_REDIRECT_URI'] ?? '';
  } else if (Platform.isIOS) {
    return dotenv.env['IOS_REDIRECT_URI'] ?? '';
  } else {
    return '';
  }
}

class KakaoLoginViewModel extends SocialLoginViewModel {
  @override
  final String clientId = dotenv.env['KAKAO_CLIENT_ID']!;

  @override
  final String redirectUri = getRedirectUri();
  

  @override
  Map<String, String> get authParameters => {
        'client_id': clientId,
        'response_type': 'code',
        'redirect_uri': redirectUri,
      };

  @override
  String getAuthEndpoint() => 'kauth.kakao.com';

  @override
  String getAuthPath() => '/oauth/authorize';
}