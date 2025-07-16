import 'package:flutter/material.dart';

class AppColors {
  static const Color primaryColor = Color(0xFFFFFFFF);
  static const Color transparentColor = Color(0x00000000);
  static const Color backgroundColor = Color(0xFF2B2B2B);
  static const Color cardColor = Color(0x527A7373);
  static const Color colorGrey = Color(0x99EBEBF5);
  static const LinearGradient appGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xFF2E335A),
      Color(0xFF1C1B33),
    ],
  );
  static const BoxShadow appBoxShadowColor = BoxShadow(
    color: Color(0xB23B267B),
    offset: Offset(-40, 60),
    blurRadius: 150,
    spreadRadius: 0,
  );
  static const BoxShadow appBarShadowColor = BoxShadow(
    color: Color(0xB23B267B),
    offset: Offset(-40, 60),
    blurRadius: 150,
    spreadRadius: 0,
  );
}
