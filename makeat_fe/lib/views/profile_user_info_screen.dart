import 'package:flutter/material.dart';

import '../common/no_animation_page_route.dart';

import '../widgets/custom_app_bar.dart';
import '../widgets/custom_elevated_button.dart';
import '../widgets/custom_grid_select.dart';
import '../widgets/custom_horizontal_select.dart';
import '../widgets/custom_text_field.dart';

import 'package:makeat_fe/views/profile_user_screen.dart';

class ProfileUserInfoScreen extends StatefulWidget {
  const ProfileUserInfoScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ProfileUserInfoScreenState createState() => _ProfileUserInfoScreenState();
}

class _ProfileUserInfoScreenState extends State<ProfileUserInfoScreen> {

  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _kcalController = TextEditingController();
  
  final List<String> _imgList = [
    'assets/images/exercise_select/hiking.png',
    'assets/images/exercise_select/jogging.png',
    'assets/images/exercise_select/yoga.png',
    'assets/images/exercise_select/walking.png',
    'assets/images/exercise_select/soccer.png',
    'assets/images/exercise_select/pilates.png',
    'assets/images/exercise_select/climbing.png',
    'assets/images/exercise_select/climbing_stairs.png',
    'assets/images/exercise_select/swimming.png',
    'assets/images/exercise_select/jumping_rope.png',
    'assets/images/exercise_select/badminton.png',
    'assets/images/exercise_select/dancing.png',
    'assets/images/exercise_select/lunges.png',
    'assets/images/exercise_select/cycle.png',
  ];

  final List<String> _workoutList = [
    '하이킹',
    '조깅',
    '요가',
    '걷기',
    '축구',
    '필라테스',
    '클라이밍',
    '계단 오르기',
    '수영',
    '줄넘기',
    '배드민턴',
    '댄스',
    '런지',
    '사이클',
  ];

  final List<String> _workoutInfoList = [
    '400',
    '500',
    '200',
    '250',
    '600',
    '300',
    '700',
    '450',
    '550',
    '400',
    '350',
    '300',
    '200',
    '600',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 8.0,),

                /* 나이
                  1. 숫자 타입
                  2. 200 미만
                  3. 정수만 허용
                */
                // CustomTextField(
                //   textEditingController: _ageController, 
                //   labelText: '나이 (세)', 
                //   labelTextSize: 15.0, 
                //   hintText: '만 나이를 입력해주세요.', 
                //   textFieldWidth: MediaQuery.of(context).size.width * 0.55,
                //   leftWhiteSpaceWidth: MediaQuery.of(context).size.width * 0.05,
                //   rightWhiteSpaceWidth: 20.0,
                //   regExp: r'^(?!0)[1-9][0-9]?$|^1\d{2}$', 
                // ),
                // -> 나이는 사용자가 변경할 수 없게끔 하는게 좋을 것 같아요
    
                /* 키 
                  1. 숫자 타입
                  2. 300 이하
                  3. 소수점은 한 자리까지만 허용
                */
                CustomTextField(
                  textEditingController: _heightController, 
                  labelText: '키 (cm)', 
                  labelTextSize: 14.0, 
                  hintText: '소수점은 한 자리까지만 가능해요.', 
                  textFieldWidth: MediaQuery.of(context).size.width * 0.55,
                  leftWhiteSpaceWidth: MediaQuery.of(context).size.width * 0.05,
                  rightWhiteSpaceWidth: 28.0,
                  regExp: r'^(?!0)([1-2]?\d{0,2}(\.\d{0,1})?|300(\.0)?)$', 
                ),
                
                /* 체중 
                  1. 숫자 타입
                  2. 200 이하
                  3. 소수점은 한 자리까지만 허용
                */
                CustomTextField(
                  textEditingController: _weightController, 
                  labelText: '체중 (kg)', 
                  labelTextSize: 14.0, 
                  hintText: '소수점은 한 자리까지만 가능해요.', 
                  textFieldWidth: MediaQuery.of(context).size.width * 0.55,
                  leftWhiteSpaceWidth: MediaQuery.of(context).size.width * 0.05,
                  rightWhiteSpaceWidth: 20.0,
                  regExp: r'^(?!0)(\d{0,2}(\.\d{0,1})?|200(\.0)?)$', 
                ),
    
                /* 일일 목표 섭취 칼로리
                  1. 숫자 타입
                  2. 10000 미만
                  3. 소수점은 허용 X
                */
                CustomTextField(
                  textEditingController: _kcalController, 
                  labelText: '목표 (kcal)', 
                  labelTextSize: 14.0, 
                  hintText: '일일 목표 섭취 칼로리를 적어주세요.', 
                  textFieldWidth: MediaQuery.of(context).size.width * 0.55,
                  leftWhiteSpaceWidth: MediaQuery.of(context).size.width * 0.05,
                  rightWhiteSpaceWidth: 10.0,
                  regExp: r'^(?!0)\d{1,4}$',
                ),
                const SizedBox(height: 20.0,),
    
                /* 앱 사용 목적 */
                Padding(
                  padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width * 0.05,0,0,0),
                  child: CustomHorizontalSelect(
                    label: '사용 목적',
                    items: const <String>['다이어트', '벌크업', '유지'],
                    isLabel: true,
                    onChanged: (value) { print(value); },
                  ),
                ),
                const SizedBox(height: 20.0,),
    
                /* 평소 활동량 */
                Padding(
                  padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width * 0.05,0,0,0),
                  child: CustomHorizontalSelect(
                    label: '평소 활동량',
                    items: const <String>['1', '2', '3', '4', '5'],
                    isLabel: true,
                    onChanged: (value) { print(value); },
                  ),
                ),
                const SizedBox(height: 30.0,),
    
                /* 선호하는 운동 선택하기
                  1. 그리드뷰
                  2. 최대 3개까지 선택 가능
                  3. 선택한 운동을 다시 탭하면 선택 해제
                */
                const Text(
                  '  선호하는 운동 3개 선택하기  ',
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5.0,),
                CustomGridSelection(
                  imgList: _imgList,
                  workoutList: _workoutList,
                  workoutInfoList: _workoutInfoList,
                ),
                const SizedBox(height: 20.0,)
              ],
            ),
          ),
        ),
      bottomNavigationBar: CustomElevatedButton(
        buttonText: '내   정 보   수 정 하 기',
        onPressed: () {
          return Navigator.push(
            context, 
            NoAnimationPageRoute(
              builder: (context) => const ProfileUserScreen(), 
              settings: const RouteSettings(name: 'profile_user_screen')
            )
          );
        },
      ),
    );
  }
}