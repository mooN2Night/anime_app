import 'package:flutter/material.dart';

class ThemeProvider extends InheritedWidget {
  final bool isLightTheme;
  final Function(bool) toggleTheme;

  const ThemeProvider({
    required this.isLightTheme,
    required this.toggleTheme,
    super.key,
    required super.child,
  });

  static ThemeProvider of(BuildContext context) {
    final ThemeProvider? result =
    context.dependOnInheritedWidgetOfExactType<ThemeProvider>();

    assert(result != null, 'No ThemeProvider found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(covariant ThemeProvider oldWidget) {
    return oldWidget.isLightTheme != isLightTheme;
  }
}