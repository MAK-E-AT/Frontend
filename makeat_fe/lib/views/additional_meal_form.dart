// ignore_for_file: unnecessary_null_comparison, library_private_types_in_public_api

import 'package:flutter/material.dart';

import '../widgets/custom_text_field.dart';


class AddFoodForm extends StatefulWidget {
  final Function(String, String, String) onAddFood;
  final String foodName;
  final String foodQuantity;
  final String foodUnit;

  const AddFoodForm({super.key, 
    required this.onAddFood,
    this.foodName = '음식',
    this.foodQuantity = '',
    this.foodUnit = '인분',
  });

  @override
  _AddFoodFormState createState() => _AddFoodFormState();
}

class _AddFoodFormState extends State<AddFoodForm> {

  final quantityController = TextEditingController();
  final unitController = TextEditingController();

  List<String> foodList = [   // 12글자 이하로 작성
    '갈비탕', '감자탕', '계란 샐러드', '고등어구이', '곰탕',
    '과메기', '굴비', '김밥', '김치찌개', '김치전',
    '김치찜', '김치볶음밥', '김치볶음면', '깍두기', '꽁치구이',
    '나박김치', '낙지볶음', '냉면', '닭갈비', '닭계장',
    '닭도리탕', '닭볶음탕', '된장찌개', '두부김치', '두부조림',
    '떡볶이', '라면', '라볶이', '롤밥', '만두',
    '매운탕', '멸치볶음', '물냉면', '미역국', '방울토마토',
    '보쌈', '볶음밥', '부대찌개', '불고기', '비빔밥',
    '사골국', '삼계탕', '삼겹살', '새우볶음밥', '샤브샤브',
    '설렁탕', '소갈비찜', '소고기 안심', '소불고기', '소세지볶음',
    '순두부찌개', '스팸구이', '시금치나물', '안동찜닭', '약식',
    '양념치킨', '양꼬치', '양장피', '어묵국', '오징어볶음',
    '오징어채볶음', '왕만두', '우동', '육개장', '육회',
    '잔치국수', '잡곡밥', '장어탕', '제육볶음', '조개구이',
    '족발', '주먹밥', '짜장면', '짬뽕', '찜닭',
    '청국장', '초밥', '추어탕', '치즈라면', '카레',
    '캘리포니아롤', '콩나물국밥', '탕수육',
  ];

  List<String> recommendedList = [];

  late String selectedFood = widget.foodName;
  late String unit = widget.foodUnit;
  
  

  void updateRecommendations(String query) {
    recommendedList = foodList
        .where((food) => food.toLowerCase().contains(query.toLowerCase()))
        .toList();
    setState(() {});
  }

  void addButton(String food) {
    setState(() {
      selectedFood = food;
      recommendedList.clear();
      unit = '인분';
      quantityController.text = '';
      unitController.text = '';
    });
  }

  void deleteButton() {
    setState(() {
      selectedFood = '음식';
      recommendedList.clear();
      unit = '인분';
      quantityController.text = '';
      unitController.text = '';
    });
  }

  @override
  void dispose() {
    quantityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('직접 음식 추가하기'),
          backgroundColor: Colors.black87,
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onChanged: (query) => updateRecommendations(query),
                decoration: const InputDecoration(
                  hintText: '음식명을 입력하세요',
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: recommendedList.length,
                itemBuilder: (context, index) => ListTile(
                  title: Text(recommendedList[index]),
                  onTap: () => addButton(recommendedList[index]),
                ),
              ),
            ),
            if (selectedFood != null)
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 20.0,),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black54),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: null,
                          child: Text(
                            selectedFood,
                            style: const TextStyle(
                              color: Colors.black87
                            ),
                          ),
                        ),
                        CustomTextField(
                          textEditingController: quantityController, 
                          hintText: '음식 양', 
                          hintTextSize: 16.0,
                          textFieldWidth: 60,
                          regExp: r'^\d{1,4}(\.\d{1})?$', 
                        ),
                        DropdownButton<String>(
                          value: unit,
                          onChanged: (value) {
                            setState(() {
                              unit = value!;
                            });
                          },
                          items: ['인분', 'g', 'ml']
                            .map((e) => DropdownMenuItem(
                                  value: e,
                                  child: Text(e),
                                ))
                            .toList(),
                        ),
                      ],
                    ),
                  ), 
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: deleteButton,
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(Colors.black87),
                        ),
                        child: const Text('삭제'),
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // 직접 음식 추가 기능 - analyzed_image_screen.dart의 customTextBox랑 연동되어야 함
                          if(quantityController.text != '' && selectedFood != '음식') widget.onAddFood(selectedFood, quantityController.text, unit);
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(Colors.black87),
                        ),
                        child: const Text('추가'),
                      ),
                    ],
                ),
                const SizedBox(height: 30.0,),
              ],
            ),
          ],
        ),
      ),
    );
  }
}