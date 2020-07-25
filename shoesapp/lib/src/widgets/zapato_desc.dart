import 'package:flutter/material.dart';

class ZapatoDescription extends StatelessWidget {
  final String titulo;
  final String description;

  const ZapatoDescription({this.titulo, this.description});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 10),
          Text(this.titulo, style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),),
          SizedBox(height: 10),
          Text(this.description, style: TextStyle(color: Colors.black54, height: 1.6))
        ],
      ),
    );
  }
}
