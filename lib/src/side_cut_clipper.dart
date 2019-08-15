import 'package:flutter/material.dart';

class SideCutClipper extends CustomClipper<Path> {
    final double depth ;
    final double borderadius ;
  SideCutClipper({this.borderadius=10,this.depth=40})
  @override
  Path getClip(Size size) {
    double height = size.height;
    double width = size.width;
    double cut = height - height / 3;
    double inDepth = width - depth;

    final path = Path();
    // path(width,height)
    path.lineTo(width, 0);
    path.lineTo(width, cut - borderadius);
    path.cubicTo(width, cut - borderadius, width, cut, width - borderadius,
        cut + borderadius);
    path.cubicTo(width - borderadius, cut + borderadius, inDepth,
        cut + depth , width-borderadius, cut + 2*depth-borderadius);
    path.cubicTo(width - borderadius, cut + 2*depth - borderadius, width,
        cut + 2*depth, width, cut + 2*depth + borderadius);
    path.lineTo(width, height);
    path.lineTo(0, height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
