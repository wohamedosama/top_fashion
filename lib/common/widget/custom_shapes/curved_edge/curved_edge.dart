import 'package:flutter/cupertino.dart';

class CustomCurvedEdges extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height);
    final fistCurve = Offset(0, size.height - 20);
    final lastCurve = Offset(30, size.height - 20);
    path.quadraticBezierTo(
      fistCurve.dx,
      fistCurve.dy,
      lastCurve.dx,
      lastCurve.dy,
    );

    final secondFistCurve = Offset(0, size.height - 20);
    final secondLastCurve = Offset(size.width - 30, size.height - 20);

    path.quadraticBezierTo(
      secondFistCurve.dx,
      secondFistCurve.dy,
      secondLastCurve.dx,
      secondLastCurve.dy,
    );

    final thirdFistCurve = Offset(size.width, size.height - 20);
    final thirdLastCurve = Offset(size.width, size.height);

    path.quadraticBezierTo(
      thirdFistCurve.dx,
      thirdFistCurve.dy,
      thirdLastCurve.dx,
      thirdLastCurve.dy,
    );
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
