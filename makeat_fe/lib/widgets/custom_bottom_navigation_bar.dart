import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:makeat_fe/views/send_image_to_flask_screen.dart';
import 'package:provider/provider.dart';

import '../common/no_animation_page_route.dart';

import '../models/bottom_navigation_index.dart';

import '../views/food_record_screen.dart';
import '../views/profile_user_screen.dart';


class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CustomBottomNavigationBarState createState() =>
      _CustomBottomNavigationBarState() ;
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {

  final List<List<Widget>> _items = [

    /* 바텀 내비게이션 바 1 - 홈 페이지 : 홈 화면 */
    [
      Image.asset('assets/images/bottom_navigation_bar/home_off.png', width: 32.0, height: 32.0),
      Image.asset('assets/images/bottom_navigation_bar/home_on.png', width: 32.0, height: 32.0),
    ],

    /* 바텀 내비게이션 바 2 - 식단 기록 페이지 : Stack 위젯을 사용해 날짜 아이콘 위에 현재 날짜 띄우기 */
    [
      Stack(
        children: [
          Image.asset('assets/images/bottom_navigation_bar/date_off.png',
              width: 32.0, height: 32.0),
          Positioned(
            bottom: 4.0,
            right: 8.0,
            child: Text(
              DateFormat('dd').format(DateTime.now()),
              style: const TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      Stack(
        children: [
          Image.asset('assets/images/bottom_navigation_bar/date_on.png',
              width: 32.0, height: 32.0),
          Positioned(
            bottom: 4.0,
            right: 8.0,
            child: Text(
              DateFormat('dd').format(DateTime.now()),
              style: const TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    ],

    /* 바텀 내비게이션 바 3 - 식단 정보 페이지 : 식단 정보는 추후 서비스 예정 */
    [
      Image.asset('assets/images/bottom_navigation_bar/diet_off.png', width: 32.0, height: 32.0),
      Image.asset('assets/images/bottom_navigation_bar/diet_on.png', width: 32.0, height: 32.0),
    ],

    /* 바텀 내비게이션 바 4 - 프로필 페이지 : 프로필 화면 */
    [
      Image.asset('assets/images/bottom_navigation_bar/user_off.png', width: 32.0, height: 32.0),
      Image.asset('assets/images/bottom_navigation_bar/user_on.png', width: 32.0, height: 32.0),
    ],
  ];

  void _onItemTapped(int index) {
    
    setState(() {
    });

    switch (index) {
      /* 홈 페이지로 이동 */
      case 0:
        setState(() {
        });
        Navigator.push(
          context,
          NoAnimationPageRoute(builder: (context) => const SendPhotoScreen(), settings: const RouteSettings(name: 'example')),
        );
        break;
      /* 식단 기록 페이지로 이동 */
      case 1:
        setState(() {
        });
        Navigator.push(
          context,
          NoAnimationPageRoute(builder: (context) => FoodRecordScreen(), settings: const RouteSettings(name: 'food_record_screen')),
        );
        break;

      /* 식단 정보 서비스 안내 dialog - 확인 */
      case 2:
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
        break;
      /* 프로필 페이지로 이동 */
      case 3:
        setState(() {
        });
        Navigator.push(
          context,
          NoAnimationPageRoute(builder: (context) => const ProfileUserScreen(), settings: const RouteSettings(name: 'profile_user_screen')),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CustomBottomNavigationBarModel>(
  builder: (context, model, child) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.black87,
      selectedLabelStyle: const TextStyle(fontSize: 13.0),

      /* 바텀 내비게이션 바 메뉴 아이콘 선택시 색칠된 아이콘으로 변경 */
      items: [
        BottomNavigationBarItem(
          icon: _items[0][model.selectedIndex == 0 ? 1 : 0],
          label: '홈',
        ),
        BottomNavigationBarItem(
          icon: _items[1][model.selectedIndex == 1 ? 1 : 0],
          label: '식단 기록',
        ),
        BottomNavigationBarItem(
          icon: _items[2][model.selectedIndex == 2 ? 1 : 0],
          label: '식단 정보',
        ),
        BottomNavigationBarItem(
          icon: _items[3][model.selectedIndex == 3 ? 1 : 0],
          label: '프로필',
        ),
      ],
      currentIndex: model.selectedIndex,
      onTap: (index) {
        model.updateSelectedIndex(index);
        _onItemTapped(index);
      },
    );
  },
);
  }
}