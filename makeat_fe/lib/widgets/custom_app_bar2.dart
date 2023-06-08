import 'package:flutter/material.dart';

import '../common/no_animation_page_route.dart';

class CustomAppBar2 extends StatelessWidget {
  final Widget nextScreen;
  
  const CustomAppBar2({
    super.key,
    required this.nextScreen,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      pinned: false,
      snap: true,
      backgroundColor: Colors.transparent,
      foregroundColor: Colors.transparent,
      elevation: 0,
      actions: <Widget>[
        CloseButton(nextScreen: nextScreen,),
      ],
    );
  }
}

class CloseButton extends StatelessWidget {
  final Widget nextScreen;

  const CloseButton({super.key, required this.nextScreen});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.close,
        size: 30.0,
        color: Colors.grey.shade800,
      ),
      onPressed: () {
        Navigator.push(
          context,
          NoAnimationPageRoute(
            builder: (context) => nextScreen, 
            settings: const RouteSettings(name: 'next_screen')
          ),
        );
      },
    );
  }
}