// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';

import '../widgets/custom_app_bar.dart';
import '../widgets/custom_elevated_button.dart';
import '../widgets/custom_pie_chart.dart';
import '../widgets/custom_text_box.dart';
import '../common/no_animation_page_route.dart';



class AnalyzedNutritionScreen extends StatefulWidget {
  const AnalyzedNutritionScreen({super.key});

  @override
  State<AnalyzedNutritionScreen> createState() => _AnalyzedNutritionScreenState();
}

class _AnalyzedNutritionScreenState extends State<AnalyzedNutritionScreen> {

  // 샘플 영양 분석 데이터
  Map<String, double> dataMap = {
    "탄수화물": 76.0,
    "단백질": 17.0,
    "지방": 10.0,
    "나트륨": 6.0,
    "칼로리": 431.0,
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: const CustomAppBar(),
            body: SafeArea(
              child: SingleChildScrollView(
                child: Center(
                  child: Column(
                    children: [
                      const SizedBox(height: 30.0,),
                      CustomPieChart(dataMap: Map.fromEntries(dataMap.entries.toList().getRange(0, dataMap.length - 1))),
                      const SizedBox(
                        height: 24.0,
                      ),
                      Container(
                        height: 160.0,
                        width: MediaQuery.of(context).size.width * 0.76,
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: dataMap.length - 1,
                          itemBuilder: (context, index) {
                            return CustomTextBox(
                              name: dataMap.keys.elementAt(index),
                              quantity: dataMap.values.elementAt(index).toString(),
                              unit: 'g',
                            );
                          },
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                        ),
                      ),
                      const SizedBox(height: 20.0,),
                      Column(
                        children: [
                          Text(
                            "총 열량 :  ${dataMap.values.elementAt(dataMap.length-1)} kcal",
                            style: const TextStyle(
                              fontSize: 18.0,
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 4.0),
                            width: 180.0,
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
                    builder: (context) => const AnalyzedNutritionScreen(), 
                    settings: const RouteSettings(name: 'analyzed_image_screen')
                  )
                );
              },
            )
      )
    );
  }
}
