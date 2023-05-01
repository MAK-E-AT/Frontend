import 'package:flutter/material.dart';

/* 페이지 이동 시 애니메이션 제거 - 페이지 이동만 가능 */
class NoAnimationPageRoute<T> extends MaterialPageRoute<T> {
  NoAnimationPageRoute({
    required WidgetBuilder builder, 
    required RouteSettings settings
  }) : super(builder: builder, settings: settings);

  @override
  Widget buildTransitions(
    BuildContext context, 
    Animation<double> animation,
    Animation<double> secondaryAnimation, 
    Widget child
  ) {
    return child;
  }
}