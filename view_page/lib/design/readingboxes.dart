import 'package:flutter/material.dart';
import 'package:view_page/design/textfont.dart';

import 'view_textstyle.dart';

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
              style: CustomTextStyle.rubikTextStyle(),
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
