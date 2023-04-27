import 'package:flutter/material.dart';

import '../common/no_animation_page_route.dart';

import '../widgets/custom_app_bar.dart';
import '../widgets/custom_bottom_navigation_bar.dart';


class FoodRecordScreen extends StatelessWidget {
  final List<String> dateList = [
    '4월 18일',
    '4월 19일',
    '4월 20일',
    '4월 21일',
    '4월 22일',
    '4월 23일',
    '4월 24일',
  ];

  final List<List<String>> menuList = [
    [
      'assets/images/sample_food/f1.png',
      'assets/images/sample_food/f3.png',
      'assets/images/sample_food/f5.png',
    ],
    [
      'assets/images/sample_food/f2.png',
      'assets/images/sample_food/f3.png',
      'assets/images/sample_food/f4.png',
      'assets/images/sample_food/f5.png',
      'assets/images/sample_food/f1.png',
    ],
    [
      'assets/images/sample_food/f4.png',
      'assets/images/sample_food/f1.png',
    ],
    [
      'assets/images/sample_food/f2.png',
      'assets/images/sample_food/f3.png',
      'assets/images/sample_food/f5.png',
    ],
    [
      'assets/images/sample_food/f1.png',
      'assets/images/sample_food/f5.png',
      'assets/images/sample_food/f1.png',
    ],
    [
      'assets/images/sample_food/f2.png',
      'assets/images/sample_food/f4.png',
      'assets/images/sample_food/f1.png',
    ],
    [
      'assets/images/sample_food/f2.png',
      'assets/images/sample_food/f3.png',
      'assets/images/sample_food/f5.png',
    ],
  ];

  FoodRecordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: const CustomAppBar(),
        body: SafeArea(
          child: ListView.builder(
            itemCount: dateList.length,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24.0, 
                      vertical: 10.0
                    ),
                    child: Text(
                      dateList[index],
                      style: const TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Center(
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.8,
                      height: 100.0,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: menuList[index].length,
                        itemBuilder: (BuildContext context, int index2) {
                          return Container(
                            // decoration: BoxDecoration(
                            //   border: Border.all(
                            //     color: Colors.grey, // 윤곽선 색상
                            //     width: 1.0, // 윤곽선 너비
                            //   ),
                            // ),
                            margin: const EdgeInsets.all(0.2),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  NoAnimationPageRoute(
                                    builder: (context) => FoodRecordScreen(), 
                                    settings: const RouteSettings(name: 'food_record_screen')
                                  ),
                                );
                              },
                              child: Image.asset(
                                menuList[index][index2],
                                width: 100.0,
                                height: 100.0,
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 10,)
                ],
              );
            },
          ),
        ),
        bottomNavigationBar: const CustomBottomNavigationBar(),
      ),
    );
  }
}