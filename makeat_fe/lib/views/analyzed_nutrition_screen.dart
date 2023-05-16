// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
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
                    
                    const SizedBox(height: 60.0,),
                    Column(
                      children: [
                        Text(
                          "총 섭취한 열량 :  ${     
                            widget.dataMap["탄수화물"]!*4
                            + widget.dataMap["단백질"]!*4
                            + widget.dataMap["지방"]!*9
                          } kcal",
                          style: const TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w500
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 4.0),
                          width: 240.0,
                          height: 1.0,
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          bottomNavigationBar: CustomElevatedButton(
            buttonText: '영양 성분 확인하기',
            onPressed: () {
              return Navigator.push(
                context, 
                NoAnimationPageRoute(
                  builder: (context) => AnalyzedNutritionScreen(
                    selectedDate: widget.selectedDate,
                    dataMap: widget.dataMap
                  ), 
                  settings: const RouteSettings(name: 'analyzed_image_screen')
                )
              );
            },
          )
      )
    );
  }
}
