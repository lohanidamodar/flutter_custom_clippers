import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

enum Edge { TOP, RIGHT, BOTTOM, LEFT }

/// [ArrowClipper] that can be used with [ClipPath] to clip widget in Arrow shape

class ArrowClipper extends CustomClipper<Path> {
  ArrowClipper(this.triangleHeight, this.rectangleClipHeight, this.edge);

  /// The height of the triangle part of arrow in the [edge] direction
  final double triangleHeight;

  /// The height of the rectangle part of arrow that is clipped
  final double rectangleClipHeight;

  /// The edge the arrow points
  final Edge edge;

  @override
  Path getClip(Size size) {
    switch (edge) {
      case Edge.TOP:
        return _getTopPath(size);
      case Edge.RIGHT:
        return _getRightPath(size);
      case Edge.BOTTOM:
        return _getBottomPath(size);
      case Edge.LEFT:
        return _getLeftPath(size);
      default:
        return _getRightPath(size);
    }
  }

  Path _getTopPath(Size size) {
    var path = Path();
    path.moveTo(0.0, triangleHeight);
    path.lineTo(rectangleClipHeight, triangleHeight);
    path.lineTo(rectangleClipHeight, size.height);
    path.lineTo(size.width - rectangleClipHeight, size.height);
    path.lineTo(size.width - rectangleClipHeight, triangleHeight);
    path.lineTo(size.width, triangleHeight);
    path.lineTo(size.width / 2, 0.0);
    path.close();
    return path;
  }

  Path _getRightPath(Size size) {
    var path = Path();
    path.moveTo(0.0, rectangleClipHeight);
    path.lineTo(size.width - triangleHeight, rectangleClipHeight);
    path.lineTo(size.width - triangleHeight, 0.0);
    path.lineTo(size.width, size.height / 2);
    path.lineTo(size.width - triangleHeight, size.height);
    path.lineTo(size.width - triangleHeight, size.height - rectangleClipHeight);
    path.lineTo(0.0, size.height - rectangleClipHeight);
    path.close();
    return path;
  }

  Path _getBottomPath(Size size) {
    var path = Path();
    path.moveTo(rectangleClipHeight, 0.0);
    path.lineTo(rectangleClipHeight, size.height - triangleHeight);
    path.lineTo(0.0, size.height - triangleHeight);
    path.lineTo(size.width / 2, size.height);
    path.lineTo(size.width, size.height - triangleHeight);
    path.lineTo(size.width - rectangleClipHeight, size.height - triangleHeight);
    path.lineTo(size.width - rectangleClipHeight, 0.0);
    path.close();
    return path;
  }

  Path _getLeftPath(Size size) {
    var path = Path();
    path.moveTo(0.0, size.height / 2);
    path.lineTo(triangleHeight, size.height);
    path.lineTo(triangleHeight, size.height - rectangleClipHeight);
    path.lineTo(size.width, size.height - rectangleClipHeight);
    path.lineTo(size.width, rectangleClipHeight);
    path.lineTo(triangleHeight, rectangleClipHeight);
    path.lineTo(triangleHeight, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    ArrowClipper oldie = oldClipper as ArrowClipper;
    return triangleHeight != oldie.triangleHeight ||
        rectangleClipHeight != oldie.rectangleClipHeight ||
        edge != oldie.edge;
  }
}
