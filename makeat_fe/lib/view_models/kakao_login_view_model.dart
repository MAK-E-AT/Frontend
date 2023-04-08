import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';

class KakaoLoginViewModel extends ChangeNotifier {

  Future<void> loginWithKakao() async {
    String kakaoType = '';
    String authCode = '';

    // 카카오톡이 설치되어 있는 경우
    if (await isKakaoTalkInstalled()) {
      try {
          authCode = await AuthCodeClient.instance.authorizeWithTalk();
          kakaoType = 'APP';
      } catch (error) {
        print('ERR/APP/$error');

        // 사용자가 로그인을 취소한 경우
        if (error is PlatformException && error.code == 'CANCELED') {
          print('ERR/CANCELED');
          return;
        }
        // 카카오톡에 연결된 카카오계정이 없는 경우
        try {
            authCode = await AuthCodeClient.instance.authorize();
            kakaoType = 'ACCOUNT';
            
        } catch (error) {
            print('ERR/ACCOUNT/$error');
        }
      }
    // 카카오톡이 설치되어 있지 않은 경우
    } else {
      try {
        authCode = await AuthCodeClient.instance.authorize();
        kakaoType = 'ACCOUNT';
      } catch (error) {
        print('ACCOUNT/$error');
      }
    }

    // 반환된 authCode 확인
    if (authCode != '') {
      // 추후 백엔드 요청이 담길 예정입니다.
      print('인증 타입은 $kakaoType 입니다. \n 인증코드는 $authCode 입니다.');
    } else {
      print('인증코드가 반환되지 않았습니다.');
    }
  }
}