import 'package:flutter/material.dart';

class CustomGridSelect extends StatefulWidget {
  final List<String> imgList;
  final List<String>? imgList2;
  final double imgWidth;
  final double imgHeight;
  final List<String> workoutList;
  final List<String>? workoutInfoList;
  final int maxSelect;
  final bool isBackground;
  final bool isBorder;

  const CustomGridSelect({
    Key? key, 
    required this.imgList,
    this.imgList2,
    this.imgWidth = 40.0,
    this.imgHeight = 40.0,
    required this.workoutList,
    this.workoutInfoList,
    required this.maxSelect,
    this.isBackground = true,
    this.isBorder = true,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _CustomGridSelectState createState() => _CustomGridSelectState();
}

class _CustomGridSelectState extends State<CustomGridSelect> {
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
              } else if (_isSelected.where((element) => element).length < widget.maxSelect) {
                _isSelected[index] = true;
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('최대 ${widget.maxSelect}개만 선택할 수 있습니다.'),
                    duration: const Duration(seconds: 1),
                  ),
                );
              }
            });
          },
          child: Container(
            decoration: BoxDecoration(
              color: (widget.isBackground && _isSelected[index]) ? Colors.green.shade50 : Colors.grey.shade50,
              border: Border.all(
                color: widget.isBorder? Colors.grey.shade800 : Colors.grey.shade50,
              ),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 5.0,),
                Image.asset(
                  (widget.imgList2 != null && _isSelected[index]) ? widget.imgList2![index] : widget.imgList[index],
                  width: widget.imgWidth,
                  height: widget.imgHeight,
                ),
                const SizedBox(height: 10.0,),
                Text(
                  widget.workoutList[index],
                  style: const TextStyle(fontSize: 12.0),
                ),
                if (widget.workoutInfoList != null) ... {
                  Text(
                    '${widget.workoutInfoList![index]} kcal',
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  )
                }       
              ],
            ),
          ),
        );
      },
    );
  }
}