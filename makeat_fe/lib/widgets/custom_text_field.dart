import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class CustomTextField extends StatelessWidget {
  final TextEditingController textEditingController;
  final String labelText;
  final double labelTextSize;
  final String hintText;
  final double hintTextSize;
  final Color hintColor;
  final double textFieldWidth;
  final double leftWhiteSpaceWidth;
  final double rightWhiteSpaceWidth;
  final String regExp;
  
  

  const CustomTextField({
    super.key, 
    required this.textEditingController,
    this.labelText = '',
    this.labelTextSize = 15.0,
    this.hintText = '',
    this.hintTextSize = 12.0,
    this.hintColor = Colors.grey,
    required this.textFieldWidth,
    this.leftWhiteSpaceWidth = 0,
    this.rightWhiteSpaceWidth = 0,
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
              textAlign: TextAlign.center,
              controller: textEditingController,
              cursorColor: Colors.black54,
              // keyboardType: const TextInputType.numberWithOptions(decimal: true),
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(regExp)),
              ],
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: TextStyle(
                  color: hintColor,
                  fontSize: hintTextSize,
                ),
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black54),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade300),
                ),
                focusedErrorBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black54),
                ),
                errorBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black54),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}