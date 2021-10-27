import 'package:flutter/material.dart';

/// Octoganal clipper clips the widget in octagon shape used with [ClipPath]
class OctagonalClipper extends CustomClipper<Path> {
  double getPosition(double size, double percent) {
    var v = (percent / 100) * size;
    return v;
  }
  @override
  Path getClip(Size size) {
    double width = size.width;
    double height = size.height;

    final path = Path();
    path
      ..moveTo(width / 2.0, 0)
      ..lineTo(getPosition(width, 15), getPosition(height, 15))
      ..lineTo(0, height / 2.0)
      ..lineTo(getPosition(width, 15), getPosition(height, 85))
      ..lineTo(width / 2.0, height)
      ..lineTo(getPosition(width, 85), getPosition(height, 85))
      ..lineTo(width, height / 2.0)
      ..lineTo(getPosition(width, 85), getPosition(height, 15))
      ..close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
