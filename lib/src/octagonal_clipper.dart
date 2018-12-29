import 'package:flutter/material.dart';

class OctagonalClipper extends CustomClipper<Path> {
  @override
    Path getClip(Size size) {
      var oneThirdHeight = size.height / 3.0;
      var oneThirdWidth = size.width / 3.0;
      final path = Path()
        ..lineTo(0.0, oneThirdHeight)
        ..lineTo(0.0, oneThirdHeight*2)
        ..lineTo(oneThirdWidth, size.height)
        ..lineTo(oneThirdWidth*2, size.height)
        ..lineTo(size.width, oneThirdHeight*2)
        ..lineTo(size.width, oneThirdHeight)
        ..lineTo(oneThirdWidth*2, 0.0)
        ..lineTo(oneThirdWidth, 0.0)
        ..lineTo(0.0, oneThirdHeight)
        ..close();
      return path;
    }

  @override
    bool shouldReclip(CustomClipper<Path> oldClipper) {
      return true;
    }
}