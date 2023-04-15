import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CustomImageSlider extends StatefulWidget {
  final List<String> imagePathList;
  final int initialIndex;

  const CustomImageSlider(
      {super.key, required this.imagePathList, this.initialIndex = 0});

  @override
  // ignore: library_private_types_in_public_api
  _CustomImageSliderState createState() => _CustomImageSliderState();
}

class _CustomImageSliderState extends State<CustomImageSlider> {
  late PageController _pageController;
  late int activeIndex;

  @override
  void initState() {
    super.initState();
    activeIndex = widget.initialIndex;
    _pageController = PageController(initialPage: widget.initialIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.9,
          height: MediaQuery.of(context).size.height * 0.5,
          child: PageView.builder(
            controller: _pageController,
            itemCount: widget.imagePathList.length,
            itemBuilder: (context, index) {
              return imageSlider(widget.imagePathList[index], index);
            },
            onPageChanged: (index) {
              setState(() {
                activeIndex = index;
              });
            },
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.9,
          height: 15,
          child: indicator(),
        ),
        const SizedBox(
          height: 20.0,
        ),
      ],
    );
  }

  Widget imageSlider(String path, int index) => Container(
        width: double.infinity,
        decoration: const BoxDecoration(
            color: Colors.white,
            border: Border(
              bottom: BorderSide(color: Colors.black54, width: 2),
              top: BorderSide(color: Colors.black54, width: 2),
            )),
        child: Image.asset(path, fit: BoxFit.contain),
      );

  Widget indicator() => Container(
        margin: const EdgeInsets.only(bottom: 0.0),
        alignment: Alignment.bottomCenter,
        child: AnimatedSmoothIndicator(
          activeIndex: activeIndex,
          count: widget.imagePathList.length,
          effect: JumpingDotEffect(
              dotHeight: 7,
              dotWidth: 7,
              activeDotColor: Colors.black54,
              dotColor: Colors.grey.withOpacity(0.8)),
        ),
      );
}
