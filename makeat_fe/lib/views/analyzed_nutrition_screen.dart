// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:makeat_fe/widgets/custom_grid_menu.dart';
import 'package:makeat_fe/widgets/custom_title_text.dart';

import '../widgets/custom_elevated_button.dart';
import '../widgets/custom_pie_chart.dart';
import '../widgets/custom_text_box.dart';
import '../common/no_animation_page_route.dart';



class AnalyzedNutritionScreen extends StatefulWidget {
  final String selectedDate;
  final Map<String, double> dataMap;

  const AnalyzedNutritionScreen({
    Key? key, 
    required this.selectedDate,
    required this.dataMap
  }) : super(key: key);

  @override
  State<AnalyzedNutritionScreen> createState() => _AnalyzedNutritionScreenState();
}

class _AnalyzedNutritionScreenState extends State<AnalyzedNutritionScreen> {

  // 샘플 영양 분석 데이터

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              child: Center(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(24.0, 10.0, 24.0, 4.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          widget.selectedDate,
                          style: const TextStyle(
                              fontSize: 24.0, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 24.0),
                      height: 1.0,
                      color: Colors.black,
                    ),

                    const CustomTitleText(
                      title: '영양 성분 다이어그램', 
                      paddingLTRB: [0.0, 40.0, 0.0, 0.0],
                      underlineWidth: 150.0,
                    ),
                    // 칼로리가 포함된 경우,
                    // CustomPieChart(dataMap: Map.fromEntries(widget.dataMap.entries.toList().getRange(0, widget.dataMap.length - 1))),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(36.0, 12.0, 36.0, 20.0),
                      child: CustomPieChart(dataMap: widget.dataMap),
                    ),

                    const CustomTitleText(
                      title: '영양 성분표', 
                      paddingLTRB: [0.0, 18.0, 0.0, 0.0],
                      underlineWidth: 90.0,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.76,
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: widget.dataMap.length,
                        itemBuilder: (context, index) {
                          return CustomTextBox(
                            name: widget.dataMap.keys.elementAt(index),
                            quantity: widget.dataMap.values.elementAt(index).toString(),
                            unit: 'g',
                          );
                        },
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black38,
                          width: 0.8
                        ),
                      ),
                    ),

                    const CustomTitleText(
                      title: '운동별 칼로리 소모 시간', 
                      paddingLTRB: [0.0, 52.0, 0.0, 0.0],
                      underlineWidth: 160.0,
                    ),
                    Text.rich(
                      TextSpan(
                        text: "총 섭취한 열량:  ",
                        style: const TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.w400,
                        ),
                        children: [
                          TextSpan(
                            text: "${widget.dataMap["탄수화물"]! * 4 
                            + widget.dataMap["단백질"]! * 4 
                            + widget.dataMap["지방"]! * 9}",
                            style: TextStyle(
                              color: Colors.red.shade600,
                              fontWeight: FontWeight.w600
                            ),
                          ),
                          const TextSpan(
                            text: " kcal",
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.05),
                      child: const CustomGridMenu(
                        // 소모 시간은 추후에 1분당 운동별 칼로리 소모량을 이용해 계산(소수점 버림)
                        menuTitles: ['하이킹', '조깅', '요가'],
                        subTexts: ['26', '30', '38'],
                        menuImages: [
                          'assets/images/exercise_select/hiking.png',   
                          'assets/images/exercise_select/jogging.png', 
                          'assets/images/exercise_select/yoga.png'
                        ], 
                        onTap: null
                      ),
                    ),
                    const SizedBox(height: 20.0,)
                  ],
                ),
              ),
            ),
          ),
          bottomNavigationBar: CustomElevatedButton(
            buttonText: '식단 평가하기',
            onPressed: () {
              return Navigator.push(
                context, 
                NoAnimationPageRoute(
                  // 추후 식단 평가 페이지로 이동
                  builder: (context) => AnalyzedNutritionScreen(
                    selectedDate: widget.selectedDate,
                    dataMap: widget.dataMap
                  ), 
                  settings: const RouteSettings(name: 'analyzed_nutrition_screen')
                )
              );
            },
          )
      )
    );
  }
}
