import 'package:flutter/material.dart';

class CustomTitleText extends StatefulWidget {
  final String title;
  final List<double> paddingLTRB;
  final double underlineWidth;
  final Color underlineColor;
  final double textSize;
  final FontWeight textWeight;
  final Color textColor;

  const CustomTitleText({
    super.key, 
    required this.title,
    required this.paddingLTRB,
    this.underlineWidth = 0,
    this.underlineColor = Colors.black,
    this.textSize = 16.0,
    this.textWeight = FontWeight.bold,
    this.textColor = Colors.black,
  });

  @override
  State<CustomTitleText> createState() => _CustomTitleTextState();
}

class _CustomTitleTextState extends State<CustomTitleText> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        widget.paddingLTRB[0],
        widget.paddingLTRB[1], 
        widget.paddingLTRB[2], 
        widget.paddingLTRB[3],
      ),
      child: Column(
        children: [
          Text(
            widget.title,
            style: TextStyle(
              fontSize: widget.textSize,
              fontWeight: widget.textWeight,
              color: widget.textColor,
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(0.0, 4.0, 0.0, 20.0),
            width: widget.underlineWidth,
            height: 1.0,
            color: widget.underlineColor,
          ),
        ],
      ),
    );
  }
}