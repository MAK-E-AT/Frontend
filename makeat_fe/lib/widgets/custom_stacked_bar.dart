// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class CustomStackedBar extends StatefulWidget {
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
  _CustomStackedBarState createState() => _CustomStackedBarState();
}

class _CustomStackedBarState extends State<CustomStackedBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(seconds: 2), // 애니메이션 지속 시간
      vsync: this, // 애니메이션 컨트롤러를 위한 TickerProvider
    );
    _animation = Tween<double>(
      begin: 0.0,
      end: widget.currentValue.toDouble(),
    ).animate(_animationController);

    // 애니메이션 시작
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24.0, 6.0, 24.0, 8.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.title,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                '${widget.currentValue} / ${widget.targetValue} [${widget.unit}]',
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4.0,),
          Stack(
            children: [
              AnimatedBuilder(
                animation: _animation,
                builder: (context, child) {
                  return LinearProgressIndicator(
                    minHeight: 16.0,
                    value: _animation.value / widget.targetValue.toDouble(),
                    backgroundColor: Colors.grey.shade200,
                    color: widget.color,
                  );
                },
              ),
              Positioned(
                right: 0,
                child: Row(
                  children: [
                    AnimatedBuilder(
                      animation: _animation,
                      builder: (context, child) {
                        return Text(
                          '${((_animation.value / widget.targetValue.toDouble()) * 100).toStringAsFixed(1)}%',
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                          ),
                        );
                      },
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