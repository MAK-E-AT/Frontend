import 'package:flutter/material.dart';


class CustomElevatedButton extends StatelessWidget {
  final String buttonText;
  final Future<void> Function() onPressed;
  final double buttonWidth;
  final double buttonHeight;

  const CustomElevatedButton({
    super.key,
    required this.buttonText,
    required this.onPressed,
    this.buttonWidth = 200.0,
    this.buttonHeight = 64.0
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        minimumSize: MaterialStateProperty.all<Size>(Size(buttonWidth, buttonHeight)),
        backgroundColor: MaterialStateProperty.all<Color>(Colors.grey.shade900),
      ),
      child: Text(
        buttonText,
        style: const TextStyle(
          fontSize: 20.0,
          color: Colors.white,
        ),
      ),
    );
  }
}