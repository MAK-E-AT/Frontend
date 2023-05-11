import 'package:flutter/material.dart';
import 'package:makeat_fe/widgets/custom_stacked_bar.dart';

import '../widgets/custom_bar_chart.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/custom_bottom_navigation_bar.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: const CustomAppBar(),
            body: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    // 주간 칼로리 섭취량 <- 일별 총 섭취 칼로리 텍스트 넣기
                    const Padding(
                      padding: EdgeInsets.fromLTRB(24.0, 12.0, 0.0, 0.0),
                      child: Text(
                        '주간 칼로리 섭취량 [kcal]',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    CustomBarChart(), 

                    // 내 신체 정보
                    // const Padding(
                    //   padding: EdgeInsets.fromLTRB(24.0, 16.0, 0.0, 4.0),
                    //   child: Text(
                    //     '내 신체 정보',
                    //     style: TextStyle(
                    //       fontSize: 14,
                    //       fontWeight: FontWeight.bold,
                    //     ),
                    //   ),
                    // ),
                    Container(
                      margin: const EdgeInsets.all(12.0),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text(
                                  '키',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  '  180 cm',
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 50.0),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text(
                                  '체중',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  '  80 kg',
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 50.0),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text(
                                  'BMI',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(width: 4.0),
                                Text(
                                  '24.7',
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    // 오늘 섭취한 영양 성분 현황
                    const SizedBox(height: 20.0,),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(24.0, 8.0, 0.0, 12.0), // 수정
                      child: Text(
                        '오늘 섭취한 영양 성분',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    CustomStackedBar(
                      title: '총 섭취 열량', 
                      color: Colors.purple.shade200, 
                      currentValue: 1862, 
                      targetValue: 2400,
                      unit: 'kcal',
                    ),
                    CustomStackedBar(
                      title: '탄수화물', 
                      color: Colors.red.shade200, 
                      currentValue: 240, 
                      targetValue: 330,
                      unit: 'g',
                    ),
                    CustomStackedBar(
                      title: '단백질', 
                      color: Colors.orange.shade200, 
                      currentValue: 80, 
                      targetValue: 135,
                      unit: 'g',
                    ),
                    CustomStackedBar(
                      title: '지방', 
                      color: Colors.yellow.shade200, 
                      currentValue: 42, 
                      targetValue: 73,
                      unit: 'g',
                    ),
                  ],
                ),
              ),
            ),
            bottomNavigationBar: const CustomBottomNavigationBar(),
      )
    );
  }
}