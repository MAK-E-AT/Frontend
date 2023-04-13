import 'package:flutter/material.dart';


class CustomElevatedButton extends StatelessWidget {
  final String buttonText;

  const CustomElevatedButton({
    super.key,
    required this.buttonText
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
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