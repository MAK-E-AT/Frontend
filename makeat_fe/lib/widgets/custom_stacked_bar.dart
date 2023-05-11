import 'package:flutter/material.dart';

class CustomStackedBar extends StatelessWidget {
  final int targetValue;
  final int currentValue;
  final String title;
  final String unit;
  final Color color;

  const CustomStackedBar({
    Key? key,
    required this.targetValue,
    required this.currentValue,
    required this.title,
    required this.unit,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24.0, 6.0, 24.0, 6.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                '$currentValue / $targetValue [$unit]',
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          Stack(
            children: [
              LinearProgressIndicator(
                minHeight: 16.0,
                value: currentValue / targetValue,
                backgroundColor: Colors.grey.shade300,
                color: color,
              ),
              Positioned(
                right: 0,
                child: Row(
                  children: [
                    Text(
                      '${((currentValue / targetValue) * 100).toStringAsFixed(1)}%',
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}