import 'package:flutter/material.dart';

class CustomGridSelection extends StatefulWidget {
  final List<String> exerciseImgList;
  final List<String> exerciseList;

  const CustomGridSelection({
    Key? key, 
    required this.exerciseImgList,
    required this.exerciseList,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _CustomGridSelectionState createState() => _CustomGridSelectionState();
}

class _CustomGridSelectionState extends State<CustomGridSelection> {
  List<bool> _isSelected = [];

  @override
  void initState() {
    super.initState();
    _isSelected = List.generate(widget.exerciseList.length, (_) => false);
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: widget.exerciseList.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
        childAspectRatio: 1.0,
      ),
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {
            setState(() {
              if (_isSelected[index]) {
                _isSelected[index] = false;
              } else if (_isSelected.where((element) => element).length < 3) {
                _isSelected[index] = true;
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('최대 3개의 운동만 선택할 수 있습니다.'),
                    duration: Duration(seconds: 1),
                  ),
                );
              }
            });
          },
          child: Container(
            decoration: BoxDecoration(
              color: _isSelected[index] ? Colors.greenAccent : Colors.grey[300],
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  widget.exerciseImgList[index],
                  width: 50.0,
                  height: 50.0,
                ),
                Text(widget.exerciseList[index]),
              ],
            ),
          ),
        );
      },
    );
  }
}