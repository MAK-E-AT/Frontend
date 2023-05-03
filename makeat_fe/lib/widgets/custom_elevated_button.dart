import 'package:flutter/material.dart';


class CustomElevatedButton extends StatelessWidget {
  final String buttonText;
  final Future<void> Function() onPressed;

  const CustomElevatedButton({
    super.key,
    required this.buttonText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        minimumSize: MaterialStateProperty.all<Size>(const Size(200, 64)),
        backgroundColor: MaterialStateProperty.all<Color>(Colors.black54),
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