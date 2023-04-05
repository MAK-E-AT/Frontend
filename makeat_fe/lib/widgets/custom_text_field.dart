import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class CustomTextField extends StatelessWidget {
  final TextEditingController textEditingController;
  final String labelText;
  final double labelTextSize;
  final String hintText;
  final double textFieldWidth;
  final double leftWhiteSpaceWidth;
  final double rightWhiteSpaceWidth;
  final String regExp;
  
  

  const CustomTextField({super.key, 
    required this.textEditingController,
    required this.labelText,
    required this.labelTextSize,
    required this.hintText,
    required this.textFieldWidth,
    required this.leftWhiteSpaceWidth,
    required this.rightWhiteSpaceWidth,
    required this.regExp,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        children: [
          SizedBox(width: leftWhiteSpaceWidth),
          Text(
            labelText,
            style: TextStyle(
              fontSize: labelTextSize,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(width: rightWhiteSpaceWidth,),
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: textFieldWidth),
            child: TextField(
              controller: textEditingController,
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(regExp)),
              ],
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: const TextStyle(
                  fontSize: 12.0,
                )
              ),
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}