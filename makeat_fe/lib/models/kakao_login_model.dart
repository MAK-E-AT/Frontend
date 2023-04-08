import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';


class KakaoLoginModel {
  final String _backendEndpoint = 'https://{backend.com}/api/login/kakao';

  Future<void> sendAuthCodeToBackend(String authCode) async {
    final response = await http.post(
      Uri.parse(_backendEndpoint),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'auth_code': authCode}),
    );

    if (response.statusCode == 200) {
      // 성공적으로 응답이 반환된 경우
    } else {
      // 예외(에러) 처리
    }
  }
}