import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:disenosheader/src/theme/themechanger.dart';
import 'package:disenosheader/src/widgets/headers.dart';

class HeaderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;
    return Scaffold(
      body: HeaderWave(color: appTheme.accentColor,),
    );
  }
}
