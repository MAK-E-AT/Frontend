import 'package:flutter/material.dart';
import 'package:makeat_fe/widgets/custom_check_box.dart';

import 'package:makeat_fe/widgets/custom_elevated_button.dart';

class AnalyzedImageScreen extends StatefulWidget {
  const AnalyzedImageScreen({super.key});

  @override
  State<AnalyzedImageScreen> createState() => _AnalyzedImageScreenState();
}

class _AnalyzedImageScreenState extends State<AnalyzedImageScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            body: SafeArea(
              child: Center(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20.0,
                    ),

                    /* MAK-E-AT 로고(소) */
                    Image.asset(
                      width: 140.0,
                      'assets/images/makeat_logo/logo_small_size.png',
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),

                    /* 이미지 슬라이더 
                  - imagePaths, 초기 인덱스 0
                  - JumpingDotEffect 애니메이션
                */

                    /* 키 
                  1. 숫자 타입
                  2. 300 이하
                  3. 소수점은 한 자리까지만 허용
                */

                    /* 체중 
                  1. 숫자 타입
                  2. 200 이하
                  3. 소수점은 한 자리까지만 허용
                */

                    /* 이용약관 및 개인정보처리방침 확인 */

                    const CustomCheckBox(
                      checkBoxText1: '이용약관',
                      checkBoxText2: ' 및 ',
                      checkBoxText3: '개인정보처리방침',
                      checkBoxText4: '에 동의합니다.',
                      checkBoxColor: Colors.black,
                      checkBoxIcon: Icons.check_rounded,
                    ),
                  ],
                ),
              ),
            ),
            bottomNavigationBar: const CustomElevatedButton(
              buttonText: '시  작  하  기',
            )));
  }
}
