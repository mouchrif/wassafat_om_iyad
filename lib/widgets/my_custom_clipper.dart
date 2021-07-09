import 'package:flutter/material.dart';

class MyCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    final double curvedRadius = 40;
    path.lineTo(0, size.height);
    path.quadraticBezierTo(0, size.height - curvedRadius, curvedRadius,
        size.height - curvedRadius);
    path.lineTo(size.width - curvedRadius, size.height - curvedRadius);
    path.quadraticBezierTo(size.width, size.height - curvedRadius, size.width,
        size.height - 2 * curvedRadius);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}

class MealClipperBottom extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(size.width / 6, 0);
    path.lineTo(0, 0);
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.lineTo(size.width - size.width / 6, 0);
    path.arcToPoint(
      Offset(size.width / 6, 0),
      radius: Radius.circular(size.height/4)
    );
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
