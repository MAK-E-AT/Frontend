import 'package:flutter/material.dart';
import 'package:makeat_fe/views/home_screen.dart';
import 'package:makeat_fe/views/social_login_screen.dart';

import '../common/no_animation_page_route.dart';

import '../view_models/authentication_status.dart';
import '../widgets/custom_app_bar.dart';
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
  final TextEditingController _ageController = TextEditingController(text: '');
  final TextEditingController _heightController = TextEditingController(text: '');
  final TextEditingController _weightController = TextEditingController(text: '');
  bool isChecked = false;

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

                  const SizedBox(height: 10.0,),
                  
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
                  // CustomCheckBox(
                  //   checkBoxText1: '이용약관',
                  //   checkBoxText2: ' 및 ',
                  //   checkBoxText3: '개인정보처리방침',
                  //   checkBoxText4: '에 동의합니다.',
                  //   checkBoxColor: Colors.black,
                  //   checkBoxIcon: Icons.check_circle,
                  // )
                ],
              ),
            ),
          )
        ),
        bottomNavigationBar: CustomElevatedButton(
          buttonText: '시  작  하  기',
          onPressed: () {
            if (_ageController.text == '') {  // 나이 정보를 입력하지 않은 경우
              return showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('서비스 안내'),
                    content: const Text('사용자님의 나이 정보를 입력해주세요.'),
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
            } else if (int.parse(_ageController.text) < 8) {  // 나이가 8 미만인 경우 
              return showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('서비스 안내'),
                    content: const Text('나이(세)는 8 이상의 값만 입력 가능합니다.'),
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
            } else if (_heightController.text == '') {  // 키 정보를 입력하지 않은 경우
              return showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('서비스 안내'),
                    content: const Text('사용자님의 키 정보를 입력해주세요.'),
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
            } else if (int.parse(_heightController.text) < 100) {  // 키가 100 미만인 경우 
              return showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('서비스 안내'),
                    content: const Text('키(cm)는 100 이상의 값만 입력 가능합니다.'),
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
            } else if (_weightController.text == '') {  // 무게 정보를 입력하지 않은 경우
              return showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('서비스 안내'),
                    content: const Text('사용자님의 체중 정보를 입력해주세요'),
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
            } else if (int.parse(_weightController.text) < 30) {  // 체중이 30 미만인 경우
              return showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('서비스 안내'),
                    content: const Text('체중(kg)은 30 이상의 값만 입력 가능합니다.'),
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
            } else {
              return Navigator.push(
                context, 
                NoAnimationPageRoute(
                  builder: (context) => const HomeScreen(), 
                  settings: const RouteSettings(name: 'home_screen')
                )
              );
            }   
          },
        )
      )
    );
  }
}
