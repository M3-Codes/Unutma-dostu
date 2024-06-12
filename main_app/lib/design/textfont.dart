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
    this.color=Colors.black, 
    this.fontWeight = FontWeight.normal,
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
            fontWeight: fontWeight, 
            color: color,
          ),
        ),
      ),
    );
  }
}
