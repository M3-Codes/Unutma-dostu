import 'package:flutter/material.dart';
import 'package:view_page/design/textfont.dart';

class Imagesbutton extends StatelessWidget {
  final String text;
  const Imagesbutton(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: const BorderSide(color: Colors.black87, width: 3))),
      child: Textfont(text),
    );
  }
}
