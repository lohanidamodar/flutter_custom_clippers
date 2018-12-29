import 'package:flutter/material.dart';

class HexagonalClipper extends CustomClipper<Path> {
  final bool reverse;

  HexagonalClipper({this.reverse=false});

  @override
    Path getClip(Size size) {
      var oneThirdWidth = size.width / 3.0;
      var oneThirdHeight = size.height / 3.0;
      if(reverse){
        final path = Path()
          ..lineTo(0.0, oneThirdHeight)
          ..lineTo(0.0, oneThirdHeight*2)
          ..lineTo(size.width/2, size.height)
          ..lineTo(size.width, oneThirdHeight*2)
          ..lineTo(size.width, oneThirdHeight)
          ..lineTo(size.width/2, 0.0)
          ..lineTo(0.0, oneThirdHeight)
          ..close();
        return path;
      }else{
        final path = Path()
          ..lineTo(0.0, size.height/2)
          ..lineTo(oneThirdWidth, size.height)
          ..lineTo(oneThirdWidth*2, size.height)
          ..lineTo(size.width, size.height/2)
          ..lineTo(oneThirdWidth*2, 0.0)
          ..lineTo(oneThirdWidth, 0.0)
          ..lineTo(0.0, size.height/2)
          ..close();
        return path;
      }
    }

  @override
    bool shouldReclip(CustomClipper<Path> oldClipper) {
      return true;
    }
}