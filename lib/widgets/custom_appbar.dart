import 'package:flutter/material.dart';
import 'package:weather_app/utils/app_colors.dart';

class GradientAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget title;

  const GradientAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: AppColors.appGradient,
        boxShadow: [AppColors.appBarShadowColor],
      ),
      child: AppBar(
        title: title,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
