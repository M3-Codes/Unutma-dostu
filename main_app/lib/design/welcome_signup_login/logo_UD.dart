// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../color_options.dart';

// ignore: camel_case_types
class Logo_UD extends StatelessWidget {
  const Logo_UD({super.key});

  @override
  Widget build(BuildContext context) {
    final appColor = Provider.of<ColorProvider>(context).appColor;
    String colorName = 'Fuchsia'; // Default color name
    if (appColor == const Color(0xFFd32f2f)) {
      colorName = 'Red';
    } else if (appColor == const Color(0xFF4CAF50)) {
      colorName = 'Green';
    } else if (appColor == const Color(0xFF2196F3)) {
      colorName = 'Blue';
    } else if (appColor == const Color(0xFF00BCD4)) {
      colorName = 'Cyan';
    } else if (appColor == const Color(0xFF9C27B0)) {
      colorName = 'Purple';
    } else if (appColor == const Color(0xFFC1007F)) {
      colorName = 'Fuchsia';
    }
    return Positioned(
        top: 70,
        child: Container(
            alignment: Alignment.center,
            width: 300,
            height: 150,
            decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(25)),
            child: Image.asset(
              "images/Logo$colorName.png",
            )));
  }
}
