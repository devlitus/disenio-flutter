import 'package:disenosheader/src/widgets/radial_progress.dart';
import 'package:flutter/material.dart';

class GraficasCircularesPage extends StatefulWidget {
  @override
  _GraficasCircularesPageState createState() => _GraficasCircularesPageState();
}

class _GraficasCircularesPageState extends State<GraficasCircularesPage> {
  double porcentaje = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.refresh),
          onPressed: () {
            setState(() {
              porcentaje += 10;
              if (porcentaje > 100) {
                porcentaje = 0.0;
              }
            });
          },
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                CustomRadialProgress(porcentaje: porcentaje, color: Colors.greenAccent,),
                CustomRadialProgress(porcentaje: porcentaje, color: Colors.orangeAccent,),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                CustomRadialProgress(porcentaje: porcentaje, color: Colors.pinkAccent,),
                CustomRadialProgress(porcentaje: porcentaje, color: Colors.purpleAccent,),
              ],
            ),
          ],
        ));
  }
}

class CustomRadialProgress extends StatelessWidget {
  final double porcentaje;
  final Color color;

  const CustomRadialProgress({@required this.porcentaje, @required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      height: 180,
      child: RadialProgress(
        porcentaje: porcentaje,
        colorPrimary: color,
        colorSecondary: Colors.black,
        grosorPrimary: 4,
        grosorSecondary: 10,
      ),
    );
  }
}
