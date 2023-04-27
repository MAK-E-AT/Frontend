import 'package:flutter/material.dart';

import '../widgets/custom_app_bar.dart';
import '../widgets/custom_bottom_navigation_bar.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(),
      body: Center(
        child: Text('커스텀 앱바 & 바텀내비게이션 바 적용'),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}