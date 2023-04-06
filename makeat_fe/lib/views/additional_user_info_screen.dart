import 'package:flutter/material.dart';
import 'package:makeat_fe/widgets/custom_check_box.dart';
import 'package:makeat_fe/widgets/custom_elevated_button.dart';
import 'package:makeat_fe/widgets/custom_text_field.dart';

import '../widgets/custom_image_slider.dart';

class AdditionalUserInfoScreen extends StatefulWidget {
  const AdditionalUserInfoScreen({super.key});
  

  @override
  // ignore: library_private_types_in_public_api
  _AdditionalUserInfoScreenState createState() => _AdditionalUserInfoScreenState();
}

class _AdditionalUserInfoScreenState extends State<AdditionalUserInfoScreen> {

  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();

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
        body: SafeArea(
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 20.0,),

                Image.asset(
                  width: 140.0,
                  'assets/images/makeat_logo/logo_small_size.png',
                ),
                const SizedBox(height: 30.0,),

                CustomImageSlider(
                  imagePathList: imagePaths,
                ),

                CustomTextField(
                  textEditingController: _heightController, 
                  labelText: '-  키 (cm)', 
                  labelTextSize: 15.0, 
                  hintText: '소수점은 한 자리까지만 가능해요.', 
                  textFieldWidth: MediaQuery.of(context).size.width * 0.5,
                  leftWhiteSpaceWidth: MediaQuery.of(context).size.width * 0.1,
                  rightWhiteSpaceWidth: 20.0,
                  regExp: r'^(?!0)([1-2]?\d{0,2}(\.\d{0,1})?|300(\.0)?)$', 
                ),
                
                CustomTextField(
                  textEditingController: _weightController, 
                  labelText: '-  체중 (kg)', 
                  labelTextSize: 15.0, 
                  hintText: '소수점은 한 자리까지만 가능해요.', 
                  textFieldWidth: MediaQuery.of(context).size.width * 0.5,
                  leftWhiteSpaceWidth: MediaQuery.of(context).size.width * 0.1,
                  rightWhiteSpaceWidth: 12.0,
                  regExp: r'^(?!0)(\d{0,2}(\.\d{0,1})?|200(\.0)?)$', 
                ),

                const CustomCheckBox(
                  checkBoxText1: '이용약관',
                  checkBoxText2: ' 및 ',
                  checkBoxText3: '개인정보처리방침',
                  checkBoxText4: '에 동의합니다.',
                  checkBoxColor: Colors.black,
                  checkBoxIcon: Icons.check_rounded,
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: const CustomElevatedButton(buttonText: '시  작  하  기',)
      )
    );
  }
}