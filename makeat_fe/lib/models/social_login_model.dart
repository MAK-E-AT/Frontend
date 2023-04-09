import 'dart:convert';

import 'package:http/http.dart' as http;


class SocialLoginModel {
  
  

  Future<bool> sendAuthCodeToBackend(String socialType, String authCode) async {

    final String _backendEnd = 'https://localhost:8080/user?loginSite=$socialType';
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
      

      return true;
    } else {
      // 예외(에러) 처리
      return false;
    }
  }
}