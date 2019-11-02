import 'package:flutter/material.dart';

class SideCutClipper extends CustomClipper<Path> {
  // Play with scals to get more clear versions
  @override
  Path getClip(Size size) {
    double xFactor = 18, yFactor = 15;
    double height = size.height;
    double startY = (height - height / 3) - yFactor;
    double xVal = size.width;
    double yVal = 0;
    final path = Path();

    path.lineTo(xVal, yVal);

    yVal = startY;
    path.lineTo(xVal, yVal);

    double scale = 1.4;
    path.cubicTo(xVal, yVal, xVal, yVal + yFactor * scale,
        xVal - xFactor * scale, yVal + yFactor * scale);
    xVal = xVal - xFactor * scale;
    yVal = yVal + yFactor * scale;

    double scale1 = 1;
    path.cubicTo(xVal, yVal, xVal - xFactor * scale1, yVal,
        xVal - scale1 * xFactor, yVal + yFactor * scale1);
    xVal = xVal - scale1 * xFactor;
    yVal = yVal + scale1 * yFactor;
    double scale2 = 1.2;
    path.cubicTo(xVal, yVal, xVal, yVal + yFactor * scale2,
        xVal + xFactor * scale2, yVal + yFactor * scale2);
    xVal = xVal + xFactor * scale2;
    yVal = yVal + yFactor * scale2;

    scale = 1.6;

    path.cubicTo(xVal, yVal, xVal + xFactor * scale, yVal,
        xVal + xFactor * scale, yVal + yFactor * scale);
    xVal = xVal + xFactor * scale;
    yVal = yVal + yFactor * scale;

    // TODO: Need to recreate a better later.
    // First point in curve
    // double test = 2.2;
    // path.cubicTo(xVal, yVal, xVal, yVal + yFactor * test, xVal - xFactor * test,
    //     yVal + yFactor * test);
    // xVal = xVal - xFactor * test;
    // yVal = yVal + yFactor * test;

    // test = 1;
    // path.cubicTo(xVal, yVal, xVal - xFactor * test, yVal, xVal - test * xFactor,
    //     yVal + yFactor * test);
    // xVal = xVal - test * xFactor;
    // yVal = yVal + test * yFactor;

    // path.cubicTo(xVal, yVal, xVal, yVal + yFactor * test, xVal + xFactor * test,
    //     yVal + yFactor * test);
    // xVal = xVal + xFactor * test;
    // yVal = yVal + yFactor * test;

    // test = 2.2;

    // path.cubicTo(xVal, yVal, xVal + xFactor * test, yVal, xVal + xFactor * test,
    //     yVal + yFactor * test);
    // xVal = xVal + xFactor * test;
    // yVal = yVal + yFactor * test;

    path.lineTo(xVal, height);
    path.lineTo(0, height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
