import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class CircularProgressPage extends StatefulWidget {
  @override
  _CircularProgressPageState createState() => _CircularProgressPageState();
}

class _CircularProgressPageState extends State<CircularProgressPage>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  double porcentaje = 0.0;
  double nuevoPorcentaje = 0.0;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 800));
    animationController.addListener(() {
      setState(() {
        porcentaje =
            lerpDouble(porcentaje, nuevoPorcentaje, animationController.value);
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.refresh),
          backgroundColor: Colors.pink,
          onPressed: () {
            setState(() {
              porcentaje = nuevoPorcentaje;
              nuevoPorcentaje += 10;
              if (nuevoPorcentaje > 100) {
                nuevoPorcentaje = 0;
                porcentaje = 0.0;
              }
              animationController.forward(from: 0.0);
            });
          },
        ),
        body: Center(
          child: Container(
            padding: EdgeInsets.all(5),
            width: 300,
            height: 300,
            child: CustomPaint(
              painter: _MiRadialProgress(porcentaje),
            ),
          ),
        ));
  }
}

class _MiRadialProgress extends CustomPainter {
  final porcentaje;

  _MiRadialProgress(this.porcentaje);

  @override
  void paint(Canvas canvas, Size size) {
    // Circulo completado
    final paint = Paint()
      ..strokeWidth = 5
      ..color = Colors.grey
      ..style = PaintingStyle.stroke;
    final Offset center = Offset(size.width / 2, size.height / 2);
    final double radius = min(size.width * 0.5, size.height * 0.5);
    canvas.drawCircle(center, radius, paint);

    // Arco
    final paintArc = Paint()
      ..strokeWidth = 10
      ..color = Colors.pink
      ..style = PaintingStyle.stroke;
    // Parte que se deberá ir llenando
    double arcAngle = 2 * pi * (porcentaje / 100);
    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), -pi / 2,
        arcAngle, false, paintArc);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
