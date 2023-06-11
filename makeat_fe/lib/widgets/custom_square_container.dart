import 'package:flutter/material.dart';

class CustomSquareContainer extends StatelessWidget {
  final String text;
  final double textSize;
  final double interval;
  final double containerWidth;
  final double containerHeight;

  const CustomSquareContainer({
    super.key, 
    required this.text,
    this.interval = 1.0,
    this.textSize = 12.0,
    this.containerWidth = 100.0,
    this.containerHeight = 100.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: containerWidth,
      height: containerHeight,
      decoration: BoxDecoration(
        color: Colors.white, // 원하는 배경색 설정
        border: Border.all(
          color: Colors.black26, // 원하는 윤곽선 색상 설정
          width: 0.5, // 원하는 윤곽선 굵기 설정
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                text,
                maxLines: 1,
                style: TextStyle(
                  color: Colors.black, // 원하는 텍스트 색상 설정
                  fontSize: textSize, // 원하는 텍스트 크기 설정
                ),
              ),
              SizedBox(height: interval,),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 4.0),
                height: 0.2,
                color: Colors.black,
              ),
            ],
          ),
        ),
      ),
    );
  }
}