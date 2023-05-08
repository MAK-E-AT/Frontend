import 'package:flutter/material.dart';

class CustomTextBox extends StatelessWidget {
  final String name;
  final String quantity;
  final String unit;
  final Future<void> Function()? onPressedEdit;
  final Future<void> Function()? onPressedDelete;

  const CustomTextBox({
    Key? key,
    required this.name,
    required this.quantity,
    required this.unit,
    this.onPressedDelete,
    this.onPressedEdit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black87, width: 1),
      ),
      width: 280.0,
      height: MediaQuery.of(context).size.height * 0.05,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 80,
            child: Text(
              name,
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            width: 60,
            child: Text(
              quantity,
              style: const TextStyle(fontWeight: FontWeight.bold),
              textAlign: TextAlign.end,
            ),
          ),
          SizedBox(
            width: 40,
            child: Text(
              unit,
              textAlign: TextAlign.center,
            ),
          ),
          // onPressedEdit != null && onPressedDelete인 경우
          if (onPressedEdit != null && onPressedDelete != null) ...[
            IconButton(
              onPressed: onPressedEdit,
              icon: const Icon(Icons.edit),
            ),
            IconButton(
              onPressed: onPressedDelete,
              icon: const Icon(Icons.delete),
            ),
          ],
        ],
      ),
    );
  }
}
