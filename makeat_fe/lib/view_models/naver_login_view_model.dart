import 'package:makeat_fe/view_models/social_login_view_model.dart';

class NaverLoginViewModel extends SocialLoginViewModel {
  @override
  String get clientId => 'YOUR_NAVER_CLIENT_ID';

  @override
  String get redirectUri => 'YOUR_NAVER_REDIRECT_URI';

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
