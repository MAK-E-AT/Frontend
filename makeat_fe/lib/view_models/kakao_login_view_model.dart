import 'package:makeat_fe/view_models/social_login_view_model.dart';

class KakaoLoginViewModel extends SocialLoginViewModel {
  @override
  String get clientId => 'YOUR_KAKAO_CLIENT_ID';

  @override
  String get redirectUri => 'YOUR_KAKAO_REDIRECT_URI';

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