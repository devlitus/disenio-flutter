import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:disenosheader/src/widgets/pinteres_menu.dart';

class PinteresPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _MenuModel(),
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            PinteresGrid(),
            _PinteresMenuLocation(),
          ],
        ),
      ),
    );
  }
}

class _PinteresMenuLocation extends StatelessWidget {
  const _PinteresMenuLocation();

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size.width;
    final mostrar = Provider.of<_MenuModel>(context).mostrar;
    return Positioned(
      bottom: 30,
      child: Container(
        width: screenSize,
        child: Align(
          child: PinteresMenu(
            mostrar: mostrar,
//            activeColor: Colors.yellowAccent,
//            inactiveColor: Colors.black,
//            backgroundColor: Colors.purpleAccent,
          items: [
            PinteresButton(
                icon: Icons.pie_chart_outlined,
                onPressed: () {
                  print('Icon pie chart outlined');
                }),
            PinteresButton(
                icon: Icons.search,
                onPressed: () {
                  print('Icon search');
                }),
            PinteresButton(
                icon: Icons.notifications,
                onPressed: () {
                  print('Icon notification');
                }),
            PinteresButton(
                icon: Icons.supervised_user_circle,
                onPressed: () {
                  print('Icon supervised user circle');
                }),
          ],
          ),
        ),
      ),
    );
  }
}

class PinteresGrid extends StatefulWidget {
  @override
  _PinteresGridState createState() => _PinteresGridState();
}

class _PinteresGridState extends State<PinteresGrid> {
  final List<int> item = List.generate(200, (index) => index);
  ScrollController scrollController = ScrollController();
  final scrollBefore = 0;

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      if (scrollController.offset > scrollBefore &&
          scrollController.offset > 150) {
        Provider.of<_MenuModel>(context, listen: false).mostrar = false;
      } else {
        Provider.of<_MenuModel>(context, listen: false).mostrar = true;
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new StaggeredGridView.countBuilder(
      controller: scrollController,
      crossAxisCount: 4,
      itemCount: item.length,
      itemBuilder: (BuildContext context, int index) => _PinteresItem(index),
      staggeredTileBuilder: (int index) =>
          new StaggeredTile.count(2, index.isEven ? 2 : 1),
      mainAxisSpacing: 2.0,
      crossAxisSpacing: 1.0,
    );
  }
}

class _PinteresItem extends StatelessWidget {
  final int index;

  const _PinteresItem(this.index);

  @override
  Widget build(BuildContext context) {
    return new Container(
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(30),
        ),
        child: new Center(
          child: new CircleAvatar(
            backgroundColor: Colors.white,
            child: new Text('$index'),
          ),
        ));
  }
}

class _MenuModel with ChangeNotifier {
  bool _mostrar = true;

  bool get mostrar => this._mostrar;

  set mostrar(bool value) {
    this._mostrar = value;
    notifyListeners();
  }
}
