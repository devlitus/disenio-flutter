import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:disenosheader/src/pages/slideshow_page.dart';
import 'package:disenosheader/src/pages/emergency_page.dart';
import 'package:disenosheader/src/pages/graficas_circulares_page.dart';
import 'package:disenosheader/src/pages/header_page.dart';
import 'package:disenosheader/src/pages/pinteres_page.dart';
import 'package:disenosheader/src/pages/slider_list_page.dart';
import 'package:disenosheader/src/retos/cuadrado_animado_page.dart';

final pageRoute = <_Route>[
  _Route(FontAwesomeIcons.slideshare, 'Slideshow', SlideshowPage()),
  _Route(FontAwesomeIcons.ambulance, 'Emergency', EmergencyPage()),
  _Route(FontAwesomeIcons.heading, 'Headers', HeaderPage()),
  _Route(
      FontAwesomeIcons.peopleCarry, 'Cuadrado Animado', CuadradoAnimadoPage()),
  _Route(FontAwesomeIcons.circleNotch, 'Barras Progress',
      GraficasCircularesPage()),
  _Route(FontAwesomeIcons.pinterest, 'Pinterest', PinteresPage()),
  _Route(FontAwesomeIcons.mobile, 'Slivers', SliderListPage()),
];

class _Route {
  final IconData icon;
  final String title;
  final Widget page;

  _Route(this.icon, this.title, this.page);
}
