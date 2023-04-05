import 'dart:convert';
import 'dart:math';
import 'package:flutter_web_auth_2/flutter_web_auth_2.dart';


// 난수 생성하여 문자열로 변환(state 값)
String generateSecureRandomState() {
  final random = Random.secure();
  final values = List<int>.generate(32, (i) => random.nextInt(256));
  final state = base64Url.encode(values);
  return state;
}

abstract class SocialLoginViewModel {
  String get clientId;
  String get redirectUri;

  final String _state = generateSecureRandomState();

  Map<String, String> get authParameters;

  Map<String, String> get authParametersWithState {
    return {
      ...authParameters,
      'state': _state,
    };
  }

  Future<String?> signIn() async {
    final url = Uri.https(getAuthEndpoint(), getAuthPath(), authParametersWithState);

    final result = await FlutterWebAuth2.authenticate(url: url.toString(), callbackUrlScheme: 'https');

    final returnedState = Uri.parse(result).queryParameters['state'];
    if (!validateState(returnedState!)) {
      throw Exception('State value does not match!');
    }

    return Uri.parse(result).queryParameters['code'];
  }

  String getAuthEndpoint();
  String getAuthPath();

  bool validateState(String returnedState) {
    return _state == returnedState;
  }
}