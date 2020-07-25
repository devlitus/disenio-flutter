import 'package:disenosheader/src/pages/slider_list_page.dart';
import 'package:disenosheader/src/pages/slideshow_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:disenosheader/src/theme/themechanger.dart';
import 'package:disenosheader/src/pages/launcher_page.dart';

void main() => runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeChanger(1),
        child: MyApp()
    )
);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final currentTheme = Provider.of<ThemeChanger>(context).currentTheme;
    return  MaterialApp(
      theme: currentTheme,
      debugShowCheckedModeBanner: false,
      title: 'Diseños App',
      home: OrientationBuilder(
        builder: (BuildContext context, Orientation orientation) {
          final screenSize = MediaQuery.of(context).size;
          return GridView.count(
            children: <Widget>[
              LauncherPage(),
              SlideshowPage(),
            ],
            // Create a grid with 2 columns in portrait mode, or 3 columns in
            // landscape mode.
            crossAxisCount: (orientation == Orientation.portrait) ? 1 : 2,
          );
        },
      ),
    );
  }
}
// LauncherPage();
// orientation == Orientation.portrait ? 1 : 2