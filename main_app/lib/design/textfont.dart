import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Textdesign extends StatelessWidget {
  final String text;
  final double fontsize;
  final Color color;
  final FontWeight fontWeight;
  final TextAlign align;

  const Textdesign(
    this.text,
    this.fontsize, {
    this.color=Colors.black, // Opsiyonel olarak renk parametresi
    this.fontWeight = FontWeight.normal, // Varsayılan olarak FontWeight.normal kullanılıyor
    this.align = TextAlign.left,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        text,
        textAlign: align,
        style: GoogleFonts.rubik(
          textStyle: TextStyle(
            fontSize: fontsize,
            fontWeight: fontWeight, // Varsayılan kalınlık normal olarak belirlendi
            color: color,
          ),
        ),
      ),
    );
  }
}
