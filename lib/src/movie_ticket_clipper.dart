import 'package:flutter/material.dart';

class MovieTicketClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    // Arranca desde la punta topLeft
    Path path = Path();
    path.lineTo(0.0, size.height);
    // Inicio de las puntas
    double x = 0;
    // Altura inicial de las puntas
    double y = size.height;
    // Altura de control point. Por aca se va a hacer la curva
    double yControlPoint = size.height * .88;
    // El width que se va a ir corriendo por cada linea
    double increment = size.width / 15;

    while (x < size.width) {
      // La curva va a iniciar en x y terminar en x+increment.
      // Y le digo que el punto de la curva tiene que ser en x + la mitad de increment (punto de control x)
      path.quadraticBezierTo(
          x + increment / 2, yControlPoint, x + increment, y);
      x += increment;
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
