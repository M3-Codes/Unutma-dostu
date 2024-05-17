import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Textfont extends StatelessWidget {
  final String text;
  final double fontsize;
  const Textfont(this.text, this.fontsize, {super.key});

  Color color() {
    if (text == "Yeni Ürün") {
      return const Color(0xFFC1007F);
    } else if (fontsize == 30) {
      return const Color.fromARGB(255, 244, 239, 242);
    }
    return Colors.black;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        text,
        style: GoogleFonts.rubik(
          textStyle: TextStyle(
            fontSize: fontsize,
            color: color(),
          ),
        ),
      ),
    );
  }
}
