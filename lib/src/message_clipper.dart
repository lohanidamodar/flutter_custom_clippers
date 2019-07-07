import 'dart:core';

import 'package:flutter/material.dart';

class MessageClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double width = size.width;
    double height = size.height;
    double rheight = height-height/4;
    double oneThird = width / 3;

    final path = Path()
      ..lineTo(0,rheight)
      ..lineTo(oneThird,rheight)
      ..lineTo(width/2,height)
      ..lineTo( 2*oneThird,rheight)
      ..lineTo(width, rheight)
      ..lineTo(width,0)
      ..lineTo(0, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
