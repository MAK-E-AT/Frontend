import 'dart:io';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:makeat_fe/view_models/social_login_view_model.dart';


String getRedirectUri() {
  if (Platform.isAndroid) {
    return dotenv.env['NAVER_ANDROID_REDIRECT_URI'] ?? '';
  } else if (Platform.isIOS) {
    return dotenv.env['NAVER_IOS_REDIRECT_URI'] ?? '';
  } else {
    return '';
  }
}

class NaverLoginViewModel extends SocialLoginViewModel {
  @override
  final String clientId = dotenv.env['NAVER_CLIENT_ID']!;

  @override
  final String redirectUri = dotenv.env['NAVER_CLIENT_ID']!;

  @override
  Map<String, String> get authParameters => {
        'client_id': clientId,
        'response_type': 'code',
        'redirect_uri': redirectUri,
      };

  @override
  String getAuthEndpoint() => 'nid.naver.com';

  @override
  String getAuthPath() => '/oauth2.0/authorize';
}
