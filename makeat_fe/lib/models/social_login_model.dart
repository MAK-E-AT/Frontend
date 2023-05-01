import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';


class SocialLoginModel {
  final _flutterSecureStorage = const FlutterSecureStorage();

  /* 인증 코드를 백엔드로 전달 */
  Future<bool> sendAuthCodeToBackend(String socialType, String authCode) async {

    // ignore: no_leading_underscores_for_local_identifiers
    final String _backendEnd = 'http://localhost:8080/user/$socialType';
    final response = await http.post(
      Uri.parse(_backendEnd),
      headers: {
        'Content-Type': 'application/json', 
        'Authorization': authCode
      },
      body: jsonEncode({}),
    );

    if (response.statusCode == 200) {
      // 성공적으로 응답이 반환된 경우
      final Map<String, dynamic> data = jsonDecode(response.body);

      // Access Token과 Refresh Token 값을 추출
      final String accessToken = data['access_token'];
      final String refreshToken = data['refresh_token'];

      // 추출한 값을 안전하게 저장
      await _flutterSecureStorage.write(key: 'access_token', value: accessToken);
      await _flutterSecureStorage.write(key: 'refresh_token', value: refreshToken);

      return true;
      
    } else {
      // 예외(에러) 처리
      return false;
    }
  }

  /* (신규) 회원 정보를 백엔드로 전달 */
  Future<bool> sendNewUserInfoToBackend() async {
    // ignore: no_leading_underscores_for_local_identifiers
    const String _backendEnd = 'http://localhost:8080/';
    final response = await http.post( Uri.parse(_backendEnd) );
    if (response.statusCode == 200) { return true; } else { return false; }
  }

  /* 수정된 회원 정보를 백엔드로 전달 */
  Future<bool> sendModifyUserInfoToBackend() async {
    // ignore: no_leading_underscores_for_local_identifiers
    const String _backendEnd = 'http://localhost:8080/';
    final response = await http.post( Uri.parse(_backendEnd) );
    if (response.statusCode == 200) { return true; } else { return false; }
  }
}