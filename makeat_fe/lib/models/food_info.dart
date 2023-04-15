import 'package:flutter/material.dart';

class FoodInfo extends StatelessWidget {
  final String foodName;
  final String quantity;
  final String unit;

  const FoodInfo({
    Key? key,
    required this.foodName,
    required this.quantity,
    required this.unit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black87, width: 1),
      ),
      width: MediaQuery.of(context).size.width * 0.7,
      height: MediaQuery.of(context).size.height * 0.05,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 80,
            child: Text(
              foodName,
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            width: 70,
            child: Text(
              quantity,
              style: const TextStyle(fontWeight: FontWeight.w700),
              textAlign: TextAlign.end,
            ),
          ),
          SizedBox(
            width: 70,
            child: Text(
              unit,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
