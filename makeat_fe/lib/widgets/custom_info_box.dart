import 'package:flutter/material.dart';

class CustomInfoBox extends StatelessWidget {
  final String text1;
  final String text2;
  final String text3;
  final String text4;
  final String text5;
  final String text6;
  final String text7;
  final String text8;
  final String text9;
  final String text10;

  const CustomInfoBox({
    super.key, 
    required this.text1,
    required this.text2,
    required this.text3,
    required this.text4,
    required this.text5,
    required this.text6,
    required this.text7,
    required this.text8,
    required this.text9,
    required this.text10,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    text1,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 10.0,),
                  Text(
                    text2,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 30.0),
            SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    text3,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 10.0,),
                  Text(
                    text4,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 30.0),
            SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    text5,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 10.0),
                  Text(
                    text6,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 20.0,)
          ],
        ),
        const SizedBox(height: 8.0,),
        Row(
          children: [
            SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    text7,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 10.0,),
                  Text(
                    text8,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 36.0),
            SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    text9,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 10.0,),
                  Text(
                    text10,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 10.0),
          ],
        ),
      ],
    );
  }
}