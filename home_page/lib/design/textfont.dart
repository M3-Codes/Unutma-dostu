import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Textfont extends StatelessWidget {
  final String text;
  const Textfont(this.text, {super.key});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        text,
        style: GoogleFonts.rubik(
          textStyle: const TextStyle(
            fontSize: 20,
            color: Color.fromARGB(255, 0, 0, 0),
          ),
        ),
      ),
    );
  }
}

class TitleTextFont extends StatelessWidget {
  final String text;
  const TitleTextFont(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        text,
        style: GoogleFonts.rubik(
          textStyle: const TextStyle(
            fontSize: 30,
            color: Color.fromARGB(255, 244, 239, 242),
          ),
        ),
      ),
    );
  }
}
