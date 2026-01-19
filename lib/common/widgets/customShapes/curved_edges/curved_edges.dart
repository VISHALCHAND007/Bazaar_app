import 'package:flutter/material.dart';

class CustomCurvedEdges extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    //starting from left: here size is the size of the widget using this class
    path.lineTo(0, size.height);

    //first curve: left
    final leftCurveStart = Offset(0, size.height - 20);
    final leftCurveEnd = Offset(30, size.height - 20);
    path.quadraticBezierTo(
      leftCurveStart.dx,
      leftCurveStart.dy,
      leftCurveEnd.dx,
      leftCurveEnd.dy,
    );

    //drawing middle line
    final lineStart = Offset(30, size.height - 20);
    final lineEnd = Offset(size.width - 30, size.height - 20);
    path.quadraticBezierTo(lineStart.dx, lineStart.dy, lineEnd.dx, lineEnd.dy);

    //last curve
    final rightCurveStart = Offset(size.width, size.height - 20);
    final rightCurveEnd = Offset(size.width, size.height);
    path.quadraticBezierTo(
      rightCurveStart.dx,
      rightCurveStart.dy,
      rightCurveEnd.dx,
      rightCurveEnd.dy,
    );

    //end
    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
