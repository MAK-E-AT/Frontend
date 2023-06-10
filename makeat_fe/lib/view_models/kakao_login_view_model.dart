// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:makeat_fe/models/social_login_model.dart';

class KakaoLoginViewModel extends ChangeNotifier {
  String authCode = '';
  String kakaoType = '';

  Future<bool> loginWithKakao() async {
    final kakaoLoginModel = SocialLoginModel();

    // 카카오톡이 설치되어 있는 경우
    if (await isKakaoTalkInstalled()) {
      try {
          authCode = await AuthCodeClient.instance.authorizeWithTalk();
          kakaoType = 'KAKAO_APP';
      } catch (error) {
        debugPrint('ERR/APP/$error');

        // 사용자가 로그인을 취소한 경우
        if (error is PlatformException && error.code == 'CANCELED') {
          debugPrint('ERR/CANCELED');
          return false;
        }
        // 카카오톡에 연결된 카카오계정이 없는 경우
        try {
            authCode = await AuthCodeClient.instance.authorize();
            kakaoType = 'KAKAO_ACCOUNT';
            
        } catch (error) {
            debugPrint('ERR/ACCOUNT/$error');
        }
      }
    // 카카오톡이 설치되어 있지 않은 경우
    } else {
      try {
        authCode = await AuthCodeClient.instance.authorize();
        kakaoType = 'KAKAO_ACCOUNT';
      } catch (error) {
        debugPrint('ACCOUNT/$error');
      }
    }
    

    // 반환된 authCode 확인
    if (authCode != '') {
      debugPrint('인증 타입은 $kakaoType 입니다. \n KAKAO 인증코드는 $authCode 입니다.');
      // // 백엔드에 인증코드 전달
      if (kakaoLoginModel.sendAuthCodeToBackend('kakao', authCode)==true) return true;
      return false;
    } else {
      debugPrint('KAKAO/인증코드가 반환되지 않았습니다.');
      return false;
    }
  }
}