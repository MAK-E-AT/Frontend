// ignore_for_file: avoid_print

import 'package:http/http.dart' as http;
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';


class SocialLoginModel {
  // final _flutterSecureStorage = const FlutterSecureStorage();

  /* 인증 코드를 백엔드로 전달 */
  Future<bool> sendAuthCodeToBackend(String socialType, String authCode) async {

    // ignore: no_leading_underscores_for_local_identifiers
    final String _backend = 'http://13.124.218.39/v1/user/$socialType?code=$authCode';
    print(_backend);

    // final String _backendEnd = 'http://localhost:8080/user/$socialType';
    var response = await http.get(
      Uri.parse(_backend),
      headers: {
        'Content-Type': 'application/json', 
        // 'Authorization': authCode
      },
      // body: jsonEncode({}),
    );

    if (response.statusCode == 200) {

      print('응답 성공');
      // 성공적으로 응답이 반환된 경우 -> 현재는 null 값 할당
      print(response.body);
      // final Map<String, dynamic> data = jsonDecode(response.body);

      // Access Token과 Refresh Token 값을 추출
      // final String accessToken = data['access_token'];
      // final String refreshToken = data['refresh_token'];

      // print(accessToken);
      // print(refreshToken);

      // 추출한 값을 안전하게 저장
      // await _flutterSecureStorage.write(key: 'access_token', value: accessToken);
      // await _flutterSecureStorage.write(key: 'refresh_token', value: refreshToken);

      return true;
      
    } else {
      print('응답 실패');
      // 예외(에러) 처리
      // return false;
      return true;
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