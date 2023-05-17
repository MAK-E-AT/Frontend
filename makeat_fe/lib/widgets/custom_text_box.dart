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
        border: Border.all(color: Colors.grey.shade700, width: 0.1),
      ),
      width: MediaQuery.of(context).size.width * 0.80,
      height: 42.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            width: 90,
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
            width: 50,
            child: Text(
              unit,
              textAlign: TextAlign.center,
            ),
          ),
          // onPressedEdit != null && onPressedDelete인 경우
          if (onPressedEdit != null && onPressedDelete != null) ...[
            IconButton(
              onPressed: onPressedEdit,
              tooltip: '음식 수정하기',
              icon: Icon(
                Icons.edit,
                color: Colors.grey.shade500,
                size: 18.0,
              ),
            ),
            IconButton(
              onPressed: onPressedDelete,
              tooltip: '음식 삭제하기',
              icon: Icon(
                Icons.delete,
                color: Colors.grey.shade500,
                size: 18.0,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
