import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:view_page/design/textfont.dart';

class labelColor extends StatelessWidget {
  final String text;
  const labelColor(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 30.0),
      child: Row(
        children: [
          const Textfont("Etiket"),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: TextFormField(
              initialValue: text,
              style: GoogleFonts.rubik(
                textStyle: const TextStyle(
                  fontSize: 18,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
              ),
              readOnly: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
          ),
          const SizedBox(width: 20),
          const Textfont("Renk"),
          const SizedBox(width: 10),
          const CircleAvatar(
            radius: 25,
            backgroundColor: Colors.red,
          ),
        ],
      ),
    );
  }
}
