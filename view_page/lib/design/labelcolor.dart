import 'package:flutter/material.dart';
import 'package:view_page/design/textfont.dart';

import 'view_textstyle.dart';

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
          const Textfont("Etiket"),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: TextFormField(
              initialValue: text,
              style: CustomTextStyle.rubikTextStyle(),
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
          CircleAvatar(
            radius: 25,
            backgroundColor: color,
          ),
        ],
      ),
    );
  }
}
