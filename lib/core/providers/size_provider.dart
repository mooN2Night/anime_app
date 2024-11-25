import 'package:flutter/material.dart';

class SizeProvider extends InheritedWidget {
  final double screenWidth;
  final double screenHeight;
  final double blockSizeHorizontal;
  final double blockSizeVertical;

  SizeProvider({
    super.key,
    required super.child,
    required BuildContext context,
  })  : screenWidth = MediaQuery.of(context).size.width,
        screenHeight = MediaQuery.of(context).size.height,
        blockSizeHorizontal = MediaQuery.of(context).size.width / 100,
        blockSizeVertical = MediaQuery.of(context).size.height / 100;

  static SizeProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<SizeProvider>();
  }

  @override
  bool updateShouldNotify(covariant SizeProvider oldWidget) {
    return screenWidth != oldWidget.screenWidth ||
        screenHeight != oldWidget.screenHeight;
  }
}
