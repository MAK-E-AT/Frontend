// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:makeat_fe/views/home_screen.dart';
import 'package:makeat_fe/views/social_login_screen.dart';

import '../common/no_animation_page_route.dart';

import '../view_models/authentication_status.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/custom_check_box.dart';
import '../widgets/custom_elevated_button.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/custom_image_slider.dart';

class AdditionalUserInfoScreen extends StatefulWidget {
  const AdditionalUserInfoScreen({super.key});
  

  @override
  // ignore: library_private_types_in_public_api
  _AdditionalUserInfoScreenState createState() => _AdditionalUserInfoScreenState();
}

class _AdditionalUserInfoScreenState extends State<AdditionalUserInfoScreen> {

  late AuthProvider authProvider;
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();

  @override
  void initState() {
    super.initState();
    authProvider = AuthProvider();
    authProvider.login();
  }

  @override
  Widget build(BuildContext context) {
    if (authProvider.isLoggedIn) {
      return _buildLoggedInWidget();
    } else {
      return _buildLoggedOutWidget();
    }
  }

  Widget _buildLoggedOutWidget() {
    return const SocialLoginScreen();
  }

  List<String> imagePaths = [
    'assets/images/sample_manual/sample_manual_1.png',
    'assets/images/sample_manual/sample_manual_2.png',
    'assets/images/sample_manual/sample_manual_3.png',
    'assets/images/sample_manual/sample_manual_4.png',
    'assets/images/sample_manual/sample_manual_5.png',
  ];

  // Widget build(BuildContext context) {
  Widget _buildLoggedInWidget() {
    return MaterialApp(
      home: Scaffold(
        appBar: const CustomAppBar(),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  /* 이미지 슬라이더 
                    - imagePaths, 초기 인덱스 0
                    - JumpingDotEffect 애니메이션
                  */
                  CustomImageSlider(
                    imagePathList: imagePaths,
                  ),
                  
                  /* 나이
                    1. 숫자 타입
                    2. 200 미만
                    3. 정수만 허용
                  */
                  CustomTextField(
                    textEditingController: _ageController, 
                    labelText: '-  나이 (세)', 
                    labelTextSize: 14.0,
                    hintText: '만 나이를 입력해주세요.', 
                    textFieldWidth: MediaQuery.of(context).size.width * 0.5,
                    leftWhiteSpaceWidth: MediaQuery.of(context).size.width * 0.1,
                    rightWhiteSpaceWidth: 20.0,
                    regExp: r'^(?!0)[1-9][0-9]?$|^1\d{2}$', 
                  ),

                  /* 키 
                    1. 숫자 타입
                    2. 300 이하
                    3. 소수점은 한 자리까지만 허용
                  */
                  CustomTextField(
                    textEditingController: _heightController, 
                    labelText: '-  키 (cm)', 
                    labelTextSize: 14.0,
                    hintText: '소수점은 한 자리까지만 가능해요.', 
                    textFieldWidth: MediaQuery.of(context).size.width * 0.5,
                    leftWhiteSpaceWidth: MediaQuery.of(context).size.width * 0.1,
                    rightWhiteSpaceWidth: 20.0,
                    regExp: r'^(?!0)([1-2]?\d{0,2}(\.\d{0,1})?|300(\.0)?)$', 
                  ),
                  
                  /* 체중 
                    1. 숫자 타입
                    2. 200 이하
                    3. 소수점은 한 자리까지만 허용
                  */
                  CustomTextField(
                    textEditingController: _weightController, 
                    labelText: '-  체중 (kg)', 
                    labelTextSize: 14.0,
                    hintText: '소수점은 한 자리까지만 가능해요.', 
                    textFieldWidth: MediaQuery.of(context).size.width * 0.5,
                    leftWhiteSpaceWidth: MediaQuery.of(context).size.width * 0.1,
                    rightWhiteSpaceWidth: 12.0,
                    regExp: r'^(?!0)(\d{0,2}(\.\d{0,1})?|200(\.0)?)$', 
                  ),

                  /* 이용약관 및 개인정보처리방침 확인 */
                  const CustomCheckBox(
                    checkBoxText1: '이용약관',
                    checkBoxText2: ' 및 ',
                    checkBoxText3: '개인정보처리방침',
                    checkBoxText4: '에 동의합니다.',
                    checkBoxColor: Colors.black,
                    checkBoxIcon: Icons.check_circle,
                  ),
                ],
              ),
            ),
          )
        ),
        bottomNavigationBar: CustomElevatedButton(
          buttonText: '시  작  하  기',
          onPressed: () {
            if (
              _ageController == null 
              || _heightController == null 
              || _weightController == null
            ) {
              return Navigator.push(
                context, 
                NoAnimationPageRoute(
                  builder: (context) => const AdditionalUserInfoScreen(), 
                  settings: const RouteSettings(name: 'home_screen')
                )
              );
            }
            return Navigator.push(
              context, 
              NoAnimationPageRoute(
                builder: (context) => const HomeScreen(), 
                settings: const RouteSettings(name: 'home_screen')
              )
            );
          },
        )
      )
    );
  }
}
