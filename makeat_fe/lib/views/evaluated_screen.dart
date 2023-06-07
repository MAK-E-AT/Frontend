// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';

import 'food_record_screen.dart';

import '../widgets/custom_grid_select.dart';
import '../widgets/custom_app_bar2.dart';
import '../widgets/custom_title_text.dart';
import '../widgets/custom_elevated_button.dart';

import '../common/no_animation_page_route.dart';



class EvalutatedScreen extends StatefulWidget {
  final String selectedDate;

  const EvalutatedScreen({
    Key? key, 
    required this.selectedDate,
  }) : super(key: key);

  @override
  State<EvalutatedScreen> createState() => _EvalutatedScreenState();
}

class _EvalutatedScreenState extends State<EvalutatedScreen> {

  final TextEditingController _memoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          body: SafeArea(
            child: CustomScrollView(
              slivers: <Widget>[
                CustomAppBar2(nextScreen: FoodRecordScreen(),),
                SliverFillRemaining(
                  child: Center(
                    child: Column(
                      children: [
                        const CustomTitleText(
                          title: '식단 평가', 
                          paddingLTRB: [0.0, 0.0, 0.0, 0.0],
                          underlineWidth: 80.0,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.76,
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              children: const [
                                Text(
                                  '귀하의 에너지 섭취량은 목표 영양섭취 기준 대비 79.8%로 적정(75%~125%)입니다.',
                                  // 목표 영양섭취기준 초기값 -> 성별과 연령대에 따른 적절한 한국인 영양섭취기준 대비)
                                  overflow: TextOverflow.clip,
                                ),
                                SizedBox(height: 8.0,),
                                Text(
                                  '또한 탄수화물, 단백질, 지방으로부터 각각 60%, 18%, 21%를 섭취한 것으로 나타나 탄수화물은 적정, 단백질은 적정, 지방은 적정 입니다.',
                                  overflow: TextOverflow.clip,
                                ),
                              ],
                            ),
                            
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(width: 0.5),
                            color: Colors.grey.shade200
                          ),
                        ),
                  
                        const CustomTitleText(
                          title: '식단 메모', 
                          paddingLTRB: [0,24,0,0],
                          underlineWidth: 80.0,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.76,
                          height: 240.0,
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: TextField(
                              controller: _memoController,
                              keyboardType: TextInputType.multiline,
                              maxLength: 120,
                              maxLines: null,
                              cursorColor: Colors.grey.shade700,
                              decoration: InputDecoration(
                                focusedBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black54),
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey.shade300),
                                ),
                                focusedErrorBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black54),
                                ),
                                errorBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black54),
                                ),
                              ),
                            )
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(width: 0.5),
                            color: Colors.grey.shade200
                          ),
                        ),
                  
                        const Padding(
                          padding: EdgeInsets.fromLTRB(24.0, 12.0, 24.0, 0.0),
                          child: CustomGridSelect(
                            imgList: [
                              'assets/images/score_select/red_off.png',
                              'assets/images/score_select/yellow_off.png',
                              'assets/images/score_select/green_off.png',
                            ],
                            imgList2: [
                              'assets/images/score_select/red_on.png',
                              'assets/images/score_select/yellow_on.png',
                              'assets/images/score_select/green_on.png',
                            ],
                            imgWidth: 50.0,
                            imgHeight: 50.0,
                            workoutList: [
                              '좋음', '보통', '나쁨'
                            ], 
                            maxSelect: 1,
                            isBackground: false,
                            isBorder: false,
                          ),
                        ),
                        
                        const SizedBox(height: 30.0,)
                      ],
                    ),
                  ),
                ),
              ], 
            ),
          ),
          bottomNavigationBar: CustomElevatedButton(
            buttonText: '식단 저장하기',
            onPressed: () {
              return Navigator.push(
                context, 
                NoAnimationPageRoute(
                  builder: (context) => FoodRecordScreen(), 
                  settings: const RouteSettings(name: 'food_record_screen')
                )
              );
            },
          )
      )
    );
  }
}
