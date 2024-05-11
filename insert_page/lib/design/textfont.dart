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
    return Text(
      text,
      style: GoogleFonts.rubik(
        textStyle: TextStyle(
          fontSize: fontsize,
          color: text == "Yeni Ürün" ? const Color(0xFFC1007F) : Colors.black,
        ),
      ),
    );
  }
}
