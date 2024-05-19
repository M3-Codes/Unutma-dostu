// ignore_for_file: camel_case_types
 
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class text_it extends StatelessWidget {
  final String text;
  final double fontsize;

  const text_it(
    this.text,
    this.fontsize, {
    super.key, 
  });

  @override
  Widget build(BuildContext context) {
    Widget content = Text(
      text,
      style: GoogleFonts.rubik(
        textStyle: TextStyle(
          fontSize: fontsize,
          color: text == "Yeni Ürün" ? Colors.white : Colors.black,
        ),
      ),
    );

    if (text == "Tarih") {
      content = Row(
        children: [
          content,
          const SizedBox(width: 40),
        ],
      );
    }
    return content;
  }
}
