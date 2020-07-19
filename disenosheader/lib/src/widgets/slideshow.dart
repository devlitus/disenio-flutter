import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Slideshow extends StatelessWidget {
  final List<Widget> slides;
  final bool dotUp;
  final Color colorPrimary;
  final Color colorSecondary;

  const Slideshow({
    this.slides,
    this.dotUp = false,
    this.colorPrimary = Colors.redAccent,
    this.colorSecondary = Colors.grey
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _SlideshowModel(),
      child: SafeArea(
        child: Center(
          child: Builder(
            builder: (BuildContext context) {
              Provider.of<_SlideshowModel>(context).colorPrimary = this.colorPrimary;
              Provider.of<_SlideshowModel>(context).colorSecondary = this.colorSecondary;
              return _CrearStructuraSlideshow(dotUp: dotUp, slides: slides);
            },
          ),
        ),
      ),
    );
  }
}
class _CrearStructuraSlideshow extends StatelessWidget {
  final List<Widget> slides;
  final bool dotUp;


  const _CrearStructuraSlideshow({
    @required this.slides,
    @required this.dotUp,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        if (this.dotUp) _Dots(this.slides.length),
        Expanded(
          child: _Slides(slides: slides),
        ),
        if (!this.dotUp) _Dots(this.slides.length),
      ],
    );
  }
}


class _Dots extends StatelessWidget {
  final int totalSlides;

  const _Dots(this.totalSlides);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(this.totalSlides, (index) => _Dot(index)),
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  final int index;
  _Dot(this.index);

  @override
  Widget build(BuildContext context) {
    final slideshowModel = Provider.of<_SlideshowModel>(context);
    return AnimatedContainer(
      duration: Duration(milliseconds: 100),
      width: 12,
      height: 12,
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: (slideshowModel.currentPage >= index - 0.5 && slideshowModel.currentPage < index + 0.5)
            ? slideshowModel.colorPrimary
            : slideshowModel.colorSecondary,
        shape: BoxShape.circle,
      ),
    );
  }
}

class _Slides extends StatefulWidget {
  final List<Widget> slides;

  const _Slides({this.slides});

  @override
  __SlidesState createState() => __SlidesState();
}

class __SlidesState extends State<_Slides> {
  final pageViewController = PageController();

  @override
  void initState() {
    super.initState();
    pageViewController.addListener(() =>
        Provider.of<_SlideshowModel>(context, listen: false).currentPage =
            pageViewController.page);
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
        children: widget.slides
            .map((slide) => _Slide(
                  slide: slide,
                ))
            .toList(),
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final Widget slide;

  const _Slide({@required this.slide});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.all(30),
      child: slide,
    );
  }
}
class _SlideshowModel with ChangeNotifier{
  double _currentPage = 0;
  Color _colorPrimary = Colors.redAccent;
  Color _colorSecondary = Colors.grey;

  double get currentPage => this._currentPage;
  set currentPage(double currentPage) {
    this._currentPage = currentPage;
    notifyListeners();
  }
  Color get colorPrimary => this._colorPrimary;
  set colorPrimary(Color color) {
    this._colorPrimary = color;
//    notifyListeners();
  }
  Color get colorSecondary => this._colorSecondary;
  set colorSecondary(Color color) {
    this._colorSecondary = color;
//    notifyListeners();
  }
}