// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:makeat_fe/views/manual_screen.dart';
import 'package:makeat_fe/views/profile_text_content_screen.dart';
import 'package:makeat_fe/views/social_login_screen.dart';
import 'package:provider/provider.dart';

import '../common/no_animation_page_route.dart';

import '../view_models/authentication_status.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/custom_grid_menu.dart';
import '../widgets/custom_list_view.dart';
import '../widgets/custom_bottom_navigation_bar.dart';

import 'profile_user_info_screen.dart';


class ProfileUserScreen extends StatelessWidget {
  const ProfileUserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: CustomGridMenu(
                    menuTitles: const [
                      '나의 정보',
                      '찜한 식단',
                      '매뉴얼',
                      '공지사항',
                      '문의 / 피드백',
                      // '앱 설정',
                    ],
                    menuImages: const [
                      'assets/images/profile_menu/myInfo.png',
                      'assets/images/profile_menu/favorite.png',
                      'assets/images/profile_menu/manual.png',
                      'assets/images/profile_menu/notice.png',
                      'assets/images/profile_menu/feedback.png',
                      // 'assets/images/profile_menu/settings.png',
                    ],
                    onTap: [
                      () async { Navigator.push(context, NoAnimationPageRoute(builder: (context) => const ProfileUserInfoScreen(), settings: const RouteSettings(name: 'profile_user_info_screen'))); },
                      () async { 
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text('서비스 안내'),
                              content: const Text('아직 공개되지 않은 서비스입니다.'),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text('확인'),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      () async { 
                        Navigator.push(
                          context, 
                          NoAnimationPageRoute(
                            builder: (context) => const ManualScreen(), 
                            settings: const RouteSettings(name: 'manual_screen')
                          )
                        ); 
                      },
                      () async { 
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text('서비스 안내'),
                              content: const Text('아직 공개되지 않은 서비스입니다.'),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text('확인'),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      () async {

                        // mailto:iabc716@icloud.com 
                        const url = 'https://mail.google.com/mail/u/0/?fs=1&to=iabc716@icloud.com&tf=cm';
                        final flutterWebviewPlugin = FlutterWebviewPlugin();

                        // 플러터 웹뷰 실행
                        flutterWebviewPlugin.launch(
                          url,
                          clearCache: true,
                          clearCookies: true,
                          withJavascript: true,
                        );
                      },
                      // () async { },
                    ],
                  ),
                ),
                Expanded(
                  child: CustomListView(
                    itemList: const [
                      ['개인정보 취급방침'],
                      ['이용약관'],
                      ['정보 수신 동의 변경'],
                      ['리뷰 남기기'],
                      ['현재 버전', '1.0.0']
                    ],
                    onTap: [
                      () async {    // 개인정보취급방침
                        Navigator.push(
                          context, 
                          NoAnimationPageRoute(
                            builder: (context) => const TextContentScreen(
                              title: '개인정보취급방침', 
                              body: '본 애플리케이션은 사용자가 제공한 음식 사진과 관련된 개인정보를 취급합니다. 이는 AI 모델의 향상과 영양 정보 제공을 위해 사용됩니다. 수집된 개인정보는 사용자의 식단 분석 및 서비스 제공을 위한 목적으로 사용되며, 안전하게 보호됩니다. 개인정보는 법적인 요구 사항을 제외하고는 제3자에게 제공되지 않습니다. 그러나 AI 모델의 개선과 연구를 위해 익명화된 데이터로 활용될 수 있습니다. 사용자는 개인정보에 대한 열람, 수정, 삭제 등의 권리를 가지고 있으며, 관련 문의는 개인정보 보호 담당자에게 문의할 수 있습니다. 애플리케이션 사용 시 개인정보 보호를 위해 주의를 요청드리며, 앱 사용으로 발생하는 문제에 대해서는 책임을 지지 않습니다. 앱 이용 시 개인정보취급방침에 동의하는 것을 전제로 합니다. 사용자의 개인정보를 안전하게 취급하기 위해 최선을 다하겠습니다.'
                            ), 
                            settings: const RouteSettings(name: 'profile_user_screen')
                          )
                        ); 
                      },
                      () async {    // 이용약관
                        Navigator.push(
                          context, 
                          NoAnimationPageRoute(
                            builder: (context) => const TextContentScreen(
                              title: '이용약관', 
                              body: '본 애플리케이션은 사용자가 제공한 식단 사진을 AI 모델을 활용하여 영양 성분을 분석하고, 해당 사진의 영양 정보를 제공하는 애플리케이션입니다. 사용자는 앱을 통해 자신의 식단을 기록하고, 영양 정보를 확인할 수 있습니다. 앱의 이용에는 일부 개인정보가 수집될 수 있으며, 이는 사용자 경험 향상과 서비스 제공을 위한 목적으로 사용됩니다. 수집된 개인정보는 안전하게 보호되며, 제3자에게 제공되지 않습니다. 또한, AI 모델의 개선과 연구를 위해 익명화된 데이터로 활용될 수 있습니다. 이용약관에 동의하신다면, 앱을 사용하실 수 있습니다. 제공되는 영양 정보는 참고용으로 제공되며, 정확성을 보장하지 않습니다. 앱 사용 시 발생하는 일부 문제에 대해서는 책임을 지지 않습니다. 앱 이용 시 개인정보보호 정책을 준수해주시기 바랍니다.'
                            ), 
                            settings: const RouteSettings(name: 'profile_user_screen')
                          )
                        ); 
                      },
                      () async {    // 정보수신동의변경
                        Navigator.push(
                          context, 
                          NoAnimationPageRoute(
                            builder: (context) => const TextContentScreen(
                              title: '정보수신동의변경', 
                              body: '본 애플리케이션은 사용자의 개인정보를 안전하게 취급하고, 정보수신에 대한 동의를 중요하게 다룹니다. 사용자는 언제든지 정보수신에 대한 동의를 변경할 수 있습니다. 정보수신 동의 변경은 애플리케이션 내 설정 메뉴를 통해 간편하게 처리할 수 있습니다. 변경된 동의 사항은 즉시 적용되며, 해당 정보의 수신 여부에 따라 앱에서 제공하는 서비스가 조정될 수 있습니다. 사용자는 앱을 통해 제공되는 다양한 정보를 수신할 수 있으며, 필요에 따라 언제든지 동의를 철회할 수도 있습니다. 동의 철회 시, 해당 정보의 수신은 중단되며, 앱의 일부 기능 또는 서비스 이용이 제한될 수 있습니다. 정보수신에 대한 동의 변경은 사용자의 개인정보 보호와 권리를 존중하는 방침의 일환으로 이루어지며, 언제든지 사용자가 원하는 방향으로 설정을 조정할 수 있도록 노력하겠습니다. 개인정보 보호를 위해 사용자의 동의에 따라 앱 서비스가 조정되는 것을 원칙으로 합니다. 정보수신 동의 변경에 대한 자세한 내용은 애플리케이션 내 설정 메뉴 또는 개인정보취급방침을 참고해주시기 바랍니다. 사용자의 개인정보 보호와 편의를 위해 최선을 다하겠습니다.',
                              isCheck: true,
                            ), 
                            settings: const RouteSettings(name: 'profile_user_screen')
                          )
                        ); 
                      },
                      () async { },  // 리뷰 남기기
                      () async { },  // 현재 버전
                    ],
                    itemSpacing: 0.0,
                  )
                ),
                    // 로그아웃 버튼
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6.0),
                  child: GestureDetector(
                    onTap: () async {
                      final authProvider = Provider.of<AuthProvider>(context, listen: false);
                      [
                        authProvider.logout(),
                        Navigator.push(
                          context, 
                          NoAnimationPageRoute(
                            builder: (context) => const SocialLoginScreen(), 
                            settings: const RouteSettings(name: 'social_login_screen')
                          )
                        )
                      ];
                    },  // 로그아웃
                    child: const Text(
                      '로그아웃',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
          ),
        ),
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(),
    );
  }
}