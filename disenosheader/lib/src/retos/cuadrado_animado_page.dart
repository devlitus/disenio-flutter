import 'package:flutter/material.dart';

class CuadradoAnimadoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: _CuadradoAnimado()),
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
  Animation<double> moverDerecha;
  Animation<double> moverArriba;
  Animation<double> moverIzquierda;
  Animation<double> moverAbajo;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 4500));
    moverDerecha = Tween(begin: 0.0, end: 100.0).animate(
      CurvedAnimation(parent: animationController, curve: Interval(0, 0.25, curve: Curves.bounceOut))
    );
    moverArriba = Tween(begin: 0.0, end: -100.0).animate(
        CurvedAnimation(parent: animationController, curve: Interval(0.25, 0.50, curve: Curves.bounceOut))
    );
    moverIzquierda = Tween(begin: 0.0, end: -100.0).animate(
        CurvedAnimation(parent: animationController, curve: Interval(0.50, 0.75, curve: Curves.bounceOut))
    );
    moverAbajo = Tween(begin: 0.0, end: 100.0).animate(
        CurvedAnimation(parent: animationController, curve: Interval(0.75, 1, curve: Curves.bounceOut))
    );
    animationController.addListener(() {
      if (animationController.status == AnimationStatus.completed) {
        animationController.reset();
      }
    });
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    animationController.forward();
    return AnimatedBuilder(
        animation: animationController,
        child: _Rectangulo(),
        builder: (BuildContext context, Widget child) {
          return Transform.translate(
            offset: Offset(moverDerecha.value + moverIzquierda.value, moverArriba.value + moverAbajo.value),
            child: child,
          );
        });
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
