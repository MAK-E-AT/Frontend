import 'package:flutter/material.dart';

class CustomNavigationBar extends StatefulWidget {
  const CustomNavigationBar({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CustomNavigationBarState createState() =>
      _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  int _selectedIndex = 0;

  final List<List<Widget>> _items = [
    [
      Image.asset('assets/images/bottom_navigation_bar/home_off.png', width: 32.0, height: 32.0),
      Image.asset('assets/images/bottom_navigation_bar/home_on.png', width: 32.0, height: 32.0),
    ],
    [
      Image.asset('assets/images/bottom_navigation_bar/date_off.png', width: 32.0, height: 32.0),
      Image.asset('assets/images/bottom_navigation_bar/date_on.png', width: 32.0, height: 32.0),
    ],
    [
      Image.asset('assets/images/bottom_navigation_bar/diet_off.png', width: 32.0, height: 32.0),
      Image.asset('assets/images/bottom_navigation_bar/diet_on.png', width: 32.0, height: 32.0),
    ],
    [
      Image.asset('assets/images/bottom_navigation_bar/user_off.png', width: 32.0, height: 32.0),
      Image.asset('assets/images/bottom_navigation_bar/user_on.png', width: 32.0, height: 32.0),
    ],
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Text('바텀 네비게이션 바 테스트'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.black87,
        selectedLabelStyle: const TextStyle(fontSize: 13.0),
        items: [
          BottomNavigationBarItem(
            icon: _items[0][_selectedIndex == 0 ? 1 : 0],
            label: '홈',
          ),
          BottomNavigationBarItem(
            icon: _items[1][_selectedIndex == 1 ? 1 : 0],
            label: '식단 기록',
          ),
          BottomNavigationBarItem(
            icon: _items[2][_selectedIndex == 2 ? 1 : 0],
            label: '식단 정보',
          ),
          BottomNavigationBarItem(
            icon: _items[3][_selectedIndex == 3 ? 1 : 0],
            label: '프로필',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}