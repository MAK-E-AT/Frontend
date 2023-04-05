import 'package:makeat_fe/view_models/social_login_view_model.dart';


class AppleLoginViewModel extends SocialLoginViewModel {
  @override
  String get clientId => 'com.example.your-app';

  @override
  String get redirectUri => 'https://example.com/callback';

  @override
  Map<String, String> get authParameters => {
        'client_id': clientId,
        'redirect_uri': redirectUri,
        'response_type': 'code',
        'scope': 'email name',
        'response_mode': 'form_post',
      };

  @override
  String getAuthEndpoint() => 'appleid.apple.com';

  @override
  String getAuthPath() => '/auth/authorize';
}