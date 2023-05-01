import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;


class SendImageToFlask {
  // ignore: unused_field
  final _flutterSecureStorage = const FlutterSecureStorage();

  Future<bool> sendToImageToFlask(Uint8List image) async {
    // ignore: no_leading_underscores_for_local_identifiers
    const String _flask = 'http://localhost:8080/test';
    final response = await http.post(
      Uri.parse(_flask),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(
        <String, dynamic>{
          "image": image,
        },
      ),
    );

    if (response.statusCode == 200) {
      // 성공적으로 응답이 반환된 경우
      final Map<String, dynamic> data = jsonDecode(response.body);
      // Access Token과 Refresh Token 값을 추출

      // ignore: avoid_print
      print(data);
      //final String accessToken = data['영양성분'];
      //final String refreshToken = data['이미지'];

      // 추출한 값을 안전하게 저장
      // await _flutterSecureStorage.write(
      //     key: 'access_token', value: accessToken);
      // await _flutterSecureStorage.write(
      //     key: 'refresh_token', value: refreshToken);

      return true;
    } else {
      // ignore: avoid_print
      print('error');
      // 예외(에러) 처리
      return false;
    }
  }
}