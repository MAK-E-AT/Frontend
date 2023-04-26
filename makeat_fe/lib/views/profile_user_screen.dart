import 'package:flutter/material.dart';
import 'package:makeat_fe/views/profile_user_info_screen.dart';
import 'package:makeat_fe/widgets/custom_app_bar.dart';
import 'package:makeat_fe/widgets/custom_grid_menu.dart';
import 'package:makeat_fe/widgets/custom_list_view.dart';
import 'package:makeat_fe/widgets/custom_navigation_bar.dart';

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
                      '앱 설정',
                    ],
                    menuImages: const [
                      'assets/images/profile_menu/myInfo.png',
                      'assets/images/profile_menu/favorite.png',
                      'assets/images/profile_menu/manual.png',
                      'assets/images/profile_menu/notice.png',
                      'assets/images/profile_menu/feedback.png',
                      'assets/images/profile_menu/settings.png',
                    ],
                    onTap: [
                      () async { Navigator.push(context, MaterialPageRoute(builder: (context) => const ProfileUserInfoScreen())); },
                      () async { Navigator.push(context, MaterialPageRoute(builder: (context) => const ProfileUserInfoScreen())); },
                      () async { Navigator.push(context, MaterialPageRoute(builder: (context) => const ProfileUserInfoScreen())); },
                      () async { Navigator.push(context, MaterialPageRoute(builder: (context) => const ProfileUserInfoScreen())); },
                      () async { Navigator.push(context, MaterialPageRoute(builder: (context) => const ProfileUserInfoScreen())); },
                      () async { Navigator.push(context, MaterialPageRoute(builder: (context) => const ProfileUserInfoScreen())); },
                    ],
                  ),
                ),
                const Expanded(
                  child: CustomListView(
                    itemList: [
                      ['개인정보 취급방침'],
                      ['이용약관'],
                      ['정보 수신 동의 변경'],
                      ['리뷰 남기기'],
                      ['현재 버전', '1.0.0']
                    ],
                    itemSpacing: 0.0,
                  )
                ),
                    // 로그아웃 버튼
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 6.0),
                  child: Text(
                    '로그아웃',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
          ),
        ),
      ),
      bottomNavigationBar: const CustomNavigationBar(),
    );
  }
}