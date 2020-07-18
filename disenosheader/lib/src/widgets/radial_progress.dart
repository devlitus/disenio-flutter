import 'dart:math';
import 'package:flutter/material.dart';

class RadialProgress extends StatefulWidget {
  final porcentaje;
  final Color colorPrimary;
  final Color colorSecondary;
  final double grosorPrimary;
  final double grosorSecondary;

  RadialProgress({
    @required this.porcentaje,
    this.colorPrimary = Colors.blue,
    this.colorSecondary = Colors.pink,
    this.grosorPrimary = 10,
    this.grosorSecondary = 4.0,
  });

  @override
  _RadialProgressState createState() => _RadialProgressState();
}

class _RadialProgressState extends State<RadialProgress>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  double porcentajeAnterior;

  @override
  void initState() {
    super.initState();
    porcentajeAnterior = widget.porcentaje;
    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 200));
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    animationController.forward(from: 0.0);
    final diferenciaAnimar = widget.porcentaje - porcentajeAnterior;
    porcentajeAnterior = widget.porcentaje;
    return AnimatedBuilder(
      animation: animationController,
      builder: (BuildContext context, Widget child) {
        return Container(
          padding: EdgeInsets.all(10),
          width: double.infinity,
          height: double.infinity,
          child: CustomPaint(
            painter: _MiRadialProgress(
              (widget.porcentaje - diferenciaAnimar) +
                  (diferenciaAnimar * animationController.value),
              widget.colorPrimary,
              widget.colorSecondary,
              widget.grosorPrimary,
              widget.grosorSecondary,
            ),
          ),
        );
      },
    );
  }
}

class _MiRadialProgress extends CustomPainter {
  final porcentaje;
  final Color colorPrimary;
  final Color colorSecondary;
  final double grosorSecoandary;
  final double grosorPrimary;

  _MiRadialProgress(this.porcentaje, this.colorPrimary, this.colorSecondary, this.grosorSecoandary, this.grosorPrimary);

  @override
  void paint(Canvas canvas, Size size) {
    final Rect rect = Rect.fromCircle(center: Offset(0.0, 0.0), radius: 180);
    final Gradient gradient = LinearGradient(colors: <Color>[
      Color(0xffc012FF),
      Color(0xff6D05E8),
      Colors.red
    ]);
    // Circulo completado
    final paint = Paint()
      ..strokeWidth = grosorSecoandary
      ..color = colorSecondary
      ..style = PaintingStyle.stroke;
    final Offset center = Offset(size.width / 2, size.height / 2);
    final double radius = min(size.width * 0.5, size.height * 0.5);
    canvas.drawCircle(center, radius, paint);

    // Arco
    final paintArc = Paint()
      ..strokeWidth = grosorPrimary
//      ..color = colorPrimary
      ..shader = gradient.createShader(rect)
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;
    // Parte que se deberá ir llenando
    double arcAngle = 2 * pi * (porcentaje / 100);
    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), -pi / 2,
        arcAngle, false, paintArc);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
