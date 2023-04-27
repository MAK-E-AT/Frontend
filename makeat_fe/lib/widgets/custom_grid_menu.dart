import 'package:flutter/material.dart';

class CustomGridMenu extends StatelessWidget {
  final List<String> menuTitles;
  final List<String> menuImages;
  final List<Future<void> Function()> onTap;
  final double imgWidth;
  final double imgHeight;
  final int crossAxisCount;
  final double mainAxisSpacing;
  final double crossAxisSpacing;
  final EdgeInsetsGeometry padding;

  const CustomGridMenu({
    Key? key,
    required this.menuTitles,
    required this.menuImages,
    required this.onTap,
    this.imgWidth = 56.0,
    this.imgHeight = 56.0,
    this.crossAxisCount = 3,
    this.mainAxisSpacing = 0.0,
    this.crossAxisSpacing = 0.0,
    this.padding = const EdgeInsets.all(16.0),
  }) : super(key: key);

  void _onTapHandler(int index) async {
    await onTap[index]();
  }

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
              _onTapHandler(index);
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