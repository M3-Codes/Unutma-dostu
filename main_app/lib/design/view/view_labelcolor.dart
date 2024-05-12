import 'package:flutter/material.dart';

import '../textfont.dart';
import 'view_textstyle.dart';

class labelColor extends StatelessWidget {
  final String text;
  const labelColor(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 30.0),
      child: Row(
        children: [
          const Textfont("Etiket", 20),
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
          const Textfont("Renk", 20),
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
