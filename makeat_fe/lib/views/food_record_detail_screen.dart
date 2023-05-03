import 'package:flutter/material.dart';
import 'package:makeat_fe/views/food_record_screen.dart';

import '../common/no_animation_page_route.dart';

import '../widgets/custom_app_bar.dart';
import '../widgets/custom_bottom_navigation_bar.dart';


class FoodRecordDetailScreen extends StatefulWidget {
  final String selectedDate;


  const FoodRecordDetailScreen({Key? key, required this.selectedDate}) : super(key: key);

  @override
  State<FoodRecordDetailScreen> createState() => _FoodRecordDetailScreenState();
}

class _FoodRecordDetailScreenState extends State<FoodRecordDetailScreen> {
  final List<List<String>> mealRecordList = [
    [
      'assets/images/sample_food/sample_food.png',
      'assets/images/sample_diagram/d1.png',
    ],
    [
      'assets/images/sample_food/sample_food.png',
      'assets/images/sample_diagram/d1.png',
    ],
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: const CustomAppBar(),
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 10.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    widget.selectedDate,
                    style: const TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 24.0),
                height: 1.0,
                color: Colors.black,
              ),
              const SizedBox(height: 20.0,),
              Expanded(
                child: ListView.builder(
                  itemCount: mealRecordList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 24.0, 
                            vertical: 10.0
                          ),
                          child: Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  children: [
                                    const WidgetSpan(
                                      child: Icon(
                                        Icons.restaurant, size: 16.0,
                                        color: Colors.red,
                                      ),
                                      alignment: PlaceholderAlignment.middle, // 아이콘 정렬 설정
                                    ),
                                    TextSpan(
                                      text: ' ${index + 1}끼  -  ',
                                      style: const TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                TextSpan(
                                  text: '${widget.selectedDate}  08시 53분 ',
                                  style: const TextStyle(
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Center(
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.81,
                            height: MediaQuery.of(context).size.width * 0.4,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: mealRecordList[index].length,
                              itemBuilder: (BuildContext context, int index2) {
                                return Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.black54, // 윤곽선 색상
                                      width: 0.5, // 윤곽선 너비
                                    ),
                                  ),
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
                                      mealRecordList[index][index2],
                                      width: MediaQuery.of(context).size.width * 0.4,
                                      height: MediaQuery.of(context).size.width * 0.4,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                        const SizedBox(height: 20,)
                      ],
                    );
                  },
                ),
              ),
            ],
          )
        ),
        bottomNavigationBar: const CustomBottomNavigationBar(),
      ),
    );
  }
}