import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:view_page/design/textfont.dart';

// ignore: camel_case_types
class readingboxes extends StatelessWidget {
  final String title;
  final String hintText;
  const readingboxes({required this.hintText, required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
      child: Row(
        children: [
          Textfont(title),
          const SizedBox(width: 20),
          Expanded(
            child: TextFormField(
              readOnly: true,
              initialValue: hintText,
              style: GoogleFonts.rubik(
                textStyle: const TextStyle(
                  fontSize: 18,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
              ),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(
                    color: Colors.black,
                    width: 5,
                  ),
                ),
                contentPadding: const EdgeInsets.all(10.0),
                hintText: hintText,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
