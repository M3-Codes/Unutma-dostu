import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../color_options.dart';

class ChangePage extends StatelessWidget {
  final String path;
  final String firstText;
  final String lastText;
  const ChangePage(
      {super.key,
      required this.path,
      required this.firstText,
      required this.lastText});

  @override
  Widget build(BuildContext context) {
    final appColor = Provider.of<ColorProvider>(context).appColor;
    return InkWell(
      onTap: () {
        Navigator.pushReplacementNamed(context, path);
      },
      child: Center(
        child: Text.rich(TextSpan(children: [
          TextSpan(text: firstText, style: const TextStyle(fontSize: 16)),
          TextSpan(
              text: lastText,
              style: TextStyle(
                  color: appColor, fontSize: 15, fontWeight: FontWeight.bold)),
        ])),
      ),
    );
  }
}
