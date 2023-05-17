// ignore_for_file: library_private_types_in_public_api, unused_field, avoid_print

import 'package:flutter/material.dart';

class CustomHorizontalSelect extends StatefulWidget {
  final List<String> items;
  final Function(String) onChanged;
  final TextStyle style;

  const CustomHorizontalSelect({
    super.key, 
    required this.items,
    required this.onChanged,
    this.style = const TextStyle(fontSize: 12.0),
  });

  @override
  _CustomHorizontalSelectState createState() =>
      _CustomHorizontalSelectState();
}

class _CustomHorizontalSelectState extends State<CustomHorizontalSelect> {
  String _selectedItem = '아침';
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '식사 분류',
          textAlign: TextAlign.left,
          style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
        ),
        const SizedBox(height: 10.0,),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.8,
          height: 40.0,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: widget.items.length,
            itemBuilder: (context, index) {
              final item = widget.items[index];
              return ElevatedButton(
                style: ButtonStyle(
                  alignment: Alignment.center,
                  backgroundColor: MaterialStateProperty.all(Colors.grey.shade50),
                  minimumSize: MaterialStateProperty.all<Size>(Size(MediaQuery.of(context).size.width * 0.80/5, 40)),
                  side: MaterialStateProperty.all<BorderSide>(
                    BorderSide(
                      color: _selectedIndex == index ? Colors.black : Colors.grey.shade400,
                      width: _selectedIndex == index ? 1.2 : 1.0,
                    ),
                  ),
                ),
                onPressed: () {
                  setState(() {
                    _selectedIndex = index;
                    _selectedItem = item;
                    print(item);
                  });
                  widget.onChanged(item);
                },
                child: Text(
                  item,
                  style: widget.style.copyWith(
                    color: _selectedIndex == index ? Colors.black : Colors.grey.shade400,
                    fontSize: _selectedIndex == index? 13.0 : 12.0,
                    fontWeight: _selectedIndex == index ? FontWeight.w500 : FontWeight.w400,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}