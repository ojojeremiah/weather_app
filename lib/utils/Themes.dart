import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/utils/app_colors.dart';

class AppThemes {
  static final appLightTheme = ThemeData(
    hoverColor: AppColors.backgroundColor,
    brightness: Brightness.light,
    primaryColor: AppColors.primaryColor,
    canvasColor: AppColors.backgroundColor,
    scaffoldBackgroundColor: AppColors.backgroundColor,
    shadowColor: AppColors.backgroundColor,
    cardColor: AppColors.primaryColor,
    dividerColor: AppColors.primaryColor,
    highlightColor: AppColors.backgroundColor,
    splashColor: AppColors.backgroundColor,
    disabledColor: AppColors.backgroundColor,
    hintColor: AppColors.colorGrey,
    textTheme: TextTheme(
      displayLarge: TextStyle(
        fontFamily: 'assets/fonts/SFPRODISPLAYREGULAR.OTF',
        color: AppColors.primaryColor,
        fontSize: 34.sp,
        fontWeight: FontWeight.w600,
      ),
      displayMedium: TextStyle(
        fontFamily: 'assets/fonts/SFPRODISPLAYREGULAR.OTF',
        color: AppColors.primaryColor,
        fontSize: 18.sp,
        fontWeight: FontWeight.w600,
      ),
      titleMedium: TextStyle(
        fontFamily: 'assets/fonts/SFPRODISPLAYREGULAR.OTF',
        color: AppColors.primaryColor,
        fontSize: 15.sp,
      ),
      titleSmall: TextStyle(
        fontFamily: 'assets/fonts/SFPRODISPLAYREGULAR.OTF',
        color: AppColors.primaryColor,
        fontSize: 15.sp,
      ),
      bodyLarge: TextStyle(
        fontFamily: 'assets/fonts/SFPRODISPLAYREGULAR.OTF',
        color: AppColors.primaryColor,
        fontSize: 14.sp,
      ),
    ),
    primaryTextTheme: TextTheme(
      headlineSmall: TextStyle(
        fontFamily: 'assets/fonts/SFPRODISPLAYREGULAR.OTF',
        color: AppColors.primaryColor,
        fontSize: 18.sp,
      ),
      titleMedium: TextStyle(
        fontFamily: 'assets/fonts/SFPRODISPLAYREGULAR.OTF',
        color: AppColors.primaryColor,
        fontSize: 15.sp,
      ),
      titleSmall: TextStyle(
        fontFamily: 'assets/fonts/SFPRODISPLAYREGULAR.OTF',
        color: AppColors.primaryColor,
        fontSize: 15.sp,
      ),
      bodyLarge: TextStyle(
        fontFamily: 'assets/fonts/SFPRODISPLAYREGULAR.OTF',
        color: AppColors.primaryColor,
        fontSize: 14.sp,
      ),
      bodyMedium: TextStyle(
        fontFamily: 'assets/fonts/SFPRODISPLAYREGULAR.OTF',
        color: AppColors.primaryColor,
        fontSize: 14.sp,
      ),
      bodySmall: TextStyle(
        fontFamily: 'assets/fonts/SFPRODISPLAYREGULAR.OTF',
        color: AppColors.primaryColor,
        fontSize: 14.sp,
      ),
    ),
    iconTheme: IconThemeData(
      color: AppColors.primaryColor,
      opacity: 1,
      size: 30.w,
    ),
    primaryIconTheme: IconThemeData(
      color: AppColors.colorGrey,
      opacity: 1,
      size: 20.w,
    ),
    bottomAppBarTheme: const BottomAppBarTheme(
        color: AppColors.backgroundColor,
        shadowColor: AppColors.backgroundColor),
    colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue)
        .copyWith(surface: AppColors.primaryColor)
        .copyWith(error: Colors.red),
    dialogTheme:
        const DialogThemeData(backgroundColor: AppColors.backgroundColor),
    tabBarTheme:
        const TabBarThemeData(indicatorColor: AppColors.backgroundColor),
  );
}
