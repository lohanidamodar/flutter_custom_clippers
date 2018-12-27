import 'package:flutter/material.dart';

class WaveClipperOne extends CustomClipper<Path> {
  bool reverse;

  WaveClipperOne({this.reverse=false});

  @override
    Path getClip(Size size) {

      if(!reverse) {
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
      }else {
        Offset firstEndPoint = Offset(size.width * .5,20);
        Offset firstControlPoint = Offset(size.width * .25,30);
        Offset secondEndPoint = Offset(size.width,50);
        Offset secondControlPoint = Offset(size.width * .75,10);

        final path = Path()
          ..quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy, firstEndPoint.dx, firstEndPoint.dy)
          ..quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy, secondEndPoint.dx, secondEndPoint.dy)
          ..lineTo(size.width, size.height)
          ..lineTo(0.0, size.height)
          ..close();
        return path;
      }

    }

  @override
    bool shouldReclip(CustomClipper<Path> oldClipper) {
      return true;
    }
}