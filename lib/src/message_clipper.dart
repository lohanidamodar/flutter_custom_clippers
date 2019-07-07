import 'dart:core';

import 'package:flutter/material.dart';

class MessageClipper extends CustomClipper<Path> {
  MessageClipper({this.borderRadius = 15});
  final double borderRadius;
  @override
  Path getClip(Size size) {
    double width = size.width;
    double height = size.height;
    double rheight = height - height / 3;
    double oneThird = width / 3;

    final path = Path()
      ..cubicTo(0, rheight - borderRadius, 0, rheight, borderRadius, rheight)
      ..lineTo(oneThird, rheight)
      ..cubicTo(width / 2 - borderRadius, height - borderRadius, width / 2,
          height, width / 2 + borderRadius, height - borderRadius )
      ..lineTo(2 * oneThird, rheight)
      ..cubicTo(width - borderRadius, rheight, width, rheight, width,
          rheight - borderRadius)
      ..lineTo(width, 0)
      ..lineTo(0, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
