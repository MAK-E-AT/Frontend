import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final String imagePath;
  final String buttonText;
  final VoidCallback onPressed;

  const CustomIconButton({
    Key? key,
    required this.imagePath,
    required this.buttonText,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          icon: Image.asset(imagePath),
          iconSize: 50.0,
          onPressed: onPressed,
        ),
        Text(buttonText),
      ],
    );
  }
}