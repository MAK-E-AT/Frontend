import 'package:flutter/material.dart';

/* 바텀 내비게이션 바 - 페이지 이동 시 인덱스 consume 목적 */
class BottomNavigatoinBarProvider extends ChangeNotifier {
  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  void updateSelectedIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }
}