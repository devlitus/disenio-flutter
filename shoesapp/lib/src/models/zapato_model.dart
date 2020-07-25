import 'package:flutter/material.dart';

class ZapatoModel with ChangeNotifier {
  String _assetsImage = 'assets/imgs/azul.png';
  double _talla = 9.0;

  String get assetsImage => this._assetsImage;
  set assetsImage(String value) {
    this._assetsImage = value;
    notifyListeners();
  }

  double get talla => this._talla;
  set talla(double value) {
    this._talla = value;
    notifyListeners();
  }
}