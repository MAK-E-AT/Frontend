import 'package:flutter/material.dart';
import 'package:makeat_fe/widgets/custom_app_bar.dart';
import 'package:makeat_fe/widgets/custom_elevated_button.dart';

import '../widgets/custom_text_field.dart';

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
  
  final List<String> _exerciseList = [
    'Exercise 1',
    'Exercise 2',
    'Exercise 3',
    'Exercise 4',
    'Exercise 5',
    'Exercise 6',
    'Exercise 7',
    'Exercise 8',
    'Exercise 9',
    'Exercise 10',
    'Exercise 11',
    'Exercise 12',
    'Exercise 13',
    'Exercise 14',
  ];
  final List<bool> _isSelected = List.generate(14, (_) => false);
  int _selectedCount = 0;

  void _handleExerciseTap(int index) {
    setState(() {
      if (_isSelected[index]) {
        _selectedCount--;
        _isSelected[index] = false;
      } else if (_selectedCount < 3) {
        _selectedCount++;
        _isSelected[index] = true;
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('최대 3개의 운동만 선택할 수 있습니다.'),
            duration: Duration(seconds: 1),
          ),
        );
      }
    });
  }

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

                /* 나이
                  1. 숫자 타입
                  2. 200 미만
                  3. 정수만 허용
                */
                CustomTextField(
                  textEditingController: _ageController, 
                  labelText: '나이 (세)', 
                  labelTextSize: 15.0, 
                  hintText: '만 나이를 입력해주세요.', 
                  textFieldWidth: MediaQuery.of(context).size.width * 0.5,
                  leftWhiteSpaceWidth: MediaQuery.of(context).size.width * 0.1,
                  rightWhiteSpaceWidth: 20.0,
                  regExp: r'^^(?!0)[1-9][0-9]?$|^1\d{2}$', 
                ),

                /* 키 
                  1. 숫자 타입
                  2. 300 이하
                  3. 소수점은 한 자리까지만 허용
                */
                CustomTextField(
                  textEditingController: _heightController, 
                  labelText: '키 (cm)', 
                  labelTextSize: 15.0, 
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
                  labelText: '체중 (kg)', 
                  labelTextSize: 15.0, 
                  hintText: '소수점은 한 자리까지만 가능해요.', 
                  textFieldWidth: MediaQuery.of(context).size.width * 0.5,
                  leftWhiteSpaceWidth: MediaQuery.of(context).size.width * 0.1,
                  rightWhiteSpaceWidth: 12.0,
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
                  labelTextSize: 15.0, 
                  hintText: '일일 목표 섭취 칼로리를 적어주세요.', 
                  textFieldWidth: MediaQuery.of(context).size.width * 0.5,
                  leftWhiteSpaceWidth: MediaQuery.of(context).size.width * 0.1,
                  rightWhiteSpaceWidth: 12.0,
                  regExp: r'^(?!0)\d{1,4}$',
                ),

                const SizedBox(height: 30.0,),

                const Text(
                  '선호하는 운동 3개 선택하기',
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10.0),
                Expanded(
                  child: GridView.builder(
                    itemCount: _exerciseList.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 10.0,
                      mainAxisSpacing: 10.0,
                      childAspectRatio: 1.0,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          _handleExerciseTap(index);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: _isSelected[index]
                                ? Colors.greenAccent
                                : Colors.grey[300],
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.fitness_center,
                                size: 50.0,
                              ),
                              Text(_exerciseList[index]),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      bottomNavigationBar: const CustomElevatedButton(
        buttonText: '내   정 보   수 정 하 기',
      ),
    );
  }
}