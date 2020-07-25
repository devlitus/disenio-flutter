import 'package:disenosheader/src/theme/themechanger.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

import 'package:disenosheader/src/widgets/slideshow.dart';
import 'package:provider/provider.dart';

class SlideshowPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);
    return Scaffold(
//      backgroundColor: Colors.purpleAccent,
      body: Slideshow(
//          dotUp: true,
          colorPrimary: (appTheme.darkTheme) ? Color(0xffFF5A7E) : appTheme.currentTheme.accentColor,
//          colorSecondary: Colors.black,
        slides: <Widget>[
          SvgPicture.asset('assets/slide-1.svg'),
          SvgPicture.asset('assets/slide-2.svg'),
          SvgPicture.asset('assets/slide-3.svg'),
          SvgPicture.asset('assets/slide-4.svg'),
          SvgPicture.asset('assets/slide-5.svg'),
        ],
      ),
    );
  }
}
