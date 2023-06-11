import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'profile_user_screen.dart';

import '../widgets/custom_app_bar2.dart';
import '../widgets/custom_check_box.dart';

class TextContentScreen extends StatelessWidget {
  final String title;
  final String body;
  final bool isCheck;

  const TextContentScreen({
    Key? key,
    required this.title,
    required this.body,
    this.isCheck = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: <Widget>[
            const CustomAppBar2(nextScreen: ProfileUserScreen(),),
            SliverFillRemaining(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(12.0, 2.0, 12.0, 0.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12.0),
                    Text(
                      body,
                      maxLines: 30,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontSize: 16.0),
                    ),
                    /* 이용약관 및 개인정보처리방침 확인 */
                    isCheck == true ? CustomCheckBox(
                      checkBoxText1: '이용약관',
                      checkBoxText2: ' 및 ',
                      checkBoxText3: '개인정보처리방침',
                      checkBoxText4: '에 동의합니다.',
                      checkBoxColor: Colors.black,
                      checkBoxIcon: Icons.check_circle,
                    )
                    : const SizedBox(height: 5.0,)
                  ],
                ),
              ),
            )
          ],      
        ),
      ),
    );
  }
}