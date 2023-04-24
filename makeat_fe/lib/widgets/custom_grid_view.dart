import 'package:flutter/material.dart';

class CustomGridView extends StatelessWidget {
  final List<String> menuTitles;
  final List<String> menuImages;
  final double imgWidth;
  final double imgHeight;
  final int crossAxisCount;
  final double mainAxisSpacing;
  final double crossAxisSpacing;
  final EdgeInsetsGeometry padding;

  const CustomGridView({
    Key? key,
    required this.menuTitles,
    required this.menuImages,
    this.imgWidth = 56.0,
    this.imgHeight = 56.0,
    this.crossAxisCount = 3,
    this.mainAxisSpacing = 0.0,
    this.crossAxisSpacing = 0.0,
    this.padding = const EdgeInsets.all(16.0),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: crossAxisCount,
      mainAxisSpacing: mainAxisSpacing,
      crossAxisSpacing: crossAxisSpacing,
      padding: padding,
      shrinkWrap: true,
      children: List.generate(
        menuTitles.length,
        (index) => GridTile(
          child: GestureDetector(
            onTap: () {
              // 클릭 이벤트에 대한 코드 추가
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  menuImages[index],
                  width: imgWidth,
                  height: imgHeight,
                ),
                const SizedBox(height: 8.0),
                Text(menuTitles[index]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}