// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class TextForm extends StatelessWidget {
  final String hinttext;
  final TextEditingController ccontroller;
  const TextForm(
      {super.key, required this.hinttext, required this.ccontroller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: ccontroller,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        contentPadding:
            EdgeInsets.symmetric(vertical: 16, horizontal: 10), //*** */
        filled: true,
        fillColor: Colors.white,
        labelText: hinttext,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Color(0xFF4F3145))),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Color(0xFF4F3145))),
        prefixIcon: Icon(Icons.email),
      ),
    );
  }
}
