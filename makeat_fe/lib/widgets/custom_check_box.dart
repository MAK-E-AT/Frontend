import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';


class CustomCheckBox extends HookWidget {
  final String checkBoxText1;
  final String checkBoxText2;
  final String checkBoxText3;
  final String checkBoxText4;
  final Color checkBoxColor;
  final IconData checkBoxIcon;

  const CustomCheckBox({
    super.key,
    required this.checkBoxText1,
    required this.checkBoxText2,
    required this.checkBoxText3,
    required this.checkBoxText4,
    required this.checkBoxColor,
    required this.checkBoxIcon,
  });

  @override
  Widget build(BuildContext context) {
    final isChecked = useState(false);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: 80.0,),
        InkWell(
          onTap: () => isChecked.value = !isChecked.value,
          child: Container(
            width: 18.0,
            height: 18.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: checkBoxColor),
            ),
            child: isChecked.value
                ? Icon(checkBoxIcon, color: checkBoxColor, size: 16.0)
                : null,
          ),
        ),
        const SizedBox(width: 8),
        RichText(
          text: TextSpan(
            style: DefaultTextStyle.of(context).style,
            children: [
              TextSpan(
                text: checkBoxText1,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              TextSpan(text: checkBoxText2),
              TextSpan(
                text: checkBoxText3,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              TextSpan(text: checkBoxText4),
            ],
          ),
        ),
      ],
    );
  }
}