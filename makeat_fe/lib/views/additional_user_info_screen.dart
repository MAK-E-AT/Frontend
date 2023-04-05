import 'package:flutter/material.dart';
import 'package:makeat_fe/widgets/custom_text_field.dart';

import '../widgets/image_slider.dart';

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

                ImageSlider(
                  imagePathList: imagePaths,
                ),
                const SizedBox(height: 30.0,),

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
                  rightWhiteSpaceWidth: 20.0,
                  regExp: r'^(?!0)(\d{0,2}(\.\d{0,1})?|200(\.0)?)$', 
                ),

                // SizedBox(
                //   child: Row(
                //     children: [
                //       const SizedBox(width: 30.0,),
                //       const Text(
                //         '키 (cm)',
                //         style: TextStyle(
                //           fontSize: 15,
                //           fontWeight: FontWeight.bold,
                //         ),
                //       ),
                //       const SizedBox(width: 20.0,),
                //       ConstrainedBox(
                //         constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.5),
                //         child: TextField(
                //           controller: _heightController,
                //           keyboardType: const TextInputType.numberWithOptions(decimal: true),
                //           inputFormatters: [
                //             FilteringTextInputFormatter.allow(RegExp(r'^(?!0)([1-2]?\d{0,2}(\.\d{0,1})?|300(\.0)?)$')),
                //           ],
                //           decoration: const InputDecoration(
                //             hintText: '소수점은 한 자리까지',
                //           ),
                //         ),
                //       ),
                //       const SizedBox(height: 10),
                //     ],
                //   ),
                // ),

                // ConstrainedBox(
                //   constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.5),
                //   child: TextField(
                //     controller: _weightController,
                //     keyboardType: const TextInputType.numberWithOptions(decimal: true),
                //     inputFormatters: [
                //       FilteringTextInputFormatter.allow(RegExp(r'^(?!0)(\d{0,2}(\.\d{0,1})?|200(\.0)?)$')),
                //     ],
                //     decoration: const InputDecoration(
                //       label: Text('체중 (kg)'),
                //       hintText: '소수점은 한 자리까지',
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        )
      )
    );
  }
}