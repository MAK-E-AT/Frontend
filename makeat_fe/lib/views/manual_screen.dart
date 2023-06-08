import 'package:flutter/material.dart';

import '../widgets/custom_bottom_navigation_bar.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/custom_image_slider.dart';

class ManualScreen extends StatefulWidget {
  const ManualScreen({super.key});
  

  @override
  // ignore: library_private_types_in_public_api
  _ManualScreenState createState() => _ManualScreenState();
}

class _ManualScreenState extends State<ManualScreen> {

  List<String> imagePaths = [
    'assets/images/sample_manual/sample_manual_1.png',
    'assets/images/sample_manual/sample_manual_2.png',
    'assets/images/sample_manual/sample_manual_3.png',
    'assets/images/sample_manual/sample_manual_4.png',
    'assets/images/sample_manual/sample_manual_5.png',
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: const CustomAppBar(),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 30.0,),

                  /* 이미지 슬라이더 
                    - imagePaths, 초기 인덱스 0
                    - JumpingDotEffect 애니메이션
                  */
                  CustomImageSlider(
                    imagePathList: imagePaths,
                    sliderHeight: 500.0,
                  ),
                ],
              ),
            ),
          )
        ),
        bottomNavigationBar: const CustomBottomNavigationBar(),
      )
    );
  }
}
