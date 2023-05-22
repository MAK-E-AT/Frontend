import 'package:flutter/material.dart';

class CustomGridSelection extends StatefulWidget {
  final List<String> imgList;
  final List<String> workoutList;
  final List<String> workoutInfoList;

  const CustomGridSelection({
    Key? key, 
    required this.imgList,
    required this.workoutList,
    required this.workoutInfoList,
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
    _isSelected = List.generate(widget.workoutList.length, (_) => false);
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: const EdgeInsets.fromLTRB(20.0, 8.0, 20.0, 8.0),
      itemCount: widget.workoutList.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
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
              color: _isSelected[index] ? Colors.green.shade50 : Colors.white,
              border: Border.all(
                color: Colors.grey.shade800
              ),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 5.0,),
                Image.asset(
                  widget.imgList[index],
                  width: 40.0,
                  height: 40.0,
                ),
                const SizedBox(height: 10.0,),
                Text(
                  widget.workoutList[index],
                  style: const TextStyle(fontSize: 12.0),
                ),
                Text(
                  '${widget.workoutInfoList[index]} kcal',
                  style: const TextStyle(fontWeight: FontWeight.w600),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}