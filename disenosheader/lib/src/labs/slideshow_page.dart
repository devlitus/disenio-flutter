import 'package:disenosheader/src/model/slider_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class SlideShowPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SliderModel(),
      child: Scaffold(
        body: Center(
          child: Column(
            children: <Widget>[
              Expanded(
                child: _Slides(),
              ),
              _Dots(),
            ],
          ),
        ),
      ),
    );
  }
}

class _Dots extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _Dot(0),
          _Dot(1),
          _Dot(2),
        ],
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  final int index;

  _Dot(this.index);

  @override
  Widget build(BuildContext context) {
    final pageViewIndex = Provider.of<SliderModel>(context).currentPage;
    return AnimatedContainer(
      duration: Duration(milliseconds: 100),
      width: 12,
      height: 12,
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: (pageViewIndex >= index - 0.5 && pageViewIndex < index + 0.5) ? Colors.redAccent : Colors.grey,
        shape: BoxShape.circle,
      ),
    );
  }
}

class _Slides extends StatefulWidget {
  @override
  __SlidesState createState() => __SlidesState();
}

class __SlidesState extends State<_Slides> {
  final pageViewController = PageController();

  @override
  void initState() {
    super.initState();
    pageViewController.addListener(() {
      Provider.of<SliderModel>(context, listen: false).currentPage =
          pageViewController.page;
    });
  }

  @override
  void dispose() {
    super.dispose();
    pageViewController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: PageView(
        controller: pageViewController,
        children: <Widget>[
          _Slide(svg: 'assets/slide-1.svg'),
          _Slide(svg: 'assets/slide-2.svg'),
          _Slide(svg: 'assets/slide-3.svg'),
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final String svg;

  const _Slide({@required this.svg});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.all(30),
      child: SvgPicture.asset(svg),
    );
  }
}
