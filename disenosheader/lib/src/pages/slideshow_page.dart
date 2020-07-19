import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

import 'package:disenosheader/src/widgets/slideshow.dart';

class SlideshowPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      backgroundColor: Colors.purpleAccent,
      body: Slideshow(
//          dotUp: true,
//          colorPrimary: Colors.purpleAccent,
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
