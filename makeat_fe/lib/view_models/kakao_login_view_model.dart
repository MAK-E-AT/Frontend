import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:makeat_fe/models/social_login_model.dart';

class KakaoLoginViewModel extends ChangeNotifier {
  String _authCode = '';
  String kakaoType = '';

  Future<void> loginWithKakao() async {
    final kakaoLoginModel = SocialLoginModel();

    // 카카오톡이 설치되어 있는 경우
    if (await isKakaoTalkInstalled()) {
      try {
          _authCode = await AuthCodeClient.instance.authorizeWithTalk();
          kakaoType = 'KAKAO_APP';
      } catch (error) {
        print('ERR/APP/$error');

        // 사용자가 로그인을 취소한 경우
        if (error is PlatformException && error.code == 'CANCELED') {
          print('ERR/CANCELED');
          return;
        }
        // 카카오톡에 연결된 카카오계정이 없는 경우
        try {
            _authCode = await AuthCodeClient.instance.authorize();
            kakaoType = 'KAKAO_ACCOUNT';
            
        } catch (error) {
            print('ERR/ACCOUNT/$error');
        }
      }
    // 카카오톡이 설치되어 있지 않은 경우
    } else {
      try {
        _authCode = await AuthCodeClient.instance.authorize();
        kakaoType = 'KAKAO_ACCOUNT';
      } catch (error) {
        print('ACCOUNT/$error');
      }
    }
    

    // 반환된 authCode 확인
    if (_authCode != '') {
      print('인증 타입은 $kakaoType 입니다. \n KAKAO 인증코드는 $_authCode 입니다.');
      // 백엔드에 인증코드 전달
      // kakaoLoginModel.sendAuthCodeToBackend('kakao', _authCode);
    } else {
      print('KAKAO/인증코드가 반환되지 않았습니다.');
    }
  }
}