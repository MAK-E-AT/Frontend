import 'package:flutter/material.dart';
import 'package:makeat_fe/widgets/custom_grid_menu.dart';

import 'food_record_screen.dart';
import '../widgets/custom_info_box.dart';
import '../widgets/custom_title_text.dart';
import '../widgets/custom_stacked_bar.dart';
import '../widgets/custom_bar_chart.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/custom_bottom_navigation_bar.dart';
import '../common/no_animation_page_route.dart';


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

                    //주간 칼로리 섭취량 <- 일별 총 섭취 칼로리 텍스트 넣기
                    const CustomTitleText(
                      title: '주간 칼로리 섭취량 [kcal]',
                      paddingLTRB: [24.0, 24.0, 0.0, 0.0],
                    ),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(18.0, 0.0, 18.0, 0.0),
                      child: CustomBarChart(),
                    ), 

                    // 내 신체 정보
                    const CustomTitleText(
                      title: '내 신체 정보',
                      paddingLTRB: [24.0, 24.0, 0.0, 0.0],
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(24.0, 0.0, 24.0, 8.0),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey.shade800,
                          width: 1.5,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                      child: const CustomInfoBox(
                        text1: '키', text2: '180 cm', 
                        text3: '체중', text4: '80 kg', 
                        text5: 'BMI', text6: '24.7'
                      )
                    ),

                    // 오늘 섭취한 영양 성분 현황
                    const CustomTitleText(
                      title: '오늘 섭취한 영양 성분',
                      paddingLTRB: [24.0, 32.0, 0.0, 0.0],
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          NoAnimationPageRoute(
                            // 홈 스크린에서 오늘 날짜 식단 기록 상세 페이지 이동시, 백엔드에서 현재 날짜 기준 데이터 줘야 함.
                            builder: (context) => FoodRecordScreen(),
                            settings: const RouteSettings(
                                name: 'food_record_screen')),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(12.0, 4.0, 12.0, 10.0),
                        child: SizedBox(
                          child: Column(children: [
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
                              color: Colors.yellow.shade300, 
                              currentValue: 42, 
                              targetValue: 73,
                              unit: 'g',
                            ),
                          ]),
                        ),
                      ),
                    ), 

                    // 음식 추천
                    const CustomTitleText(
                      title: '실시간 음식 추천',
                      paddingLTRB: [24.0, 24.0, 0.0, 0.0],
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.0),
                      child: CustomGridMenu(
                        menuTitles: [
                          '감자', '바나나', '귀리'
                        ], 
                        menuImages: [
                          'assets/images/sample_food/f9.jpeg',
                          'assets/images/sample_food/f10.jpg',
                          'assets/images/sample_food/f11.jpeg',
                        ], 
                        imgWidth: 92.0,
                        imgHeight: 92.0,
                        padding: EdgeInsets.symmetric(vertical: 8.0),
                        onTap: null
                      )
                      // Row(
                      //   children: [

                      //     ClipOval(
                      //       child: Image.asset(
                      //         'assets/images/sample_food/f9.jpeg',
                      //         width: 120,
                      //         height: 120,
                      //         fit: BoxFit.cover,
                      //       ),
                      //     ),
                      //     ClipOval(
                      //       child: Image.asset(
                      //         'assets/images/sample_food/f10.jpg',
                      //         width: 120,
                      //         height: 120,
                      //         fit: BoxFit.cover,
                      //       ),
                      //     ),
                      //     ClipOval(
                      //       child: Image.asset(
                      //         'assets/images/sample_food/f11.jpeg',
                      //         width: 120,
                      //         height: 120,
                      //         fit: BoxFit.cover,
                      //       ),
                      //     ),
                      //   ],
                      // ),
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