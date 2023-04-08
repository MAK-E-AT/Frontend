import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';


class NaverLoginViewModel extends ChangeNotifier {
  
  Future<void> loginWithNaver() async { 
    final clientId = dotenv.env['NAVER_CLIENT_ID']!;
    final redirectUri = dotenv.env['NAVER_IOS_REDIRECT_URI']!;
    // final clientSecret = dotenv.env['NAVER_CLIENT_SECRET']!;

    final url =
        'https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=$clientId&redirect_uri=$redirectUri&state=flutter_naver_login';
    final flutterWebviewPlugin = FlutterWebviewPlugin();

    flutterWebviewPlugin.launch(
      url,
      clearCache: true,
      clearCookies: true,
      withJavascript: true,
    );

    flutterWebviewPlugin.onUrlChanged.listen((String url) {
      if (url.startsWith('$redirectUri?code=')) {
        flutterWebviewPlugin.close();
        final authCode = url.split('code=')[1];
        print('NAVER 인증 코드는 $authCode 입니다.');
      } else {
        print('NAVER/인증 코드가 반환되지 않았습니다.');
      }
    });
  }
}