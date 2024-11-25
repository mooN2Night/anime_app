import 'package:anime_app/core/constants/color_constant.dart';
import 'package:anime_app/core/constants/string_constant.dart';
import 'package:anime_app/core/providers/theme_provider.dart';
import 'package:anime_app/custom_bottom_bar.dart';
import 'package:anime_app/feature/favorite_screen/presentation/pages/favorite_screen.dart';
import 'package:anime_app/feature/main_screen/presentation/pages/main_screen.dart';
import 'package:anime_app/feature/profile_screen/presentation/pages/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

import 'feature/schedule_screen/presentation/pages/schedule_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final List<GlobalKey<NavigatorState>> _navigatorKeys = [
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
  ];

  @override
  Widget build(BuildContext context) {
    bool isLight = ThemeProvider.of(context).isLightTheme;
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: List.generate(
          _navigatorKeys.length,
          (index) {
            return Offstage(
              offstage: _currentIndex != index,
              child: Navigator(
                key: _navigatorKeys[index],
                onGenerateRoute: (routeSettings) {
                  return MaterialPageRoute(
                    builder: (context) => _getScreen(index),
                  );
                },
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: isLight ? ColorConstant.whiteColor : ColorConstant.blackColor,
          boxShadow: [
            BoxShadow(
              color: isLight
                  ? ColorConstant.green100Color
                  : ColorConstant.purple300Color,
              spreadRadius: 2,
              blurRadius: 30,
              offset: Offset(0, -2),
            ),
          ],
        ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: _selectTab,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(IconlyLight.home),
              label: StringConstants.mainScreen,
            ),
            BottomNavigationBarItem(
              icon: Icon(IconlyLight.heart),
              label: StringConstants.favoriteScreen,
            ),
            BottomNavigationBarItem(
              icon: Icon(IconlyLight.calendar),
              label: StringConstants.scheduleScreen,
            ),
            BottomNavigationBarItem(
              icon: Icon(IconlyLight.profile),
              label: StringConstants.profileScreen,
            ),
          ],
        ),
      ),
    );
  }

  Widget _getScreen(int index) {
    switch (index) {
      case 0:
        return const MainScreen();
      case 1:
        return const FavoriteScreen();
      case 2:
        return const ScheduleScreen();
      case 3:
        return const ProfileScreen();
      default:
        return const MainScreen();
    }
  }

  void _selectTab(int index) {
    if (_currentIndex == index) {
      // Возврат на начальный экран текущего Navigator
      _navigatorKeys[index].currentState!.popUntil((route) => route.isFirst);
    } else {
      setState(() {
        _currentIndex = index;
      });
    }
  }
}
