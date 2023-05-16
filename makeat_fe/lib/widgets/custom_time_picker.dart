// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';


class CustomTimePicker extends StatefulWidget {
  const CustomTimePicker({super.key});

  @override
  _CustomTimePickerState createState() => _CustomTimePickerState();
}

class _CustomTimePickerState extends State<CustomTimePicker> {
  final List<int> _hours = List<int>.generate(24, (index) => index);
  final List<int> _minutes = List<int>.generate(60, (index) => index);
  late int _selectedHour;
  late int _selectedMinute;

  @override
  void initState() {
    super.initState();
    final currentTime = DateTime.now();
    _selectedHour = currentTime.hour;
    _selectedMinute = currentTime.minute;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.81,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '식사 시간',
            textAlign: TextAlign.left,
            style: TextStyle(fontSize: 12, color: Colors.grey),
          ),
          Row(
            children: [
              DropdownButton<int>(
                value: _selectedHour,
                underline: Container(),
                onChanged: (value) {
                  setState(() {
                    _selectedHour = value!;
                  });
                },
                items: _hours.map((hour) {
                  return DropdownMenuItem<int>(
                    value: hour,
                    child: Text(hour.toString().padLeft(2, '0')),
                  );
                }).toList(),
                icon: const Text(
                  '시',
                  style: TextStyle(fontSize: 14.0),
                ),
              ),
              const SizedBox(width: 8.0,),
              DropdownButton<int>(
                value: _selectedMinute,
                underline: Container(),
                onChanged: (value) {
                  setState(() {
                    _selectedMinute = value!;
                  });
                },
                items: _minutes.map((minute) {
                  return DropdownMenuItem<int>(
                    value: minute,
                    child: Text(minute.toString().padLeft(2, '0')),
                  );
                }).toList(),
                icon: const Text(
                  '분',
                  style: TextStyle(fontSize: 14.0),
                ),
              ),
              // ElevatedButton(
              //   onPressed: () {
              //     print('식단 시간: $_selectedHour:$_selectedMinute');
              //   },
              //   child: const Text('저장'),
              // ),
            ],
          ),
        ],
      ),
    );
  }
}