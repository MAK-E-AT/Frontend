// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:makeat_fe/views/additional_meal_form.dart';

import 'package:makeat_fe/widgets/custom_elevated_button.dart';

import '../common/no_animation_page_route.dart';

import '../widgets/custom_text_box.dart';


class AnalyzedImageScreen extends StatefulWidget {
  const AnalyzedImageScreen({super.key});

  @override
  State<AnalyzedImageScreen> createState() => _AnalyzedImageScreenState();
}

class _AnalyzedImageScreenState extends State<AnalyzedImageScreen> {

  List<Map<String, String>> foodList = [];

  String selectedFood = '음식';
  int quantity = 1;
  String unit = '인분';
  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            body: SafeArea(
              child: SingleChildScrollView(
                child: Center(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20.0,
                      ),
                
                      /* MAK-E-AT 로고(소) */
                      Image.asset(
                        width: 140.0,
                        'assets/images/makeat_logo/logo_small_size.png',
                      ),
                      const SizedBox(
                        height: 30.0,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.black54, width: 2),
                        ),
                        width: 280.0,
                        height: 320.0, // size 수정 필요
                        child: Image.asset(
                            'assets/images/sample_food/sample_food.png',
                            fit: BoxFit.cover),
                      ),
                      const SizedBox(
                        height: 30.0,
                      ),
                      Container(
                        decoration: const BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    color: Colors.black54, width: 2))),
                        child: const Text(
                          "검색된 음식 목록",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 24.0,
                      ),
                      Container(
                        height: 160.0,
                        width: MediaQuery.of(context).size.width * 0.76,
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: foodList.length,
                          itemBuilder: (context, index) {
                            return CustomTextBox(
                              name: foodList[index]['name']!,
                              quantity: foodList[index]['quantity']!,
                              unit: foodList[index]['unit']!,
                              onPressedEdit: () { 
                                return showDialog(
                                  context: context,
                                  useRootNavigator: true,
                                  builder: (context) => AddFoodForm(
                                    foodName: foodList[index]['name']!,
                                    foodQuantity: foodList[index]['quantity']!,
                                    foodUnit: foodList[index]['unit']!,
                                    onAddFood: (selectedFood, quantity, unit) {
                                      setState(() {
                                        foodList[index]['name'] = selectedFood;
                                        foodList[index]['quantity'] = quantity.toString();
                                        foodList[index]['unit'] = unit;
                                      });
                                      Navigator.pop(context);
                                    },
                                  ),
                                );
                              },
                              onPressedDelete: () async { 
                                return setState(() {
                                  foodList.removeAt(index);
                                });
                              },
                            );
                          },
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                        ),
                      ),

                      TextButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            useRootNavigator: true,
                            builder: (context) => AddFoodForm(
                              // 음식 목록 추가
                              onAddFood: (selectedFood, quantity, unit) {
                                setState(() {
                                  foodList.add({
                                    'name': selectedFood,
                                    'quantity': quantity.toString(),
                                    'unit': unit,
                                  });
                                });
                                Navigator.pop(context);
                              },
                            ),
                          );
                        },
                        child: const Text('검색 목록에 없는 음식이 있어요...'),
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
                    builder: (context) => const AnalyzedImageScreen(), 
                    settings: const RouteSettings(name: 'analyzed_image_screen')
                  )
                );
              },
            )
      )
    );
  }
}
