import 'package:flutter/material.dart';

class ParallelogramClipper extends CustomClipper<Path> {
  @override
    Path getClip(Size size) {
      final path = Path()
        ..lineTo(0.0, size.height/2)
        ..lineTo(size.width/2, size.height)
        ..lineTo(size.width, size.height/2)
        ..lineTo(size.width/2, 0.0)
        ..lineTo(0.0, size.height/2)
        ..close();
      return path;
    }

  @override
    bool shouldReclip(CustomClipper<Path> oldClipper) {
      return true;
    }
}