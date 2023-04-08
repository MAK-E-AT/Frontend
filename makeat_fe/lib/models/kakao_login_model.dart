import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';


class KakaoLoginModel {
  final String _backendEndpoint = 'https://{backend.com}/api/login/kakao';

  Future<String> getAuthorizationCode() async {
    final authCode = await AuthCodeClient.instance.authorizeWithTalk();
    return authCode;
  }

  Future<void> sendAuthCodeToBackend(String authCode) async {
    final response = await http.post(
      Uri.parse(_backendEndpoint),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'auth_code': authCode}),
    );

    if (response.statusCode == 200) {
      // Handle successful response from the backend server
    } else {
      // Handle error response from the backend server
    }
  }
}