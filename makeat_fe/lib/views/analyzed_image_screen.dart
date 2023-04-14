import 'package:flutter/material.dart';

import 'package:makeat_fe/widgets/custom_elevated_button.dart';

class AnalyzedImageScreen extends StatefulWidget {
  const AnalyzedImageScreen({super.key});

  @override
  State<AnalyzedImageScreen> createState() => _AnalyzedImageScreenState();
}

class _AnalyzedImageScreenState extends State<AnalyzedImageScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            body: SafeArea(
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
                      width: MediaQuery.of(context).size.width * 0.76,
                      height: MediaQuery.of(context).size.height *
                          0.368, // size 수정 필요
                      child: Image.asset(
                          'assets/images/sample_data/sample_food.png'),
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    Container(
                      decoration: const BoxDecoration(
                          border: Border(
                              bottom:
                                  BorderSide(color: Colors.black54, width: 2))),
                      child: const Text(
                        "검색된 음식 목록",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.22,
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          food_info_textbox(
                              foodName: '계란샐러드', quantity: '1', unit: '인분'),
                          food_info_textbox(
                              foodName: '소고기 안심', quantity: '200', unit: 'g'),
                          food_info_textbox(
                              foodName: '방울토마토', quantity: '3', unit: '개'),
                          food_info_textbox(
                              foodName: '한현호', quantity: '0.5', unit: '공기'),
                        ],
                      ),
                    ),
                    const TextButton(
                      onPressed: null, // null값을 주면 비활성화 된다.

                      child: Text('검색 목록에 없는 음식이 있어요...'),
                    )
                  ],
                ),
              ),
            ),
            bottomNavigationBar: const CustomElevatedButton(
              buttonText: '영양 성분 확인하기',
            )));
  }
}

class food_info_textbox extends StatelessWidget {
  final String foodName;
  final String quantity;
  final String unit;

  const food_info_textbox({
    Key? key,
    required this.foodName,
    required this.quantity,
    required this.unit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black87, width: 1),
      ),
      width: MediaQuery.of(context).size.width * 0.7,
      height: MediaQuery.of(context).size.height * 0.05,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 80,
            child: Text(
              foodName,
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            width: 70,
            child: Text(
              quantity,
              style: const TextStyle(fontWeight: FontWeight.w700),
              textAlign: TextAlign.end,
            ),
          ),
          SizedBox(
            width: 70,
            child: Text(
              unit,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
