import 'package:flutter/material.dart';

class WaveClipperOne extends CustomClipper<Path> {
  @override
    Path getClip(Size size) {
      Offset firstEndPoint = Offset(size.width * .5,size.height-20);
      Offset firstControlPoint = Offset(size.width * .25,size.height-30);
      Offset secondEndPoint = Offset(size.width,size.height - 50);
      Offset secondControlPoint = Offset(size.width * .75,size.height-10);

      final path = Path()
        ..lineTo(0.0, size.height)
        ..quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy, firstEndPoint.dx, firstEndPoint.dy)
        ..quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy, secondEndPoint.dx, secondEndPoint.dy)
        ..lineTo(size.width, 0.0)
        ..close();
      return path;
    }

  @override
    bool shouldReclip(CustomClipper<Path> oldClipper) {
      return true;
    }
}