// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../color_options.dart';

// ignore: camel_case_types
class BG_w extends StatelessWidget {
  const BG_w({super.key});

  @override
  Widget build(BuildContext context) {
    final appColor = Provider.of<ColorProvider>(context).appColor;
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [appColor, const Color(0xFF000000)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter)),
    );
  }
}
