import 'package:anime_app/core/constants/color_constant.dart';
import 'package:anime_app/core/constants/size_constant.dart';
import 'package:flutter/material.dart';

class ThemeConstants {
  static ThemeData lightTheme = ThemeData.light().copyWith(
    scaffoldBackgroundColor: ColorConstant.whiteColor,
    appBarTheme: _mainAppBarTheme(true),
    bottomNavigationBarTheme: _bottomNavBarTheme(true),
    colorScheme: const ColorScheme.light(
      // background: Colors.red,
    ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        color: ColorConstant.blackColor,
        fontSize: 30,
        fontWeight: FontWeight.w500,
      ),
      titleMedium: TextStyle(
        color: ColorConstant.blackColor,
        fontSize: 20,
        fontWeight: FontWeight.w300,
      ),
      titleSmall: TextStyle(
        color: ColorConstant.greyColor,
        fontSize: 15,
        fontWeight: FontWeight.w300,
      ),
      bodySmall: TextStyle(
        color: ColorConstant.blackColor,
        fontSize: 15,
        fontWeight: FontWeight.w300,
      ),
      ///Текст для боттом бара
      labelMedium: TextStyle(
        color: ColorConstant.whiteColor,
        fontSize: 11,
        fontWeight: FontWeight.w300,
      ),
    ),
  );

  static ThemeData darkTheme = ThemeData.light().copyWith(
    scaffoldBackgroundColor: ColorConstant.blackColor,
    appBarTheme: _mainAppBarTheme(false),
    bottomNavigationBarTheme: _bottomNavBarTheme(false),
    colorScheme: const ColorScheme.light(
        // background: ColorConstant.greyColor,
        ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        color: ColorConstant.whiteColor,
        fontSize: 30,
        fontWeight: FontWeight.w500,
      ),
      titleMedium: TextStyle(
        color: ColorConstant.whiteColor,
        fontSize: 20,
        fontWeight: FontWeight.w300,
      ),
      titleSmall: TextStyle(
        color: ColorConstant.greyColor,
        fontSize: 15,
        fontWeight: FontWeight.w300,
      ),
      bodySmall: TextStyle(
        color: ColorConstant.whiteColor,
        fontSize: 15,
        fontWeight: FontWeight.w300,
      ),
      ///Текст для боттом бара
      labelMedium: TextStyle(
        color: ColorConstant.blackColor,
        fontSize: 11,
        fontWeight: FontWeight.w300,
      ),
    ),
  );

  static AppBarTheme _mainAppBarTheme(bool isLight) {
    return AppBarTheme(
      elevation: 4,
      scrolledUnderElevation: 4,
      surfaceTintColor:
          isLight ? ColorConstant.whiteColor : ColorConstant.blackColor,
      shadowColor:
          isLight ? ColorConstant.green100Color : ColorConstant.purple300Color,
      backgroundColor:
          isLight ? ColorConstant.whiteColor : ColorConstant.blackColor,
      titleTextStyle: TextStyle(
        fontSize: 23,
        color: isLight ? ColorConstant.blackColor : ColorConstant.whiteColor,
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(SizeConstant.standardSize),
          bottomRight: Radius.circular(SizeConstant.standardSize),
        ),
      ),
    );
  }

  static BottomNavigationBarThemeData _bottomNavBarTheme(bool isLight) {
    return BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor:
          isLight ? ColorConstant.whiteColor : ColorConstant.blackColor,
      selectedItemColor:
          isLight ? ColorConstant.green300Color : ColorConstant.purple300Color,
      unselectedItemColor: ColorConstant.greyColor,
    );
  }
}