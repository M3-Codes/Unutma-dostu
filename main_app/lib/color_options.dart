import 'package:flutter/material.dart';

class ColorProvider extends ChangeNotifier {
  Color _appColor = const Color(0xFFC1007F); // Default color

  Color get appColor => _appColor;

  void updateColor(Color color) {
    _appColor = color;
    notifyListeners();
  }
}
