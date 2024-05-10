import 'package:flutter/material.dart';

import '../textfont.dart';
import 'view_textstyle.dart';

class AgainTime extends StatelessWidget {
  final String hour;
  final String minute;
  final String second;

  const AgainTime(this.minute, this.hour, this.second, {super.key});

  @override
  Widget build(Object context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
        child: Row(children: [
          const Icon(Icons.alarm),
          const Textfont("Tekrar"),
          const SizedBox(
            width: 10,
          ),
          TimeText(hour),
          const SizedBox(width: 10),
          const Textfont(":"),
          const SizedBox(width: 10),
          TimeText(minute),
          const SizedBox(width: 10),
          const Textfont(":"),
          const SizedBox(width: 10),
          TimeText(second),
        ]));
  }

  // ignore: non_constant_identifier_names
  Widget TimeText(String time) {
    return Expanded(
      child: TextFormField(
        initialValue: time,
        readOnly: true,
        style: CustomTextStyle.rubikTextStyle(),
        decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide:
                  const BorderSide(color: Color(0xFFC1007F), width: 10)),
        ),
      ),
    );
  }
}
