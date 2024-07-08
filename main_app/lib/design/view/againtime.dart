import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../generated/l10n.dart';
import '../textfont.dart';

class AgainTime extends StatelessWidget {
  final String hour;
  final String minute;
  final String second;

  const AgainTime(
      {required this.minute,
      required this.hour,
      required this.second,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
        child: Row(children: [
          Row(
            children: [
              const Icon(Icons.alarm),
              Textdesign(S.of(context).repeat, 20),
              const SizedBox(
                width: 10,
              ),
              TimeText(hour),
              const SizedBox(width: 8),
              const Textdesign(":", 20),
              const SizedBox(width: 8),
              TimeText(minute),
              const SizedBox(width: 8),
              const Textdesign(":", 20),
              const SizedBox(width: 8),
              TimeText(second),
            ],
          ),
          const Expanded(flex: 1, child: SizedBox()),
        ]));
  }

  // ignore: non_constant_identifier_names
  Widget TimeText(String time) {
    return SizedBox(
      width: 60,
      child: TextFormField(
        initialValue: time,
        readOnly: true,
        style: GoogleFonts.rubik(
          textStyle: const TextStyle(
            fontSize: 14,
            color: Color(0xFFC1007F),
          ),
        ),
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 5.0, horizontal: 8.0),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(color: Color(0xFFC1007F), width: 1)),
        ),
      ),
    );
  }
}
