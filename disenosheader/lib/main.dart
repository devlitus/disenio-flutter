import 'package:flutter/material.dart';
//import 'package:disenosheader/src/pages/graficas_circulares_page.dart';
//import 'package:disenosheader/src/pages/header_page.dart';
import 'package:disenosheader/src/pages/slideshow_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Diseños App',
      home: SlideShowPage(),
    );
  }
}
