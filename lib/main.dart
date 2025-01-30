import 'package:anime_app/core/constants/theme_constant.dart';
import 'package:anime_app/core/providers/size_provider.dart';
import 'package:anime_app/core/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'service_locator.dart' as di;

import 'home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(
    Builder(
      builder: (context) {
        return SizeProvider(
          context: context,
          child: const MyApp(),
        );
      },
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isLightTheme = true;

  @override
  Widget build(BuildContext context) {
    return ThemeProvider(
      isLightTheme: isLightTheme,
      toggleTheme: _toggleTheme,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: isLightTheme
            ? ThemeConstants.lightTheme
            : ThemeConstants.darkTheme,
        home: const HomePage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }

  void _toggleTheme(bool value) {
    setState(() {
      isLightTheme = value;
    });
  }
}
