import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextStyle {
  static TextStyle rubikTextStyle({
    double fontSize = 18,
    Color color = const Color.fromARGB(255, 11, 11, 11),
  }) {
    return GoogleFonts.rubik(
      textStyle: TextStyle(
        fontSize: fontSize,
        color: color,
      ),
    );
  }
}
