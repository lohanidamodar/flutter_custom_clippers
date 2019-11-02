import 'package:flutter/material.dart';

class PointsClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    // Arranca desde la punta topLeft
    Path path = Path();
    path.lineTo(0, size.height);
    // Inicio de las puntas
    double x = 0;
    // Altura inicial de las puntas
    double y = size.height;
    // El width que se va a ir corriendo por cada linea
    double increment = size.width / 20;

    while (x < size.width) {
      x += increment;
      // Si es igual a la altura le digo que suba, si no baja
      y = (y == size.height) ? size.height * .88 : size.height;
      path.lineTo(x, y);
    }
    path.lineTo(size.width, 0.0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper old) {
    return old != this;
  }
}
