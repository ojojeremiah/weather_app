import 'package:flutter/material.dart';

class CustomNavBar extends StatefulWidget {
  const CustomNavBar({super.key});

  @override
  State<CustomNavBar> createState() => _CustomNavBarState();
}

class CustomShapeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    // Start at top-left
    path.moveTo(0, 0);

    // Curve at top-right
    path.lineTo(size.width - 60, 0);
    path.quadraticBezierTo(size.width, 0, size.width, 60);

    // Down right side
    path.lineTo(size.width, size.height - 60);

    // Curve at bottom-left
    path.quadraticBezierTo(
        size.width, size.height, size.width - 60, size.height);
    path.lineTo(60, size.height);
    path.quadraticBezierTo(0, size.height, 0, size.height - 60);

    // Back to start
    path.lineTo(0, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class _CustomNavBarState extends State<CustomNavBar> {
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: CustomShapeClipper(),
      child: Container(
        width: 342,
        height: 184,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF5936B4),
              Color(0xFF362A84),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
      ),
    );
  }
}
