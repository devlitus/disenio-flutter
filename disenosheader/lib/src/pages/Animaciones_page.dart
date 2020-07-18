import 'package:flutter/material.dart';
import 'dart:math' as Math;

import 'package:flutter/widgets.dart';

class AnimacionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _CuadradoAnimado(),
      ),
    );
  }
}

class _CuadradoAnimado extends StatefulWidget {
  @override
  __CuadradoAnimadoState createState() => __CuadradoAnimadoState();
}

class __CuadradoAnimadoState extends State<_CuadradoAnimado>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation<double> rotation;
  Animation<double> opacity;
  Animation<double> opacityOut;
  Animation<double> movieRight;
  Animation<double> agrandar;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 4000));
    rotation = Tween(begin: 0.0, end: 2 * Math.pi).animate(CurvedAnimation(
      parent: animationController,
      curve: Curves.easeOut,
    ));
    opacity = Tween(begin: 0.1, end: 1.0).animate(CurvedAnimation(
      parent: animationController,
      curve: Interval(0, 0.25, curve: Curves.easeOut),
    ));
    animationController.addListener(() {
      if (animationController.status == AnimationStatus.completed) {
//        animationController.reverse();
//        animationController.repeat();
        animationController.reset();
      }
    });
    movieRight = Tween(begin: 0.0, end: 160.0).animate(CurvedAnimation(
      parent: animationController,
      curve: Curves.easeOut,
    ));
    agrandar = Tween(begin: 0.0, end: 2.0).animate(CurvedAnimation(
      parent: animationController,
      curve: Curves.easeOut,
    ));
    opacityOut = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
      parent: animationController,
      curve: Interval(0.75, 1),
    ));
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    animationController.forward();
    return AnimatedBuilder(
      animation: animationController,
      child: _Rectangulo(),
      builder: (BuildContext context, Widget childRectangulo) {
        return Transform.translate(
          offset: Offset(movieRight.value, 0.0),
          child: Transform.rotate(
            angle: rotation.value,
            child: Opacity(
              opacity: opacity.value - opacityOut.value,
              child: Transform.scale(
                scale: agrandar.value,
                child: childRectangulo
              ),
            ),
          ),
        );
      },
    );
  }
}

class _Rectangulo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(color: Colors.blue),
    );
  }
}
