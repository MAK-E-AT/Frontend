// ignore_for_file: sort_child_properties_last, avoid_print

import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:makeat_fe/widgets/custom_text_field.dart';

import 'additional_meal_form.dart';
import 'analyzed_nutrition_screen.dart';
import '../widgets/custom_elevated_button.dart';
import '../widgets/custom_horizontal_select.dart';
import '../widgets/custom_time_picker.dart';
import '../widgets/custom_title_text.dart';
import '../widgets/custom_text_box.dart';
import '../common/no_animation_page_route.dart';





class AnalyzedImageScreen extends StatefulWidget {
  final Future<Uint8List>? photo;
  final String selectedDate;

  const AnalyzedImageScreen({
    super.key,
    this.photo,
    required this.selectedDate,
  });

  @override
  State<AnalyzedImageScreen> createState() => _AnalyzedImageScreenState();
}

class _AnalyzedImageScreenState extends State<AnalyzedImageScreen> {

  List<Map<String, String>> foodList = [];

  final mealController = TextEditingController();
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.80,
                        child: const CustomTitleText(
                          title: '검색된 음식 목록', 
                          paddingLTRB: [0, 30.0, 0, 0],
                          underlineWidth: 120.0,  
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.grey.shade700, width: 0.5),
                        ),
                        width: MediaQuery.of(context).size.width * 0.81,
                        height: MediaQuery.of(context).size.width * 0.81,
                        child: widget.photo != null
                          ? FutureBuilder<Uint8List>(
                              future: widget.photo,
                              builder: (BuildContext context,
                                  AsyncSnapshot<Uint8List> snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.done) {
                                  if (snapshot.hasData) {
                                    return Image.memory(
                                      snapshot.data!,
                                      width: MediaQuery.of(context).size.width * 0.81,
                                      fit: BoxFit.cover,
                                    );
                                  } else {
                                    return const Center(
                                        child: Text('이미지를 가져오지 못했습니다.'));
                                  }
                                } else {
                                  return Image.asset(
                                    'assets/images/sample_food/empty_image.png',
                                    fit: BoxFit.cover,
                                  );
                                }
                              },
                            )
                          : Padding(
                              padding: EdgeInsets.symmetric(horizontal: (MediaQuery.of(context).size.width * 0.80 - 200)/2),
                              child: CustomTextField(
                                textEditingController: mealController, 
                                hintText: '음식명을 입력해주세요.', 
                                hintTextSize: 16.0,
                                textFieldWidth: 200,
                                regExp: r'^.{1,10}$',
                              ),
                            ),
                      ),
                      const SizedBox(height: 24.0,),
                      CustomHorizontalSelect(
                        items: const <String>['아침', '아점', '점심', '점저', '저녁', '간식', '야식'],
                        onChanged: (value) { print(value); },
                      ),
                      const SizedBox(height: 20.0,),
                      const CustomTimePicker(),
                      const SizedBox(height: 8.0,),
                      const Text(
                        '음식 목록',
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                      const SizedBox(height: 10.0,),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.81,
                        child: foodList.isEmpty 
                          ? Column(
                              children: [
                                const SizedBox(height: 14.0,),
                                Text(
                                  '음식 목록이 비어 있습니다.',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey.shade500,
                                  ),
                                ),
                                const SizedBox(height: 14.0,),
                              ],
                            )
                          : ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
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
                          border: Border.all(color: Colors.grey.shade700, width: 0.5),
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.80,
                        child: TextButton(
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
                          // child: Text(
                          //   foodList.isEmpty ? '음식 직접 추가하기!' : '목록에 없는 음식이 있어요!',
                          //   textAlign: TextAlign.center,
                          //   style: TextStyle(
                          //     fontSize: 13.0,
                          //     color: Colors.grey.shade900,
                          //     fontWeight: FontWeight.w500,
                          //   ),
                          // ),
                          child: CustomTitleText(
                            title: foodList.isEmpty ? '음식 직접 추가하기' : '목록에 없는 음식이 있어요..!', 
                            paddingLTRB: const [0, 8.0, 0, 0],
                            underlineWidth: foodList.isEmpty ? 100.0 : 150.0,
                            underlineColor: Colors.grey.shade700,
                            textSize: 13.0,
                            textWeight: FontWeight.w500,
                            textColor: Colors.grey.shade700,
                          )
                        ),
                      ),
                      const SizedBox(height: 20.0,)
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
                      // 백엔드 통신 통해 받아오기
                      dataMap: const {
                        "탄수화물": 77.0,
                        "단백질": 13.0,
                        "지방": 12.0,
                        "나트륨": 6.0,
                      },
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
