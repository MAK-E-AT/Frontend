import 'package:flutter/material.dart';
import 'package:makeat_fe/widgets/custom_square_container.dart';

import '../common/no_animation_page_route.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/custom_bottom_navigation_bar.dart';
import '../widgets/custom_image_picker.dart';
import 'food_record_detail_screen.dart';


class FoodRecordScreen extends StatelessWidget {
  final List<String> dateList = [
    '6월 07일',
    '6월 06일',
    '6월 05일',
    '6월 04일',
    '6월 03일',
    '6월 02일',
  ];

  final List<List<String>> timeList= [
    [
      // '08시 53분',
      // '12시 36분',
    ],
    [
      '08시 57분',
      '13시 53분',
      '19시 42분',
    ],
    [
      // '08시 51분',
      // '15시 59분',
    ],
    [
      '07시 43분',
      '14시 45분',
    ],
    [
      '08시 52분',
      '12시 57분',
      '19시 23분',
    ],
    [
      '08시 51분',
      '14시 33분',
    ],
  ];

  final List<List<String>> mealList = [
    [
      // 'assets/images/sample_food/f4.png',
      // 'assets/images/sample_food/f2.png',
    ],
    [
      'assets/images/sample_food/f1.png',
      'text/망고 샐러드',
      'assets/images/sample_food/f5.png',
    ],
    [
      // 'assets/images/sample_food/f5.png',
      // 'assets/images/sample_food/f4.png',
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
    ],
  ];

  final List<List<Map<String, double>>> nutritionList = [
    [
      // {
      //   "탄수화물": 77.0,
      //   "단백질": 13.0,
      //   "지방": 12.0,
      //   "나트륨": 6.0,
      // },
      // {
      //   "탄수화물": 84.0,
      //   "단백질": 21.0,
      //   "지방": 18.0,
      //   "나트륨": 15.0,
      // },
    ],
    [
      {
        "탄수화물": 76.0,
        "단백질": 24.0,
        "지방": 11.0,
        "나트륨": 4.0,
      },
      {
        "탄수화물": 98.0,
        "단백질": 21.0,
        "지방": 18.0,
        "나트륨": 15.0,
      },
      {
        "탄수화물": 94.0,
        "단백질": 31.0,
        "지방": 18.0,
        "나트륨": 11.0,
      },
    ],
    [
      // {
      //   "탄수화물": 66.0,
      //   "단백질": 27.0,
      //   "지방": 10.0,
      //   "나트륨": 8.0,
      // },
      // {
      //   "탄수화물": 94.0,
      //   "단백질": 11.0,
      //   "지방": 18.0,
      //   "나트륨": 15.0,
      // },
    ],
    [
      {
        "탄수화물": 86.0,
        "단백질": 19.0,
        "지방": 10.0,
        "나트륨": 7.0,
      },
      {
        "탄수화물": 88.0,
        "단백질": 22.0,
        "지방": 18.0,
        "나트륨": 12.0,
      },
    ],
    [
      {
        "탄수화물": 72.0,
        "단백질": 12.0,
        "지방": 12.0,
        "나트륨": 8.0,
      },
      {
        "탄수화물": 88.0,
        "단백질": 21.0,
        "지방": 19.0,
        "나트륨": 15.0,
      },
      {
        "탄수화물": 81.0,
        "단백질": 21.0,
        "지방": 24.0,
        "나트륨": 15.0,
      },
    ],
    [
      {
        "탄수화물": 96.0,
        "단백질": 17.0,
        "지방": 20.0,
        "나트륨": 6.0,
      },
      {
        "탄수화물": 74.0,
        "단백질": 41.0,
        "지방": 18.0,
        "나트륨": 15.0,
      },
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
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Center(
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.8,
                      height: nutritionList[index].isNotEmpty ? 100.0 : 112.0,
                      child: nutritionList[index].isNotEmpty 
                      ? ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: mealList[index].length,
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
                                      builder: (context) => FoodRecordDetailScreen(
                                        selectedDate: dateList[index],
                                        selectedTime: timeList[index],
                                        selectedMeal: mealList[index],
                                        selectedNutrition: nutritionList[index],
                                      ), 
                                      settings: const RouteSettings(name: 'image_picker_screen')
                                    ),
                                  );
                                },
                                child: mealList[index][index2].toLowerCase().startsWith('text/')
                                  ? CustomSquareContainer(text: mealList[index][index2].replaceFirst('text/', ''))
                                  : Image.asset(
                                      mealList[index][index2],
                                      width: 100.0,
                                      height: 100.0,
                                      fit: BoxFit.cover,
                                    )
                              ),
                            );
                          },
                        )
                      : CustomImagePicker(selectedDate: dateList[index], isLabel: false, spaceBetween: 0.0,)
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