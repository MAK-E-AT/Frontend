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
                        width: MediaQuery.of(context).size.width * 0.76,
                        height: MediaQuery.of(context).size.height * 0.38, // size 수정 필요
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
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.16,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            // 클릭해서 수정 및 삭제 기능 구현 예정
                            CustomTextBox( name: '계란샐러드', quantity: '1', unit: '인분' ),
                            CustomTextBox( name: '소고기 안심', quantity: '200', unit: 'g' ),
                            CustomTextBox( name: '방울토마토', quantity: '3', unit: '개' ),
                          ],
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          // showModalBottomSheet(
                          //   context: context,
                          //   builder: (BuildContext context) {
                          //     return const AddFoodForm();
                          //   },
                          // );
                          showDialog(
                            context: context,
                            builder: (context) => const AddFoodForm(),
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
