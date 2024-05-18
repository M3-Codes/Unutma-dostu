import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../textfont.dart';

class DayDate extends StatelessWidget {
  final String day;
  final String month;
  final String year;

  const DayDate(
      {required this.month, required this.day, required this.year, super.key});

  @override
  Widget build(Object context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 30.0),
        child: Row(children: [
          const Icon(Icons.calendar_month),
          const Textfont("Tarih ", 20),
          const SizedBox(
            width: 10,
          ),
          TimeText(day),
          const SizedBox(width: 20),
          TimeText(month),
          const SizedBox(width: 20),
          TimeText(year),
        ]));
  }

  // ignore: non_constant_identifier_names
  Widget TimeText(String time) {
    return Expanded(
      child: TextFormField(
        initialValue: time,
        readOnly: true,
        style: GoogleFonts.rubik(
          textStyle: const TextStyle(
            fontSize: 18,
            color: Color.fromARGB(255, 253, 253, 253),
          ),
        ),
        decoration: InputDecoration(
          filled: true,
          fillColor: const Color(0xFFC1007F),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide:
                  const BorderSide(color: Color(0xFFC1007F), width: 10)),
        ),
      ),
    );
  }
}
