import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../textfont.dart';

// ignore: camel_case_types
class labelColor extends StatelessWidget {
  final Color color;
  final String text;
  const labelColor({required this.text, required this.color, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 30.0),
      child: Row(
        children: [
          const Textfont("Etiket     ", 20),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: TextFormField(
              initialValue: text,
              style: GoogleFonts.rubik(
                textStyle: const TextStyle(
                  fontSize: 14,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
              ),
              readOnly: true,
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 5.0, horizontal: 8.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide:
                      const BorderSide(color: Color(0xFFC1007F), width: 1),
                ),
              ),
            ),
          ),
          const SizedBox(width: 20),
          const Textfont("Renk", 20),
          const SizedBox(width: 10),
          CircleAvatar(
            radius: 25,
            backgroundColor: color,
          ),
        ],
      ),
    );
  }
}
